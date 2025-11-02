STDIN
pkgname=uqm-full
pkgver=0.8.0
pkgrel=4
pkgdesc="Complete Ur-Quan Masters data pack with voices and 3DO music for Arch/Garuda"
arch=('any')
url="https://sc2.sourceforge.net/"
license=('GPL-1.0-or-later')
depends=('uqm')

# Users must manually provide these files in the build directory before running makepkg
source=('uqm-0.8.0-voice.uqm' 'uqm-0.8.0-3domusic.uqm')
noextract=('uqm-0.8.0-voice.uqm' 'uqm-0.8.0-3domusic.uqm')
sha256sums=('SKIP' 'SKIP')

package() {
    install -d "${pkgdir}/usr/share/uqm/content/addons"
    install -d "${pkgdir}/usr/share/games/uqm/content/addons"

    for f in uqm-0.8.0-voice.uqm uqm-0.8.0-3domusic.uqm; do
        install -Dm644 "$f" "${pkgdir}/usr/share/uqm/content/addons/$f"
        install -Dm644 "$f" "${pkgdir}/usr/share/games/uqm/content/addons/$f"
    done

    install -Dm644 /dev/null "${pkgdir}/usr/share/doc/${pkgname}/README"
    echo "Installs The Ur-Quan Masters voice and 3DO music addon data.
Place uqm-0.8.0-voice.uqm and uqm-0.8.0-3domusic.uqm in the build directory before running makepkg." \
        > "${pkgdir}/usr/share/doc/${pkgname}/README"
}
