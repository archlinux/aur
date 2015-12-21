# Maintainer: Thanh Ha <thanh.ha@alumni.carleton.ca>

pkgname=spideroak-blue
_PkgName=SpiderOakBlue
pkgver=6.0.2
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
        sha256sums+=('8542fa61dca34351996e4df871335e2226415748afb1d68bb8f5ba9e35ca9c8b')
elif [ "$CARCH" == i686 ]; then
        source+=("spideroakblue_${pkgver}_i386.deb::https://spideroak.com/getbuild?platform=ubuntu&arch=i386&brand=so.blue")
        sha256sums+=('93554287201d4297bf1d07871af81dd0fd31bde0adc4aa3f187eb05e9b56eaf4')
fi

package() {
tar -zxvf "${srcdir}"/data.tar.gz -C "$pkgdir"/
}
