# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-import'
pkgver=2.2
pkgrel=1
pkgdesc='A pass extension for importing data from most of the existing password manager.'
arch=('any')
url='https://github.com/roddhjav/pass-import'
license=('GPL3')
depends=('pass' 'python' 'python-defusedxml')
source=(https://github.com/roddhjav/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        https://github.com/roddhjav/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc)
sha512sums=('9028c779dcfe7cf51b7ef011f334d0723504aeb341c6f1fde3fca4021bd4446dea8f1ee224230aa9cd9ad2c3a6d439f6beae56f88bb77443586c0667897791d5'
'1d86ad1c167b3af1a6e1620434bb0fae4c452a0bcfe0121134722b179b1ec524b7a9dfe79c7b076b851c9f503e037ad1dc9961f403714492b9c103a23c48441c')

# The public key is found at https://pujol.io/keys
# gpg --recv-keys 06A26D531D56C42D66805049C5469996F0DF68EC
validpgpkeys=('06A26D531D56C42D66805049C5469996F0DF68EC')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
