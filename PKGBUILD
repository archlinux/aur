# Maintainer: Ja4e <Jakie101@proton.me>
pkgname=lyrus-git
pkgver=1.0.1
pkgrel=3
pkgdesc="A Python curses lyrics player primarily for cmus, with playerctl as a fallback"
arch=('any')
url="https://github.com/Ja4e/Lyrus"
license=('AGPL-3.0')

depends=(
    'python'
    'python-requests'
    'python-aiohttp'
    'python-wcwidth'
    'python-appdirs'
    'python-syncedlyrics'
)

optdepends=(
    'cmus: daemon support for cmus player'
    'python-mpd2: optional mpd support (allows local)'
    'playerctl: optional MPRIS support (for other)'
)

makedepends=('git')
provides=("lyrus")
conflicts=("lyrus")
source=("lyrus::git+https://github.com/Ja4e/Lyrus.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/lyrus" || return 1
    install -Dm755 "lyrus.py" "$pkgdir/usr/bin/lyrus"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README"
}


