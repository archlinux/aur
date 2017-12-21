# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-import'
pkgver=2.1
pkgrel=1
pkgdesc='A pass extension for importing data from most of the existing password manager.'
arch=('any')
url='https://github.com/roddhjav/pass-import'
license=('GPL3')
depends=('pass' 'python' 'python-defusedxml')
source=(https://github.com/roddhjav/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        https://github.com/roddhjav/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc)
sha512sums=('73b3dd0e184fbf38885cceeadfd6ee9a8ae76af64920eeb734a59cffa13009c929c341f439c562ea8efb884f6c5b7c50fd2ed1bf8ccd4397b0d705172a218c12'
'c0b84baceb54495d7e8d37689e2b1ccc466cae1afe14c38e6900f0c32e1915ddaa77d0227450869a21074a589cbde4679b3b9ecafd46b1c77ab9205edc664221')

# The public key is found at https://pujol.io/keys
# gpg --recv-keys 06A26D531D56C42D66805049C5469996F0DF68EC
validpgpkeys=('06A26D531D56C42D66805049C5469996F0DF68EC')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
