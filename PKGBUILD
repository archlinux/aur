# Maintainer: Sebastian Gsänger <sebastian_gsaenger [at] web.de>
#
# app_update command for expansions will always download base-data
# when built from one pkgbuild we can share download folder and don't need to download baseq2 thrice

pkgname=('quake2-data-steam' 'quake2-xatrix-data-steam' 'quake2-rogue-data-steam')
pkgver=1
pkgrel=2
arch=('any')
makedepends=('steamcmd')
pkgdesc="Quake II data via Steam"
license=('Proprietary')
url='https://store.steampowered.com/app/2320'

package_quake2-data-steam() {
    provides=('quake2-data')

    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir +login $steam_username "+app_update 2320 validate" +quit

    # Move required files to pkgdir
    install -D -m 644 $srcdir/baseq2/pak0.pak $pkgdir/usr/share/games/quake2/baseq2/pak0.pak
    install -D -m 644 $srcdir/baseq2/pak1.pak $pkgdir/usr/share/games/quake2/baseq2/pak1.pak
    install -D -m 644 $srcdir/baseq2/pak2.pak $pkgdir/usr/share/games/quake2/baseq2/pak2.pak
    install -D -m 644 $srcdir/baseq2/video/end.cin  $pkgdir/usr/share/games/quake2/baseq2/video/end.cin
    install -D -m 644 $srcdir/baseq2/video/eou1_.cin  $pkgdir/usr/share/games/quake2/baseq2/video/eou1_.cin
    install -D -m 644 $srcdir/baseq2/video/eou2_.cin  $pkgdir/usr/share/games/quake2/baseq2/video/eou2_.cin
    install -D -m 644 $srcdir/baseq2/video/eou3_.cin  $pkgdir/usr/share/games/quake2/baseq2/video/eou3_.cin
    install -D -m 644 $srcdir/baseq2/video/eou4_.cin  $pkgdir/usr/share/games/quake2/baseq2/video/eou4_.cin
    install -D -m 644 $srcdir/baseq2/video/eou5_.cin  $pkgdir/usr/share/games/quake2/baseq2/video/eou5_.cin
    install -D -m 644 $srcdir/baseq2/video/eou6_.cin  $pkgdir/usr/share/games/quake2/baseq2/video/eou6_.cin
    install -D -m 644 $srcdir/baseq2/video/eou7_.cin  $pkgdir/usr/share/games/quake2/baseq2/video/eou7_.cin
    install -D -m 644 $srcdir/baseq2/video/eou8_.cin  $pkgdir/usr/share/games/quake2/baseq2/video/eou8_.cin
    install -D -m 644 $srcdir/baseq2/video/idlog.cin  $pkgdir/usr/share/games/quake2/baseq2/video/idlog.cin
    install -D -m 644 $srcdir/baseq2/video/ntro.cin  $pkgdir/usr/share/games/quake2/baseq2/video/ntro.cin
}

package_quake2-xatrix-data-steam() {
    pkgdesc="Quake II: The Reckoning data via Steam"
    provides=('quake2-xatrix-data')
    depends=('quake2-data')
    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir +login $steam_username "+app_update 2330 validate" +quit

    # Move required files to pkgdir
    install -D -m 644 $srcdir/xatrix/pak0.pak $pkgdir/usr/share/games/quake2/xatrix/pak0.pak
    install -D -m 644 $srcdir/xatrix/video/idlog.cin $pkgdir/usr/share/games/quake2/xatrix/video/idlog.cin
    install -D -m 644 $srcdir/xatrix/video/logo.cin $pkgdir/usr/share/games/quake2/xatrix/video/logo.cin
    install -D -m 644 $srcdir/xatrix/video/xin.cin $pkgdir/usr/share/games/quake2/xatrix/video/xin.cin
    install -D -m 644 $srcdir/xatrix/video/xu1.cin $pkgdir/usr/share/games/quake2/xatrix/video/xu1.cin
    install -D -m 644 $srcdir/xatrix/video/xu2.cin $pkgdir/usr/share/games/quake2/xatrix/video/xu2.cin
    install -D -m 644 $srcdir/xatrix/video/xu3.cin $pkgdir/usr/share/games/quake2/xatrix/video/xu3.cin
    install -D -m 644 $srcdir/xatrix/video/xu4.cin $pkgdir/usr/share/games/quake2/xatrix/video/xu4.cin
    install -D -m 644 $srcdir/xatrix/video/xout.cin $pkgdir/usr/share/games/quake2/xatrix/video/xout.cin
}

package_quake2-rogue-data-steam() {
    pkgdesc="Quake II: Ground Zero data via Steam"
    provides=('quake2-rogue-data')
    depends=('quake2-data')
    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir +login $steam_username "+app_update 2340 validate" +quit

    # Move required files to pkgdir
    install -D -m 644 $srcdir/rogue/pak0.pak $pkgdir/usr/share/games/quake2/rogue/pak0.pak
    install -D -m 644 $srcdir/rogue/video/logo.cin $pkgdir/usr/share/games/quake2/rogue/video/logo.cin
    install -D -m 644 $srcdir/rogue/video/rend.cin $pkgdir/usr/share/games/quake2/rogue/video/rend.cin
    install -D -m 644 $srcdir/rogue/video/reu1_.cin $pkgdir/usr/share/games/quake2/rogue/video/reu1_.cin
    install -D -m 644 $srcdir/rogue/video/reu2_.cin $pkgdir/usr/share/games/quake2/rogue/video/reu2_.cin
    install -D -m 644 $srcdir/rogue/video/reu3_.cin $pkgdir/usr/share/games/quake2/rogue/video/reu3_.cin
    install -D -m 644 $srcdir/rogue/video/reu4_.cin $pkgdir/usr/share/games/quake2/rogue/video/reu4_.cin
    install -D -m 644 $srcdir/rogue/video/rintro.cin $pkgdir/usr/share/games/quake2/rogue/video/rintro.cin
}
