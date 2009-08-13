# Contributor: Travis Nickles <ryoohki7@yahoo.com>
# Contributor: Slash <demodevil5 AT yahoo DOT com>

pkgname=quake3-stereoquake
pkgver=1
pkgrel=1
pkgdesc="Stereogram mod for Quake 3"
url="http://stereoquake.planetquake.gamespy.com/"
license=('custom')
arch=('i686' 'x86_64')
depends=('quake3')
makedepends=('unzip')
conflicts=('stereoquake')
replaces=('stereoquake')
source=("quake3-stereoquake.desktop" "quake3-stereoquake.launcher" \
"http://games.mirrors.tds.net/pub/planetquake3/modifications/stereoquake.zip")
md5sums=('bd4e5df7a961aab5154ee3143c73de7d'
         '665b50e9ede2873224f2ebb8020c84b3'
         '3bd59942350bfc8f0ca306cb86481ffb')

build() {
    cd $startdir/src

    # Create Destination Directories
    install -d $startdir/pkg/opt/quake3/

    # Copy Game Data
    cp -r $startdir/src/stereoquake \
        $startdir/pkg/opt/quake3

    # Install Launcher
    install -D -m 755 $startdir/src/quake3-stereoquake.launcher \
        $startdir/pkg/usr/bin/stereoquake

    # Install Desktop File
    install -D -m 644 $startdir/src/quake3-stereoquake.desktop \
        $startdir/pkg/usr/share/applications/quake3-stereoquake.desktop
}
