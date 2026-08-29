#_gitauthor="tuxnix"
#_gitbranch="master"
# Maintainer: tuxnix

pkgname="mpvcut"
pkgver=0.7
pkgrel=6
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
            'b5da801519b4fcb96ea3c52aace7dc0873b56f21c2013fb517193af1f45782b4987ce0a8df3dc85c9f21e09cb9c005d7cbcb226c4483890a49d2dc5cf89d2778'
            '2a1fc73de2b8e12d276720907138470948b454e1e348953cd8ef558857cad3e578da14fe12f696d5d8de6a9ec63dc04c7e61e4819126ffdd9ee1f0f4bd9d1e0c'
            '62b8540e58735a8a08b1255a8d0295108af6d44a208d2da25cd33a4d047bb4515dcba6d7097d6a7ad567a86b8e390cb86f42b5d438b3c6f98be9acf687f7466e'
            '109943be0c3ed13f7d2b253238ff8a4f175fc85b6aaa8bf6fb04ee858ab553f66a030ed61c5aef6df60305ab152abcc5ff1b61bea6c6d50408746fc5d48f2480')

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
