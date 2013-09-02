# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-threewave
pkgver=1.7
pkgrel=2
pkgdesc="Threewave is a modification for Quake 3 that features Capture the Flag (CTF) gameplay."
url="http://www.threewavesoftware.com/"
license=('custom')
arch=('any')
depends=('quake3' 'sh')
source=('http://games.mirrors.tds.net/pub/planetquake3/modifications/threewavectf/threewave_16_full.zip' \
'http://games.mirrors.tds.net/pub/planetquake3/modifications/threewavectf/threewave_17_update.zip')
sha256sums=('c3cb1412cafc61a475ad2f1e93ecf47d7e2f979d973ce82b4a50da3101eca27d'
            '0fff6a66822c422cb9f6cca0139fa11048fef414c7dd839c50fbcbda80a44433')
PKGEXT='.pkg.tar'

package() {
    # Create Destination Directories
    install -d ${pkgdir}/opt/quake3/

    # Install Threewave CTF Files
    cp -r ${srcdir}/{baseq3,threewave} \
        ${pkgdir}/opt/quake3/

    # Install License File
    install -D -m644 ${pkgdir}/opt/quake3/threewave/q3w_readme.txt \
        ${pkgdir}/usr/share/licenses/${pkgname}/q3w_readme.txt
}
