# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgname=python-histstat
_pkgname=histstat
pkgver=1.0.1
pkgrel=1
pkgdesc="History for netstat"
arch=('any')
url="https://github.com/vesche/histstat"
license=('MIT')
depends=('python-psutil')
source=("https://files.pythonhosted.org/packages/c0/9c/9d6597b867d9985a2ede0d724efbef6dea2be4ab651e64d44e4f4f510f55/histstat-${pkgver}.tar.gz")
sha256sums=('1e5c8791187a892c8f7897167eb17a9dfee41b82415090fe33528b5afae8895b')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_pkgname}-${pkgver}"
  python setup.py test
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
