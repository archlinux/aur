#Maintainer: weearc <q19981121@163.com>
pkgname=imewlconverter-cli
_pkgname=imewlconverter
pkgver=v2.8.0
pkgrel=0
epoch=
pkgdesc="一款开源免费的输入法词库转换程序"
arch=("x86_64")
url="https://github.com/studyzy/imewlconverter"
license=('GPL 3.0')
groups=()
depends=(
	 'dotnet-runtime'
	)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/studyzy/imewlconverter/releases/download/$pkgver/Imewlconverter_Linux_Mac.tar.gz")
noextract=()
sha256sums=("baab38d7439fd399eced6810ddd4fb8193a064a8c39ab79313a05a579b9cfae8")
validpgpkeys=()

package() {
	install -d ${pkgdir}/opt
	install -d ${pkgdir}/usr/bin
	mkdir ${pkgdir}/opt/$_pkgname
	cp $srcdir/* ${pkgdir}/opt/$_pkgname/.
	echo -e "#!/bin/bash
dotnet /opt/$_pkgname/ImeWlConverterCmd.dll" >> $pkgdir/usr/bin/$_pkgname && chmod a+x $pkgdir/usr/bin/$_pkgname 
}
