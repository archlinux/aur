# Maintainer: wszqkzqk <wszqkzqk@gmail.com>
pkgname=yozo-office-stable
_pkgver=yozo-office-zh-cn_7.0.0299.131ZH.CL01
pkgver=7.0.0299.131ZH.CL01_ZH_CN
pkgrel=1
pkgdesc="Yozo Office - An MS Office Compatible Office Suit"
url="http://www.yozosoft.com/"
depends=('libxtst' 'libxt')
optdepends=('ttf-ms-fonts: Arial, Times, Courier etc.')
options=('!strip')
license=('')
source=("https://mirrors.ustc.edu.cn/deepin/pool/non-free/y/yozo-office-zh-cn/${_pkgver}_i386.deb")
arch=('i686' 'x86_64') 
install=yozo-office.install
md5sums=('SKIP')

[[ $CARCH == 'x86_64' ]] && {
#depends=('lib32-libxext')
source=(https://mirrors.ustc.edu.cn/deepin/pool/non-free/y/yozo-office-zh-cn/${_pkgver}_amd64.deb)
md5sums=('SKIP')
}
package() {
cd "$srcdir"
tar zxf data.tar.gz
mv usr etc "$pkgdir"

targetP="${pkgdir}/usr/local/Yozosoft/Yozo_Office"
unpackP="${targetP}/Jre/bin/unpack200"
libP="${targetP}/Jre/lib"

"$unpackP" -r "$libP/rt.pack.gz"        "$libP/rt.jar"
"$unpackP" -r "$libP/jsse.pack.gz"      "$libP/jsse.jar"
"$unpackP" -r "$libP/charsets.pack.gz"  "$libP/charsets.jar"
"$unpackP" -r "$libP/resources.pack.gz" "$libP/resources.jar"

"$unpackP" -r "$libP/ext/plugin.pack.gz"    "$libP/ext/plugin.jar"
"$unpackP" -r "$libP/ext/localedata.pack.gz" \
	"$libP/ext/localedata.jar"
"$unpackP" -r "$libP/ext/bcprov-jdk14-124.pack.gz" \
	"$libP/ext/bcprov-jdk14-124.jar"
"$unpackP" -r "$libP/ext/jai_core.pack.gz" \
	"$libP/ext/jai_core.jar"
"$unpackP" -r "$libP/ext/tools.pack.gz" \
	"$libP/ext/tools.jar"
"$unpackP" -r "$libP/ext/ojdbc14.pack.gz" \
	"$libP/ext/ojdbc14.jar"
"$unpackP" -r "$libP/ext/mysql-connector.pack.gz" \
	"$libP/ext/mysql-connector.jar"
"$unpackP" -r "$libP/ext/swt.pack.gz"    "$libP/ext/swt.jar"
"$unpackP" -r "$libP/ext/DJNativeSwing-SWT.pack.gz" \
	"$libP/ext/DJNativeSwing-SWT.jar"
"$unpackP" -r "$libP/ext/xSocket-2.8.15.pack.gz" \
	"$libP/ext/xSocket-2.8.15.jar"
"$unpackP" -r "$libP/ext/EMedia.pack.gz" \
	"$libP/ext/EMedia.jar"
"$unpackP" -r "$libP/ext/xuggle-xuggler.pack.gz" \
	"$libP/ext/xuggle-xuggler.jar"
"$unpackP" -r "$libP/ext/jai_imageio.pack.gz" \
	"$libP/ext/jai_imageio.jar"

"$unpackP" -r "${targetP}/Yozo_Office.pack.gz" \
	"${targetP}/Yozo_Office.jar"

}

