# Maintainer: codeberge <codeberge at mailbox dot org>
pkgname=dl-stream-git
_pkgname=dl-stream
pkgver=66.2ed0c70
pkgrel=1
pkgdesc="Ad-free Twitch streams and videos via streamlink and ttvlol plugin"
arch=('any')
url="https://codeberg.org/codeberge/$_pkgname"
source=("git+$url")
license=('GPL3')
depends=('curl' 'streamlink')
makedepends=('git')
optdepends=('chatterino: For opening chat'
            'ffmpeg: For conversion after download'
            'mpv: For watching content')
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
