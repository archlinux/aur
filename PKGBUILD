# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=monochroma-demo
pkgver=0.11
pkgrel=1
pkgdesc="very atmospheric platform jump game based on unity player - demo version"
url="http://monochromagame.com/"
arch=('x86_64' 'i686')
license=('unknown')
[[ "$CARCH" == "x86_64" ]] && depends=('mesa' 'gcc-libs-multilib')
[[ "$CARCH" == "i686" ]] && depends=('lib32-libxext' 'lib32-libxcursor' 'lib32-glu')
source=("http://ams4.dl.dbolical.com/dl/2596eb459ffebaf379f3f3d3902a0b8b/53330a40/2013/07/18/Monochroma_Kickstarter_Linux_Demo_v0.11.zip")
md5sums=('4f33f384cd293c2ce448412a7eb52ca4')
PKGEXT=".pkg.tar"
[[ "$CARCH" == "x86_64" ]] && _arch=x86_64 || _arch=x86
 
package() {
    mkdir -p "$pkgdir/opt/monochroma-demo" "$pkgdir/usr/bin"
    cp -R "$srcdir/MonochromaBin_Kickstarter_Linux/Monochroma_Data" "$pkgdir/opt/monochroma-demo"
    cp "$srcdir/MonochromaBin_Kickstarter_Linux/Monochroma.$_arch" "$pkgdir/opt/monochroma-demo"
    chmod a+x "$pkgdir/opt/monochroma-demo/Monochroma.$_arch"
    ln -s /opt/monochroma-demo/Monochroma.$_arch "$pkgdir/usr/bin/monochroma-demo"
}
