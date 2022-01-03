# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: casa <sympho08@yandex.ru>

pkgname=mednaffe
pkgver=0.9.2
_commit=907f0fd7e49876c52ed230a2bf40f4bf2f21c440
pkgrel=1
pkgdesc="front-end (GUI) for mednafen emulator"
arch=('i686' 'x86_64')
url="https://github.com/AmatCoder/mednaffe"
license=('GPL')
depends=('mednafen' 'gtk3')
makedepends=('git')
source=("git+https://github.com/AmatCoder/mednaffe.git#commit=$_commit")
sha1sums=('SKIP')

build() {
  cd "$srcdir"/$pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname
  make prefix="$pkgdir"/usr install
}
