# Maintainer: japm48 <japm48gh@gmail.com>

_pkgname=jsonmerge
pkgname=python-${_pkgname}

pkgver=1.7.0
pkgrel=1
arch=('any')

pkgdesc="Python module that allows merging a series of JSON documents into a single one"
url="https://github.com/avian2/jsonmerge"
license=('MIT')

depends=()
makedepends=(python-setuptools)

source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('60fec6660f706cf3bdc1869954066e499940f98dc15359b8a63a58067132fb20afef9e9d7773e27fb9f8332b220e6d4b63beae378bb87b061070bb07ee8f5bd5')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}



