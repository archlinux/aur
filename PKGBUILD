# Maintainer: Slash <demodevil5 AT yahoo DOT com>
# Contributor: Travis Nickles <ryoohki7@yahoo.com>

pkgname=quake3-stereoquake
pkgver=1
pkgrel=2
pkgdesc="Stereogram mod for Quake 3"
url="http://stereoquake.planetquake.gamespy.com/"
license=('custom')
arch=('any')
depends=('quake3' 'sh')
conflicts=('stereoquake')
replaces=('stereoquake')
source=("quake3-stereoquake.desktop" "quake3-stereoquake.launcher" \
"http://games.mirrors.tds.net/pub/planetquake3/modifications/stereoquake.zip")
sha256sums=('6a917b79ba3d8d3f16d5ae9cd331ab0be096d29b0776c3019d091f8ab13db160'
            '03ff6af0fd0d9fe51cde77f9a06b631bb13545a31b86d270e102d05683945b97'
            '17218fb46476acf215cce97c760c3fe6729bf100ce5594217e22d15a025d4b72')
PKGEXT='.pkg.tar'

package() {
    cd ${srcdir}

    # Create Destination Directories
    install -d ${pkgdir}/opt/quake3/

    # Copy Game Data
    cp -r ${srcdir}/stereoquake \
        ${pkgdir}/opt/quake3

    # Install Launcher
    install -D -m 755 ${srcdir}/quake3-stereoquake.launcher \
        ${pkgdir}/usr/bin/stereoquake

    # Install Desktop File
    install -D -m 644 ${srcdir}/quake3-stereoquake.desktop \
        ${pkgdir}/usr/share/applications/quake3-stereoquake.desktop

    # Install License File
    install -D -m644 ${pkgdir}/opt/quake3/stereoquake/readme.txt \
        ${pkgdir}/usr/share/licenses/${pkgname}/readme.txt
}
