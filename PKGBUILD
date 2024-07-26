# Maintainer: Jefferson Carneiro <slackjeff at slackjeff dot com dot br>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: hobi82 <hobi82@gmx.net>
# Contributor: Marius Nestor <marius softpedia com>

# Check for new version:
# curl -s https://flavio.tordini.org/musictube-ws/release.xml | tr -dc 0-9.

pkgname=musictube
pkgver=2.0
pkgrel=1
pkgdesc="YouTube streaming music player"
arch=('x86_64')
url="https://flavio.tordini.org/musictube"
license=('unknown')
depends=('qt5-declarative' 'qt5-x11extras' 'mpv')
source=("$pkgname-$pkgver.deb::https://flavio.tordini.org/files/$pkgname/$pkgname.deb")
sha256sums=('c0993bc31a5e528e39b57f2ac604de7c35c73bd292b191502c74d2bb30abe453')

package() {
  bsdtar -xvf data.tar.zst -C "$pkgdir"

  # Remove deprecated app menu
  rm -rf "$pkgdir/usr/share/menu"
}
