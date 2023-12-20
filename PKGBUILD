# Maintainer = Kazaii (mark@zealnetworks.ca)
# Contributor = Caleb Yates (caldog20@gmail.com)
# Contributor = Raymii
# SecureCRT software is owned and copyrighted by Vandyke Inc. The software is free to download for eval and requires a separately purchased license for full features and support
 
## To install this package, you need to download the SecureCRT for Linux package in deb format and place it in the same directory as the PKGBUILD

## Ensure the 'pkgver' and 'incrver' variables are updated below to match your package version

pkgname=scrt
pkgver=9.4.3
incrver=3219
pkgrel=2
pkgdesc="Vandyke SecureCRT SSH Client"
arch=('x86_64')
url="http://www.vandyke.com/products/securecrt/"
license=('custom')
depends=('fontconfig' 'freetype2' 'gcc-libs' 'glibc' 'krb5' 'libcups'
		'libpng' 'libx11' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'openssl'
		'qt5-base' 'qt5-multimedia' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm' 'zlib' 'icu70')
options=('!strip' '!emptydirs')
source=("local://${pkgname}-${pkgver}-${incrver}.ubuntu22-64.x86_64.deb")
md5sums=('4b58fd834046073ad877b487f1da709a')

package() {

       cd "${srcdir}"/
       
       bsdtar -x -f data.tar.zst
       
       install -Dm 755 ./usr/bin/SecureCRT ${pkgdir}/usr/bin/SecureCRT

       install -Dm 755 ./usr/lib/scrt/libClientConfigUiQt.so ${pkgdir}/usr/lib/scrt/libClientConfigUiQt.so
       install -Dm 755 ./usr/lib/scrt/libQt5Multimedia.so.5 ${pkgdir}/usr/lib/scrt/libQt5Multimedia.so.5
       install -Dm 755 ./usr/lib/scrt/libpython310Qt.so ${pkgdir}/usr/lib/scrt/libpython310Qt.so
       install -Dm 755 ./usr/lib/scrt/plugins/platforminputcontexts/libibusplatforminputcontextplugin.so ${pkgdir}/usr/lib/scrt/plugins/platforminputcontexts/libibusplatforminputcontextplugin.so
       install -Dm 755 ./usr/lib/scrt/plugins/platforminputcontexts/libcomposeplatforminputcontextplugin.so ${pkgdir}/usr/lib/scrt/plugins/platforminputcontexts/libcomposeplatforminputcontextplugin.so
       install -Dm 755 ./usr/lib/scrt/plugins/platforms/libqxcb.so ${pkgdir}/usr/lib/scrt/plugins/platforms/libqxcb.so
       install -Dm 755 ./usr/lib/scrt/libCommonUiQt.so ${pkgdir}/usr/lib/scrt/libCommonUiQt.so
       install -Dm 755 ./usr/lib/scrt/libQt5Gui.so.5 ${pkgdir}/usr/lib/scrt/libQt5Gui.so.5
       install -Dm 755 ./usr/lib/scrt/libQt5PrintSupport.so.5 ${pkgdir}/usr/lib/scrt/libQt5PrintSupport.so.5
       install -Dm 755 ./usr/lib/scrt/libQt5Core.so.5 ${pkgdir}/usr/lib/scrt/libQt5Core.so.5
       install -Dm 755 ./usr/lib/scrt/libQt5Widgets.so.5 ${pkgdir}/usr/lib/scrt/libQt5Widgets.so.5
       install -Dm 755 ./usr/lib/scrt/libQt5Network.so.5 ${pkgdir}/usr/lib/scrt/libQt5Network.so.5
       install -Dm 755 ./usr/lib/scrt/lib/libQt5XcbQpa.so.5 ${pkgdir}/usr/lib/scrt/lib/libQt5XcbQpa.so.5
       install -Dm 755 ./usr/lib/scrt/lib/libQt5DBus.so.5 ${pkgdir}/usr/lib/scrt/lib/libQt5DBus.so.5

       install -Dm 644 ./usr/share/vandyke/data/SecureCRT_fr.qm ${pkgdir}/usr/share/vandyke/data/SecureCRT_fr.qm
       install -Dm 644 ./usr/share/doc/scrt/SecureCRT_README.txt ${pkgdir}/usr/share/doc/scrt/SecureCRT_README.txt
       install -Dm 644 ./usr/share/doc/scrt/copyright ${pkgdir}/usr/share/doc/scrt/copyright
       install -Dm 644 ./usr/share/doc/scrt/SecureCRT_EULA.txt ${pkgdir}/usr/share/doc/scrt/SecureCRT_EULA.txt
       install -Dm 644 ./usr/share/doc/scrt/SecureCRT_HISTORY.txt ${pkgdir}/usr/share/doc/scrt/SecureCRT_HISTORY.txt
       install -Dm 644 ./usr/share/doc/scrt/changelog.Debian.gz ${pkgdir}/usr/share/doc/scrt/changelog.Debian.gz
       
       cp -rp ./usr/share/doc/scrt/SecureCRTHelp ${pkgdir}/usr/share/doc/scrt/SecureCRTHelp

       install -Dm 644 ./usr/share/vandyke/data/securecrt_64.png ${pkgdir}/usr/share/vandyke/data/securecrt_64.png
       install -Dm 644 ./usr/share/applications/SecureCRT.desktop ${pkgdir}/usr/share/applications/SecureCRT.desktop

}
