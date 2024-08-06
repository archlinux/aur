# Maintainer: Nicolás Celedón-Hernández <coriollis.nch at gmail dot com>

pkgname=python-markdown-include
_name=${pkgname#python-}
pkgver=0.8.1
pkgrel=2
pkgdesc="Provides syntax for Python-Markdown for the inclusion of other Markdown documents"
arch=(any)
url="https://github.com/cmacmackin/markdown-include"
license=('GPL-3.0-only')
depends=('python-markdown')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1d0623e0fc2757c38d35df53752768356162284259d259c486b4ab6285cdbbe3')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
