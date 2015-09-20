# Maintainer: Ondřej Hošek <ondra.hosek@gmail.com>
pkgname=iccxml
_pkgbase=IccXML
pkgver=0.9.8
pkgrel=1
pkgdesc="Converts between the ICC color profile format and XML"
arch=("i686" "x86_64")
url="http://sourceforge.net/projects/iccxml/"
license=('ICC')
depends=('sampleicc' 'libxml2')
source=("http://downloads.sourceforge.net/sourceforge/iccxml/IccXML-Src/$_pkgbase-$pkgver/$_pkgbase-$pkgver.tar.gz")
sha256sums=('939913d350c93f19e063e397ba2a5544975ea447c921222070dc3d9da14f20af')

build() {
	cd "$_pkgbase-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgbase-$pkgver"
	make DESTDIR="$pkgdir/" install
}
