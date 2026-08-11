#_gitauthor="tuxnix"
#_gitbranch="master"
# Maintainer: tuxnix

pkgname="mpvcut"
pkgver=0.7
pkgrel=5
pkgdesc='Turns mpv into a video cutter.'
url='https://codeberg.org/tuxnix/mpvcut'
arch=('any')
license=('GLPv2-only')
depends=('mpv' 'ffmpeg')
makedepends=('git')
source=('git+https://codeberg.org/tuxnix/mpvcut'
        'mpvcut-install.hook'
        'mpvcut-remove.hook'
        'update-mpvcut.sh'
        'remove-mpvcut.sh')
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
    cd "$srcdir/$pkgname"

    install -Dm644 main.lua "$pkgdir/etc/skel/.config/mpv/scripts/mpvcut/main.lua"
    install -Dm644 config.lua "$pkgdir/etc/skel/.config/mpv/scripts/mpvcut/config.lua"
    install -Dm605 ffpid "$pkgdir/usr/local/bin/ffpid"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "$srcdir/update-mpvcut.sh" "$pkgdir/usr/local/bin/update-mpvcut"
    install -Dm755 "$srcdir/remove-mpvcut.sh" "$pkgdir/usr/local/bin/remove-mpvcut"
    install -Dm644 "$srcdir/mpvcut-install.hook" "$pkgdir/etc/pacman.d/hooks/mpvcut-install.hook"
    install -Dm644 "$srcdir/mpvcut-remove.hook" "$pkgdir/etc/pacman.d/hooks/mpvcut-remove.hook"
}
