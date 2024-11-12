# Maintainer: dsoyet <dsoyet@outlook.com>

pkgname=sshpass-totp
pkgver=r64
pkgrel=2
pkgdesc="A tool for non-interactivly performing password authentication"
arch=('i686' 'x86_64')
url="https://github.com/dora38/sshpass"
license=('GPL')
depends=('glibc' 'openssh')
makedepends=('base-devel')
provides=("sshpass=$pkgver")
conflicts=('sshpass')
source=("git+https://github.com/dora38/sshpass.git")
sha256sums=('SKIP')

build() {
  cd "sshpass"

  ./bootstrap
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "sshpass"

  #make check
}

package() {
  cd "sshpass"

  make DESTDIR="$pkgdir" install
}
