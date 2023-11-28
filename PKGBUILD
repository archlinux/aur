# Maintainer: Ondřej Hošek <ondra.hosek@gmail.com>
_name=md-toc
_name_underscore=md_toc
pkgname=python-md-toc
pkgver=8.2.2
pkgrel=1
pkgdesc="Markdown Table of Contents for Python"
arch=('any')
url="https://blog.franco.net.eu.org/software/#md-toc"
license=('GPL-3.0-or-later')
depends=('python-fpyutils')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name_underscore-$pkgver.tar.gz")
b2sums=('991422c7ade129cd71483e2b37d14aac59f8d08c941ae33d1d1a065af14766f7fef1de9cb4687bd2ee64a5fddc9d64297fd95add63bf468f87e2bdc8b021a3d5')

build() {
	cd "${_name_underscore}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name_underscore}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
