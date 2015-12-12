# Maintainer: <kaptoxic _at_ yahoo _dot_ com >
# Contributor: <kaptoxic _at_ yahoo _dot_ com >
# original project: https://code.google.com/p/purple-gammu/
# updated fork: https://github.com/kaptoxic/purple-gammu

pkgname=purple-gammu
pkgver=0.3.1
pkgrel=1
pkgdesc="Purple Gammu, an SMS protocol for libpurple clients (pidgin)"
arch=('i686' 'x86_64')
url="https://github.com/kaptoxic/purple-gammu"
license=('GPLv2')
depends=('gammu' 'libpurple')
optdepends=('pidgin')
source=('repo::git+https://github.com/kaptoxic/purple-gammu.git')
sha512sums=('SKIP')

build() {
  cd "$srcdir/repo"
  make
}

package() {
  cd "$srcdir/repo"
  # installing plugin
  install -Dm755 libgammu.so "$pkgdir/usr/lib/purple-2/libgammu.so"
  # icons
  mkdir -p "$pkgdir/usr/share/pixmaps/pidgin/protocols/"
  cp -r icons/* "$pkgdir/usr/share/pixmaps/pidgin/protocols/"
  # license?
}
