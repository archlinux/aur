# Maintainer: Raymond Wagenmaker <raymondwagenmaker@gmail.com>
pkgname=xss-lock
pkgver=0.3.0
_taghash=94aec045ffd6 # Bitbucket tarballs have silly names
pkgrel=2
pkgdesc="use external locker as X screen saver"
arch=(i686 x86_64)
url="https://bitbucket.org/raymonad/xss-lock"
license=('MIT')
depends=('xcb-util' 'systemd')
makedepends=('cmake' 'python-docutils')
optdepends=('bash-completion: for bash completion')
source=("https://bitbucket.org/raymonad/$pkgname/get/v$pkgver.tar.gz")
md5sums=('1c4836afb81d8ccd7cc29cf2588599b6')

build() {
  cd "$srcdir/raymonad-$pkgname-$_taghash"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/raymonad-$pkgname-$_taghash"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

