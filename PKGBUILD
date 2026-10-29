# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-system76-power
pkgver=51
pkgrel=1
pkgdesc="GNOME shell extension for System76 Power Management"
arch=('any')
url="https://gitlab.com/LFd3v/gnome-shell-extension-system76-power"
license=('MIT')
depends=(
  'gnome-shell'
  'system76-power'
)
makedepends=(
  'git'
  'typescript'
)
source=("git+https://gitlab.com/LFd3v/gnome-shell-extension-system76-power.git#tag=v$pkgver")
sha256sums=('46f85493f2b8ef3375badc8352af5306ecb9d26048bcc940435a03f0446ff88a')

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
