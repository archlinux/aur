# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-import'
pkgver=2.0
pkgrel=1
pkgdesc='A pass extension for importing data from most of the existing password manager.'
arch=('any')
url='https://github.com/roddhjav/pass-import'
license=('GPL3')
depends=('pass' 'python' 'python-defusedxml')
source=(https://github.com/roddhjav/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        https://github.com/roddhjav/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc)
sha512sums=('b77b8521e0c32c986e2df070f01d17e9d8ee380e02f5dd49909f02eea774f526a0326491cffab595c7e639c48fd511054194a0165436fd885906b8e19350b7ac'
            '611aefc3fbb1cfa5fc643fa1f3aa117dc4f8030afd42dad63bb66d7a73ee8c51b798919fe2cb903eb2011429c86081e2161960032dc6dbd281153e4e29891217')

# The public key is found at https://pujol.io/keys
# gpg --recv-keys 06A26D531D56C42D66805049C5469996F0DF68EC
validpgpkeys=('06A26D531D56C42D66805049C5469996F0DF68EC')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
