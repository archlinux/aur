# Maintainer: Matt Warner <mattwarner2@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: Limao Luo <luolimao@gmail.com>

pkgname=spideroak-one
_PkgName=SpiderOakONE
pkgver=6.0
pkgrel=1
pkgdesc="Secure file backup, sync and sharing client. This provides the client for SpiderOakONE."
arch=('i686' 'x86_64')
url="https://spideroak.com/"
license=('custom')
depends=('glibc>=2.9')
makedepends=('desktop-file-utils')
provides=('spideroak')
conflicts=('spideroak-beta' 'spideroak')
replaces=('spideroak')
options=('!strip')
install=${pkgname}.install
source=(terms.txt)
sha256sums=('4819c8d923ab19e552e877b87adf1d45aca6adcb5dffcb238d7819501e6e6737')
if [ "$CARCH" == x86_64 ]; then
        source+=("spideroakone_${pkgver}_amd64.deb::https://spideroak.com/getbuild?platform=ubuntu&arch=x86_64")
        sha256sums+=('5825635b706da95740e4b2e1d36870d17d0cfd6a8b26ded6116708d9496e0551')
elif [ "$CARCH" == i686 ]; then
        source+=("spideroakone_${pkgver}_i386.deb::https://spideroak.com/getbuild?platform=ubuntu&arch=i386")
        sha256sums+=('0d655cddc6201188f7bb04d46774bdca42ca6e9958ed458a1bf89bc53485fc58')
fi

package() {
tar -zxvf "${srcdir}"/data.tar.gz -C "$pkgdir"/
}