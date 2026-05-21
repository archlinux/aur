# Maintainer: ReatCondisture <selobalton41123@gmail.com>
pkgname=zurufetch
pkgver=1.0.0
pkgrel=1
pkgdesc="7 farkli dille yazilmis, animasyonlu ve modern sistem bilgisi getirme araci"
arch=('x86_64' 'aarch64')
url="https://github.com/ReatCondisture/ZuruFetch"
license=('MIT')
depends=('glibc' 'gcc-libs' 'zsh' 'python')
makedepends=('cargo' 'go' 'gcc')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
