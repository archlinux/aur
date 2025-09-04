# Maintainer: 0fflineuser <0fflineuser@cock.li>
pkgname="magic-tape.sh-git"
_pkgname="magic-tape"
pkgver=1.3.4
pkgrel=4
pkgdesc="Magic-tape is an image supporting fuzzy finder command line interface YouTube client."
arch=('x86_64')
url="https://gitlab.com/christosangel/$_pkgname"
license=('GPL-2.0-or-later')
depends=('yt-dlp' 'bash>=4.2' 'curl' 'fzf' 'mpv' 'jq' 'xclip' 'dmenu' 'rofi')
install=proto.install
optdepends=('kitty: Image Support' 'chafa: Image Support' 'ueberzug: Image Support' 'ueberzugpp: Image Support')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('c0ec717fc7ff323b0e3d1507514bf4297ca0b9ec36626326cecb7f52abb9e62c')

prepare() {
	cd "$_pkgname-$pkgver"
}

package() {
	cd "$_pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/magic-tape/"
  cp -r png/ "$pkgdir/usr/share/magic-tape/"
  install -Dm644 "magic-tape.conf" "$pkgdir/etc/magic-tape.conf"
  install -Dm755 "magic-tape.sh" "$pkgdir/usr/bin/magic-tape.sh"
}
