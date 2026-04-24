# Maintainer: xtexecute <none@none>

pkgname=fleshfetch
pkgver=1.0.0
pkgrel=1
pkgdesc="GTK4-based clicker game in Python with global Supabase leaderboard. Written as a joke, don't take it too seriously."
arch=('x86_64')
url="https://github.com/xtexecute/fleshfetch-aur"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'python-requests')
source=("git+https://github.com/xtexecute/fleshfetch-aur.git#branch=main")
sha256sums=('SKIP')

package() {
    cd "$srcdir/fleshfetch-aur"

    # Main app
    install -Dm644 fleshfetch.py "$pkgdir/usr/share/fleshfetch/fleshfetch.py"
    install -Dm755 fleshfetch "$pkgdir/usr/bin/fleshfetch"

    # Default config
    install -Dm644 default.conf "$pkgdir/usr/share/fleshfetch/default.conf"

    # Place flesh.png next to fleshfetch.py
    install -Dm644 flesh.png "$pkgdir/usr/share/fleshfetch/flesh.png"

    # Desktop entry
    install -Dm644 dev.xtexecute.fleshfetch.desktop \
        "$pkgdir/usr/share/applications/dev.xtexecute.fleshfetch.desktop"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
