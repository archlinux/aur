# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=lbry-sync-ytdl
_author=gardenappl
pkgver=1.8.3
pkgrel=2
pkgdesc='Sync content to LBRY using youtube-dl'
arch=('any')
url="https://gitlab.com/$_author/$pkgname"
license=('GPL-3.0-or-later')
depends=('jq' 'curl' 'lbrynet')
makedepends=('perl')
optdepends=('youtube-dl' 'yt-dlp: will be preferred instead of youtube-dl if installed')
source=("https://gitlab.com/$_author/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")

build() {
	make -C "$pkgname-v$pkgver"
}

package() {
	make DESTDIR="$pkgdir" -C "$pkgname-v$pkgver" install
}
sha256sums=('40c6f6db493e37cfc1310cc2d931eee19b80c251dec57736f045dc11efcba0fb')
b2sums=('0e59140605bfbbc32004efd5ef356eb7733e3032cec7c5a64faf94ed46c367d28c88d5bc22f1f8c4bcea23ae4b8bb0dcf860b663fd45774691dd662b80ac3a75')
