pkgname=yozo-office
_pkgver=7.0.0299.131ZH.CL01
pkgver=7.0.0299.131ZH.CL01
pkgrel=1
pkgdesc="Yozo Office - An M$ Office Compatible Office Suit"
url="http://www.yozosoft.com/person/"
depends=('libxtst' 'libxt')
optdepends=('ttf-ms-fonts: Arial, Times, Courier etc.'
			'ttf-ms-fonts-zh_cn: SimSun, SimHei, MSYH, Tahoma etc.')
options=('!strip')
license=("unknown")
arch=('i686' 'x86_64') 
install=yozo-office.install

source_i686=('https://mirrors.ustc.edu.cn/deepin/pool/non-free/y/yozo-office-zh-cn/yozo-office-zh-cn_7.0.0299.131ZH.CL01_i386.deb')
source_x86_64=('https://mirrors.ustc.edu.cn/deepin/pool/non-free/y/yozo-office-zh-cn/yozo-office-zh-cn_7.0.0299.131ZH.CL01_amd64.deb')
md5sums_i686=('9ef25d439e7a8e0e227582568c205188')
md5sums_x86_64=('5a2f98be0465615a1a7b021fa1c43261')

package() {
cd "$srcdir"
tar zxf data.tar.gz
mv usr etc "$pkgdir"

targetP="${pkgdir}/usr/local/Yozosoft/Yozo_Office"
unpackP="${targetP}/Jre/bin/unpack200"
libP="${targetP}/Jre/lib"

find "${pkgdir}" -type f -name '*.pack.gz' | while read x;do
"$unpackP" -r "$x" "${x%pack.gz}jar"
done

}
