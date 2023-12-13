# Maintainer: bashuser30 <bashuser30 at mailbox dot org>
pkgname=dl-stream-git
_pkgname=dl-stream
pkgver=95.7ceb51f
pkgrel=1
pkgdesc="Ad-free Twitch streams and videos via streamlink and ttvlol plugin (git version)"
arch=('any')
url="https://codeberg.org/bashuser30/$_pkgname"
source=("git+$url")
license=('GPL3')
depends=('curl' 'streamlink')
makedepends=('git')
optdepends=('chatterino: For opening chat'
            'ffmpeg: For conversion after download'
            'jq: For parsing api responses'
            'mpv: For watching content'
            'python-cloudscraper: Required for Kick plugin')
conflicts=('dl-stream')
provides=('dl-stream')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
