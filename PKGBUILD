# Maintainer: sfn

pkgname=python-pyseq
pkgver=0.9.0
pkgrel=1
pkgdesc="Python sequence string module"
arch=(any)
url="https://pyseq.rsgalloway.com/#"
license=('BSD-3-Clause ')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
source=("${pkgname}::git+https://github.com/rsgalloway/pyseq.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
