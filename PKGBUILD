# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: casa <sympho08@yandex.ru>

pkgname=mednaffe
pkgver=0.8.9.1
_commit=1d87c53c66d1cbd2017c6d3ca0c61c0486d3787d
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
