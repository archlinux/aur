# Contributor: Slash <demodevil5 [at] yahoo [dot] com>

pkgname=doom3-cdoom
pkgver=1.3.1
pkgrel=1
pkgdesc="Classic Doom: Doom 1 shareware episode maps recreated for use with Doom 3."
url="http://cdoom.d3files.com/"
license=('custom')
arch=('i686')
depends=('doom3')
makedepends=('unzip')
# Download: http://files.filefront.com/classic+doom+3+131zip/;9003559;/fileinfo.html
source=('http://www.slashbunny.com/aur/doom3-cdoom/classic_doom_3_131.zip' 'doom3-cdoom.desktop' 'doom3-cdoom.launcher')
md5sums=('7dc67da1a4007e85014de566283d1a41'
         'fe84fee23843eac65cecdf3e76414184'
         'bfb9b58d9f2ed85839472848ecfd5a30')

build() {
    cd $startdir/src

    # Create Destination Directories
    install -d $startdir/pkg/{usr/bin/,opt/doom3/}

    # Remove Unneeded Files
    rm $startdir/src/cdoom/{*.url,*.bat}

    # Move Icon
    mv $startdir/src/cdoom/cdoom.ico $startdir/src/doom3-cdoom.ico

    # Move License
    mv $startdir/src/cdoom/docs/License.txt $startdir/src/License.txt

    # Move Data to Destination Directory
    mv $startdir/src/cdoom $startdir/pkg/opt/doom3/

    # Install Launcher (Client)
    install -D -m 755 $startdir/src/doom3-cdoom.launcher \
        $startdir/pkg/usr/bin/doom3-cdoom

    # Install License
    install -D -m 644 $startdir/src/License.txt \
        $startdir/pkg/usr/share/licenses/$pkgname/License.txt

    # Install Icon
    install -D -m 644 $startdir/src/doom3-cdoom.ico \
        $startdir/pkg/usr/share/pixmaps/doom3-cdoom.ico

    # Install Desktop File
    install -D -m 644 $startdir/src/doom3-cdoom.desktop \
        $startdir/pkg/usr/share/applications/doom3-cdoom.desktop
}
