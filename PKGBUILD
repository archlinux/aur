# Maintainer: Simon Gomizelj <simongmzlj@gmail.com>

pkgname=slack-chat
pkgver=1.1.5
pkgrel=1
pkgdesc="Slack Chat (Beta) for Linux"
arch=('x86_64' 'i686')
[ "$CARCH" = "i686"   ] && ARCH=i386
[ "$CARCH" = "x86_64" ] && ARCH=amd64
url="http://slack.com"
license=('custom')
depends=('gconf' 'gtk2' 'libgcrypt' 'libnotify' 'libxtst' 'gvfs' 'xdg-utils')
optdepends=('gnome-keyring')
source=("slack-$pkgver.deb::https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-$pkgver-$ARCH")
md5sums=('28ec6f4407f37b0833079b67b3080ac3')
[ "$CARCH" = "x86_64" ] && md5sums=('d6c89daa16e5ef74578f728540f62997')

prepare() {
  ar x slack-$pkgver.deb
}

package() {
  tar xf data.tar.xz -C "$pkgdir"
  chmod 755 "$pkgdir/etc" "$pkgdir/usr/share" "$pkgdir/usr/bin" "$pkgdir/usr/share/doc"
}
