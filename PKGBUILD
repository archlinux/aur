# Maintainer: John-Michael Mulesa <jmulesa at gmail dot com>
# Contributor: kyndair <kyndair at gmail dot com>

pkgname=quake2-data-gog
_pkgname=quake2
pkgver=1
_pkgver=2.0.0.3
pkgrel=2
pkgdesc="Quake 2 data via GOG"
arch=('any')
url="https://www.gog.com/game/quake_ii_quad_damage"
license=('custom')
makedepends=('innoextract' 'icoutils')
provides=('quake2-data')
conflicts=('quake2-data-steam' 'quake2-rogue-data-steam' 'quake2-xatrix-data-steam')
source=("setup_${_pkgname}_quad_damage_${_pkgver}.exe::gogdownloader://quake_ii_quad_damage_game/en1installer1")
sha256sums=('08b6addf4a33ab09a7846e95a879a33017410f8ddb80152cd4759336747f7fa7')

# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('goggogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::/usr/bin/echo Could not find gog installer file (%u). Manually download it to \"$(pwd)\", or set up a gogdownloader:// DLAGENT in /etc/makepkg.conf. See PKGBUILD for example.")

prepare() {
    innoextract -s "setup_${_pkgname}_quad_damage_${_pkgver}.exe"
    icotool -x -o . app/goggame-*.ico
}

package() {
    # install game icon
    install -Dm644 "${srcdir}/goggame-1441704824_8_256x256x32.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}-gog.png"

    # install data packs
    # Move required files to pkgdir
    install -D -m 644 $srcdir/app/baseq2/pak0.pak $pkgdir/usr/share/games/quake2/baseq2/pak0.pak
    install -D -m 644 $srcdir/app/baseq2/pak1.pak $pkgdir/usr/share/games/quake2/baseq2/pak1.pak
    install -D -m 644 $srcdir/app/baseq2/pak2.pak $pkgdir/usr/share/games/quake2/baseq2/pak2.pak
    install -D -m 644 $srcdir/app/baseq2/video/end.cin  $pkgdir/usr/share/games/quake2/baseq2/video/end.cin
    install -D -m 644 $srcdir/app/baseq2/video/eou1_.cin  $pkgdir/usr/share/games/quake2/baseq2/video/eou1_.cin
    install -D -m 644 $srcdir/app/baseq2/video/eou2_.cin  $pkgdir/usr/share/games/quake2/baseq2/video/eou2_.cin
    install -D -m 644 $srcdir/app/baseq2/video/eou3_.cin  $pkgdir/usr/share/games/quake2/baseq2/video/eou3_.cin
    install -D -m 644 $srcdir/app/baseq2/video/eou4_.cin  $pkgdir/usr/share/games/quake2/baseq2/video/eou4_.cin
    install -D -m 644 $srcdir/app/baseq2/video/eou5_.cin  $pkgdir/usr/share/games/quake2/baseq2/video/eou5_.cin
    install -D -m 644 $srcdir/app/baseq2/video/eou6_.cin  $pkgdir/usr/share/games/quake2/baseq2/video/eou6_.cin
    install -D -m 644 $srcdir/app/baseq2/video/eou7_.cin  $pkgdir/usr/share/games/quake2/baseq2/video/eou7_.cin
    install -D -m 644 $srcdir/app/baseq2/video/eou8_.cin  $pkgdir/usr/share/games/quake2/baseq2/video/eou8_.cin
    install -D -m 644 $srcdir/app/baseq2/video/idlog.cin  $pkgdir/usr/share/games/quake2/baseq2/video/idlog.cin
    install -D -m 644 $srcdir/app/baseq2/video/ntro.cin  $pkgdir/usr/share/games/quake2/baseq2/video/ntro.cin
    install -D -m 644 $srcdir/app/xatrix/pak0.pak $pkgdir/usr/share/games/quake2/xatrix/pak0.pak
    install -D -m 644 $srcdir/app/xatrix/video/idlog.cin $pkgdir/usr/share/games/quake2/xatrix/video/idlog.cin
    install -D -m 644 $srcdir/app/xatrix/video/logo.cin $pkgdir/usr/share/games/quake2/xatrix/video/logo.cin
    install -D -m 644 $srcdir/app/xatrix/video/xin.cin $pkgdir/usr/share/games/quake2/xatrix/video/xin.cin
    install -D -m 644 $srcdir/app/xatrix/video/xu1.cin $pkgdir/usr/share/games/quake2/xatrix/video/xu1.cin
    install -D -m 644 $srcdir/app/xatrix/video/xu2.cin $pkgdir/usr/share/games/quake2/xatrix/video/xu2.cin
    install -D -m 644 $srcdir/app/xatrix/video/xu3.cin $pkgdir/usr/share/games/quake2/xatrix/video/xu3.cin
    install -D -m 644 $srcdir/app/xatrix/video/xu4.cin $pkgdir/usr/share/games/quake2/xatrix/video/xu4.cin
    install -D -m 644 $srcdir/app/xatrix/video/xout.cin $pkgdir/usr/share/games/quake2/xatrix/video/xout.cin
    install -D -m 644 $srcdir/app/rogue/pak0.pak $pkgdir/usr/share/games/quake2/rogue/pak0.pak
    install -D -m 644 $srcdir/app/rogue/video/logo.cin $pkgdir/usr/share/games/quake2/rogue/video/logo.cin
    install -D -m 644 $srcdir/app/rogue/video/rend.cin $pkgdir/usr/share/games/quake2/rogue/video/rend.cin
    install -D -m 644 $srcdir/app/rogue/video/reu1_.cin $pkgdir/usr/share/games/quake2/rogue/video/reu1_.cin
    install -D -m 644 $srcdir/app/rogue/video/reu2_.cin $pkgdir/usr/share/games/quake2/rogue/video/reu2_.cin
    install -D -m 644 $srcdir/app/rogue/video/reu3_.cin $pkgdir/usr/share/games/quake2/rogue/video/reu3_.cin
    install -D -m 644 $srcdir/app/rogue/video/reu4_.cin $pkgdir/usr/share/games/quake2/rogue/video/reu4_.cin
    install -D -m 644 $srcdir/app/rogue/video/rintro.cin $pkgdir/usr/share/games/quake2/rogue/video/rintro.cin
    install -D -m 644 $srcdir/app/ctf/pak0.pak $pkgdir/usr/share/games/quake2/ctf/pak0.pak
    install -D -m 644 $srcdir/app/capture/pak1.pak $pkgdir/usr/share/games/quake2/capture/pak1.pak
    install -D -m 644 $srcdir/app/capture/Pak2.pak $pkgdir/usr/share/games/quake2/capture/pak2.pak
    install -D -m 644 $srcdir/app/rover/pak0.pak $pkgdir/usr/share/games/quake2/rover/pak0.pak
    install -D -m 644 $srcdir/app/rover/pak1.pak $pkgdir/usr/share/games/quake2/rover/pak1.pak
    install -D -m 644 $srcdir/app/rover/pak2.pak $pkgdir/usr/share/games/quake2/rover/pak2.pak
    install -D -m 644 $srcdir/app/chaos/pak0.pak $pkgdir/usr/share/games/quake2/chaos/pak0.pak
    install -D -m 644 $srcdir/app/chaos/pak1.pak $pkgdir/usr/share/games/quake2/chaos/pak1.pak
    install -D -m 644 $srcdir/app/qwar2/pak0.pak $pkgdir/usr/share/games/quake2/qwar2/pak0.pak
    install -D -m 644 $srcdir/app/qwar2/pak1.pak $pkgdir/usr/share/games/quake2/qwar2/pak1.pak
    install -D -m 644 $srcdir/app/arena/pak0.pak $pkgdir/usr/share/games/quake2/arena/pak0.pak
    install -D -m 644 $srcdir/app/arena/pak1.pak $pkgdir/usr/share/games/quake2/arena/pak1.pak
    install -D -m 644 $srcdir/app/Eraser/pak0.pak $pkgdir/usr/share/games/quake2/Eraser/pak0.pak
    install -D -m 644 $srcdir/app/Eraser/pak5.pak $pkgdir/usr/share/games/quake2/Eraser/pak5.pak
    install -D -m 644 $srcdir/app/action/pak0.pak $pkgdir/usr/share/games/quake2/action/pak0.pak
    install -D -m 644 $srcdir/app/jail/pak0.pak $pkgdir/usr/share/games/quake2/jail/pak0.pak
    install -D -m 644 $srcdir/app/arena/_origarena/pak0.pak $pkgdir/usr/share/games/quake2/arena/_origarena/pak0.pak
}
