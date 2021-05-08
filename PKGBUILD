# Maintainer: ait <aiten@posteo.net>

pkgname=dmenu-twitch-git
pkgver=1.164b1e3
pkgrel=1
pkgdesc="check who is live on twitch via dmenu"
arch=('any')
url="https://gitlab.com/neoait/dmenu-twitch"
license=('GPL3')
depends=(python3 python-pyxdg dmenu streamlink)
makedepends=(git)
optdepends=(mpv youtube-dl)
provides=(twitch twitch-get)
source=(git+$url)
md5sums=('SKIP')

_gitroot="dmenu-twitch"

pkgver () {
    cd "$srcdir/$_gitroot"
    echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
    cd "$srcdir/$_gitroot"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
