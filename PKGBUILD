# Maintainer: Thanh Ha <thanh.ha@alumni.carleton.ca>

pkgname=spideroak-blue
_PkgName=SpiderOakBlue
pkgver=5.1.10
pkgrel=1
pkgdesc="Secure file backup, sync and sharing client. This provides the client for SpiderOak Blue."
arch=('i686' 'x86_64')
url="https://spideroak.com/"
license=('custom')
depends=('glibc>=2.9')
makedepends=('desktop-file-utils')
provides=('spideroak')
conflicts=('spideroak-beta' 'spideroak')
options=('!strip')
install=${pkgname}.install
source=(terms.txt)
sha256sums=('4819c8d923ab19e552e877b87adf1d45aca6adcb5dffcb238d7819501e6e6737')
if [ "$CARCH" == x86_64 ]; then
        source+=("spideroakblue_${pkgver}_amd64.deb::https://spideroak.com/getbuild?platform=ubuntu&arch=x86_64&brand=so.blue")
        sha256sums+=('31ff5366dcbca22e9ec074c9bf9e527493c1559875ff56d1bfeaf43aacdf9b4a')
elif [ "$CARCH" == i686 ]; then
        source+=("spideroakblue_${pkgver}_i386.deb::https://spideroak.com/getbuild?platform=ubuntu&arch=i386&brand=so.blue")
        sha256sums+=('ec0eaf5bcf0255519efd280ce7e319a2916584705ab277e6e97d6b184f1c8a07')
fi

package() {
tar -zxvf "${srcdir}"/data.tar.gz -C "$pkgdir"/
}
