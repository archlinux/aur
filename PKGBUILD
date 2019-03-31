# Maintainer: Sebastian Gsänger <sebastian_gsaenger [at] web.de>
pkgname=wolf3d-data-steam
pkgver=1
pkgrel=1
pkgdesc="Wolfenstein 3D data via Steam"
arch=('any')
provides=('wolf3d-data')
makedepends=('steamcmd')
license=('Proprietary')
url='http://store.steampowered.com/app/2270'

package() {
    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir +login $steam_username "+app_update 2270 validate" +quit

    # Move required files to pkgdir
    install -D -m 644 $srcdir/base/AUDIOHED.WL6 $pkgdir/usr/share/wolf3d/AUDIOHED.WL6
    install -D -m 644 $srcdir/base/AUDIOT.WL6 $pkgdir/usr/share/wolf3d/AUDIOT.WL6
    install -D -m 644 $srcdir/base/GAMEMAPS.WL6 $pkgdir/usr/share/wolf3d/GAMEMAPS.WL6
    install -D -m 644 $srcdir/base/MAPHEAD.WL6 $pkgdir/usr/share/wolf3d/MAPHEAD.WL6
    install -D -m 644 $srcdir/base/VGADICT.WL6 $pkgdir/usr/share/wolf3d/VGADICT.WL6
    install -D -m 644 $srcdir/base/VGAGRAPH.WL6 $pkgdir/usr/share/wolf3d/VGAGRAPH.WL6
    install -D -m 644 $srcdir/base/VGAHEAD.WL6 $pkgdir/usr/share/wolf3d/VGAHEAD.WL6
    install -D -m 644 $srcdir/base/VSWAP.WL6 $pkgdir/usr/share/wolf3d/VSWAP.WL6
}

