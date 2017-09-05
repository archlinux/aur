# Contributor: Patrick Wozniak <email@patwoz.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=masterpassword-cli
pkgver=2.6
_hash=g895df637
pkgrel=1
pkgdesc='CLI version of Master Password'
arch=('i686' 'x86_64')
url='https://ssl.masterpasswordapp.com/'
license=('GPL3')
depends=('ncurses' 'json-c' 'libsodium')
makedepends=('libxml2' 'openssl')
optdepends=('xclip: copy password to clipboard')
source=("https://ssl.masterpasswordapp.com/mpw-${pkgver}-cli-1-0-${_hash}.tar.gz"{,.sig})
sha256sums=('1b7992dcab2538cfd403ccb8645d69ae419dfedbb03b38515508af3e814c8164'
            'SKIP')
validpgpkeys=('5C2D1D61853F20F2FCDDCCB70EF21226F43EA6BC') # Maarten Billemont

build() {
  targets="mpw mpw-tests" ./build
  ./mpw-tests
}

package() {
  /usr/bin/install -Dm755 mpw "$pkgdir/usr/bin/mpw"
}
