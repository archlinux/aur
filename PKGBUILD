# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=neveralone-hib
pkgver=2016.03.22
pkgrel=1
pkgdesc="atmospheric puzzle platformer for 1-players or 2-players built in partnership with the Alaska Native community (humblebundle version)"
url="http://neveralonegame.com/"
arch=('x86_64')
license=('commercial')
source=("hib://NeverAlone_ArcticCollection.v1.0.tar.gz")
md5sums=('fe1ca15db6cfe6c1db877e33ace378fa')
options=(!strip)
PKGEXT=".pkg.tar"
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
 
package() {
    mkdir -p "${pkgdir}/opt/neveralone"
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/NeverAlone_ArcticCollection/Never_Alone.x64" "${pkgdir}/opt/neveralone"
    cp -R "${srcdir}/NeverAlone_ArcticCollection/Never_Alone_Data" "${pkgdir}/opt/neveralone"
    cat >> "${pkgdir}/usr/bin/neveralone" << \here
#!/bin/sh
cd /opt/neveralone
Never_Alone.x86
here
    chmod a+x "${pkgdir}/usr/bin/neveralone"
}
