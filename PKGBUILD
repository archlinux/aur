# Maintainer: stefanwimmer128 <info@stefanwimmer128.xyz>

pkgname=kf6-servicemenus-rootactions
pkgver=1.2.0
pkgrel=1
pkgdesc='Allows admin users to perform several root only actions from dolphin via polkit agent.'
arch=(any)
url='https://gitlab.com/stefanwimmer128/kf6-servicemenus-rootactions'
license=(GPL-2.0-or-later)
depends=(dolphin kdialog perl polkit)
makedepends=(git)
optdepends=(kate)
replaces=(kf5-servicemenus-rootactions kde-servicemenus-rootactions)
conflicts=(kf5-servicemenus-rootactions kde-servicemenus-rootactions)
source=("https://gitlab.com/stefanwimmer128/kf6-servicemenus-rootactions/-/releases/v$pkgver/downloads/kf6-servicemenus-rootactions-v$pkgver.tar.xz")
sha256sums=('ce174872385cf9ac413beb04610eeb2f51dddad3180b20852a9d09aa930a46af')

prepare() {
  cd "$pkgname-v$pkgver" || exit

  ./configure --prefix=/usr
}

build() {
  cd "$pkgname-v$pkgver" || exit

  make
}

check() {
  cd "$pkgname-v$pkgver" || exit

  make check
}

package() {
  cd "$pkgname-v$pkgver"

  make DESTDIR="$pkgdir" install
}
