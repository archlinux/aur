# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >

pkgname=python-aniso8601
_pkgauthor=nielsenb
_pkgname=aniso8601
pkgver=2.0.0
pkgrel=2
pkgdesc="A library for parsing ISO 8601 strings"
arch=('any')
depends=('python' 'python-dateutil')
makedepends=('python-setuptools')
url="https://bitbucket.org/nielsenb/aniso8601"
license=('BSD')
options=(!emptydirs)
source=("https://bitbucket.org/${_pkgauthor}/${_pkgname}/get/v${pkgver}.tar.gz")
_commit=02f49ba734d6
md5sums=('9dde72e6b399a8ffb3c80edd25a79217')
sha256sums=('e070a1b211d19ed778eeedf7143bc95e8b0c60c6007c0a14411cc76e23ce9b1b')
sha512sums=('7d3de62f179cf683d1f2ed019d373e9c68a4957f13f79f5b4caa77f9cb7662e80110a3769df8935f701995c013dd2389ffe723648be8a7f06bf1a5648b47075a')

build() {
  cd ${_pkgauthor}-${_pkgname}-${_commit}

  msg2 'Building...'
  python setup.py build
}

package() {
  cd ${_pkgauthor}-${_pkgname}-${_commit}

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
