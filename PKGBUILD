# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-audit'
pkgver=0.1
pkgrel=1
pkgdesc='A pass extension for auditing your password repository.'
arch=('any')
url='https://github.com/roddhjav/pass-audit'
license=('GPL3')
depends=('pass' 'python' 'python-requests')
source=(https://github.com/roddhjav/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        https://github.com/roddhjav/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc)
sha512sums=('3ffc3ef64145f7eb7236804dcce710fe240fe1665a59e850509d17466d1c6b4ffc58d7d3143545f29a4b7d572aa4f8fd332cd4cbe54f8dac4479cb119a015172'
'3c748b4c30ac6ea6a7cfcac11dc43711e403bcdcc1c0132aee923c2608c00030bb695dc9edaa90136ff1f99c99667b7bb2d0c6a7f4c9f2451c7d0233c4375a54')

# The public key is found at https://pujol.io/keys
# gpg --recv-keys 06A26D531D56C42D66805049C5469996F0DF68EC
validpgpkeys=('06A26D531D56C42D66805049C5469996F0DF68EC')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
