# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-import'
pkgver=2.3
pkgrel=1
pkgdesc='A pass extension for importing data from most of the existing password manager.'
arch=('any')
url='https://github.com/roddhjav/pass-import'
license=('GPL3')
depends=('pass' 'python' 'python-defusedxml')
source=(https://github.com/roddhjav/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        https://github.com/roddhjav/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc)
sha512sums=('2c34e59b987b7265a12950e30992a2932d83a043a9a0d4329943e4d76bfe7823fbfdb0a5755a027e21afe5f49ec7d47242bba35a2ae6c90f654a64eaf2d5f8d8'
'a0330066b82ef9d8784006ced025faa8bae309b1b41bdef76eb586c84abdd6a5ee4f40fb0721fe1fe428c3a14a5aba5017ace7df439b73778a27b8c303bb20da')

# The public key is found at https://pujol.io/keys
# gpg --recv-keys 06A26D531D56C42D66805049C5469996F0DF68EC
validpgpkeys=('06A26D531D56C42D66805049C5469996F0DF68EC')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
