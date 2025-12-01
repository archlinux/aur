# Maintainer = Kazaii (mark@zealnetworks.ca)
# Contributor = Caleb Yates (caldog20@gmail.com)
# Contributor = Raymii
# SecureCRT software is owned and copyrighted by Vandyke Inc. The software is free to download for eval and requires a separately purchased license for full features and support
 
## To install this package, you need to download the SecureCRT for Linux package in deb format and place it in the same directory as the PKGBUILD

## Ensure the 'pkgver' and 'incrver' variables are updated below to match your package version

pkgname=scrt
pkgver=9.6.4
incrver=3695
pkgrel=0
pkgdesc="Vandyke SecureCRT SSH Client"
arch=('x86_64')
url="http://www.vandyke.com/products/securecrt/"
license=('custom')
depends=('fontconfig' 'freetype2' 'gcc-libs' 'glibc' 'krb5' 'libcups'
		'libpng' 'libx11' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'openssl'
		'qt6-base' 'qt6-multimedia' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm' 'zlib' 'icu74')
options=('!strip' '!emptydirs')
source=("local://${pkgname}-${pkgver}-${incrver}.ubuntu24-64.x86_64.deb")
md5sums=('a452cbd828cea485e4352016ef96ebcd')

package() {

       cd "${srcdir}"/
       
       bsdtar -x -f data.tar.zst
       
       install -Dm 755 ./usr/bin/SecureCRT ${pkgdir}/usr/bin/SecureCRT

       install -Dm 755 ./usr/lib/scrt/libpython312Qt.so ${pkgdir}/usr/lib/scrt/libpython312Qt.so
       install -Dm 755 ./usr/lib/scrt/libSSH2ClientQt.so ${pkgdir}/usr/lib/scrt/libSSH2ClientQt.so
       install -Dm 755 ./usr/lib/scrt/libCommonUiQt.so ${pkgdir}/usr/lib/scrt/libCommonUiQt.so
       install -Dm 755 ./usr/lib/scrt/libQt6Multimedia.so.6 ${pkgdir}/usr/lib/scrt/libQt6Multimedia.so.6
       install -Dm 755 ./usr/lib/scrt/libtlscore.so ${pkgdir}/usr/lib/scrt/libtlscore.so
       install -Dm 755 ./usr/lib/scrt/libQt6PrintSupport.so.6 ${pkgdir}/usr/lib/scrt/libQt6PrintSupport.so.6
       install -Dm 755 ./usr/lib/scrt/libQt6Gui.so.6 ${pkgdir}/usr/lib/scrt/libQt6Gui.so.6
       install -Dm 755 ./usr/lib/scrt/libQt6Widgets.so.6 ${pkgdir}/usr/lib/scrt/libQt6Widgets.so.6
       install -Dm 755 ./usr/lib/scrt/libQt6Core5Compat.so.6 ${pkgdir}/usr/lib/scrt/libQt6Core5Compat.so.6
       install -Dm 755 ./usr/lib/scrt/plugins/printsupport/libcupsprintersupport.so ${pkgdir}/usr/lib/scrt/plugins/printsupport/libcupsprintersupport.so
       install -Dm 755 ./usr/lib/scrt/plugins/platformthemes/libqgtk3.so ${pkgdir}/usr/lib/scrt/plugins/platformthemes/libqgtk3.so
       install -Dm 755 ./usr/lib/scrt/plugins/platforminputcontexts/libibusplatforminputcontextplugin.so ${pkgdir}/usr/lib/scrt/plugins/platforminputcontexts/libibusplatforminputcontextplugin.so
       install -Dm 755 ./usr/lib/scrt/plugins/platforminputcontexts/libcomposeplatforminputcontextplugin.so ${pkgdir}/usr/lib/scrt/plugins/platforminputcontexts/libcomposeplatforminputcontextplugin.so
       install -Dm 755 ./usr/lib/scrt/plugins/platforms/libqxcb.so ${pkgdir}/usr/lib/scrt/plugins/platforms/libqxcb.so
       install -Dm 755 ./usr/lib/scrt/libssh2core.so ${pkgdir}/usr/lib/scrt/libssh2core.so
       install -Dm 755 ./usr/lib/scrt/lib/libQt6XcbQpa.so.6 ${pkgdir}/usr/lib/scrt/lib/libQt6XcbQpa.so.6
       install -Dm 755 ./usr/lib/scrt/libClientConfigUiQt.so ${pkgdir}/usr/lib/scrt/libClientConfigUiQt.so
       install -Dm 755 ./usr/lib/scrt/libQt6Core.so.6 ${pkgdir}/usr/lib/scrt/libQt6Core.so.6
       install -Dm 755 ./usr/lib/scrt/libQt6Network.so.6 ${pkgdir}/usr/lib/scrt/libQt6Network.so.6
       install -Dm 755 ./usr/lib/scrt/libQt6DBus.so.6 ${pkgdir}/usr/lib/scrt/libQt6DBus.so.6


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
