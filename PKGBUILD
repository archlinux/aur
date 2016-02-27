pkgname=yozo-office
_pkgver=6.1.0418.131ZH.CL01
pkgver=2013.$_pkgver
pkgrel=3
pkgdesc="Yozo Office - An M$ Office Compatible Office Suit"
url="http://www.yozosoft.com/person/"
depends=('libxtst' 'libxt')
optdepends=('ttf-ms-fonts: Arial, Times, Courier etc.'
			'ttf-ms-fonts-zh_cn: SimSun, SimHei, MSYH, Tahoma etc.')
options=('!strip')
license=("unknown")
source=("http://download.yozosoft.com/free/zh/2013/Yozo_Office_${_pkgver}.deb")
arch=('i686' 'x86_64') 
install=yozo-office.install
md5sums=(5422a094fa5f7f05707073516917d1a6)

[[ $CARCH == 'x86_64' ]] && {
#depends=('lib32-libxext')
source=("http://download.yozosoft.com/free/zh/2013/64/Yozo_Office_${_pkgver}.deb")
md5sums=(4b13b4d33a20fb30afb904d6bcd91497)
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
"$unpackP" -r "$libP/plugin.pack.gz"    "$libP/plugin.jar"
"$unpackP" -r "$libP/javaws.pack.gz"    "$libP/javaws.jar"
"$unpackP" -r "$libP/deploy.pack.gz"    "$libP/deploy.jar"
"$unpackP" -r "$libP/resources.pack.gz" "$libP/resources.jar"

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
"$unpackP" -r "$libP/ext/mysql-connector-java-5.1.18-bin.pack.gz" \
	"$libP/ext/mysql-connector-java-5.1.18-bin.jar"
"$unpackP" -r "$libP/ext/swt.pack.gz"    "$libP/ext/swt.jar"
"$unpackP" -r "$libP/ext/DJNativeSwing-SWT.pack.gz" \
	"$libP/ext/DJNativeSwing-SWT.jar"
"$unpackP" -r "$libP/ext/jhall.pack.gz" \
	"$libP/ext/jhall.jar"
"$unpackP" -r "$libP/ext/bcel-5.1.pack.gz" \
	"$libP/ext/bcel-5.1.jar"

"$unpackP" -r "${targetP}/Yozo_Office.pack.gz" \
	"${targetP}/Yozo_Office.jar"

}
