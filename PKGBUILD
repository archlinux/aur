# meteo-avi-2-gba
# Maintainer: Sterophonick
# NOTES:
# - Executable is poorly translated in english, i wrote it in an afternoon
# - Requires 32-bit GStreamer plugins but the AUR packages are currently broken
# - currently unsure of what gstreamer plugins are needed, accepted codec is msmpeg4 and adpcm_ms

pkgname=meteo-avi-2-gba
pkgver=1.4.0
pkgrel=1
arch=(x86_64 i686)
pkgdesc="(BROKEN) AVI conversion tool for Nintendo Game Boy Advance"
source=(https://github.com/Sterophonick/mirror-meteo-avi2gba/raw/master/Meteo140EN.exe
    meteo-avi-2-gba.png
    meteo-avi-2-gba
    meteo-avi-2-gba.desktop)
depends=('wine' 'winetricks')
md5sums=('0f2339cd14ad73d1e3e719ff516cc36e'
    '933fac2e4930d2241e6fcc2d061ca8b6'
    'SKIP'
    'SKIP')

package() {
	mkdir "${pkgdir}/usr"
    mkdir "${pkgdir}/usr/share"
    mkdir "${pkgdir}/usr/share/meteo-avi-2-gba"
    cp Meteo140EN.exe "${pkgdir}/usr/share/meteo-avi-2-gba"

    install -Dm755 meteo-avi-2-gba $pkgdir/usr/bin/meteo-avi-2-gba
    install -Dm644 meteo-avi-2-gba.desktop $pkgdir/usr/share/applications/meteo-avi-2-gba.desktop
    install -Dm644 meteo-avi-2-gba.png $pkgdir/usr/share/pixmaps/meteo-avi-2-gba.png
}

