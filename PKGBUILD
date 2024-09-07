pkgname=eudev
pkgver=3.2.11
pkgrel=1
pkgdesc="eudev is a fork of udev for the Gentoo project, But this one will install eudev on your System"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/gentoo/eudev"
license=('GPL2')
depends=('glibc')
source=("git+https://github.com/gentoo/eudev.git")
md5sums=('SKIP')  # Skip checksum verification as the source is fetched from Git

build() {
  cd "$srcdir/eudev"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/eudev"
  make DESTDIR="$pkgdir" install
}

