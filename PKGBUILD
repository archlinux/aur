# Maintainer: Matt Warner <mattwarner2@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: Limao Luo <luolimao@gmail.com>

pkgname=spideroak-one
_PkgName=SpiderOakONE
pkgver=6.1
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
        sha256sums+=('4501c7f76e846acc9d99073e9920fd17a0531fa90ff3da0bcef8ae7239fe9408')
elif [ "$CARCH" == i686 ]; then
        source+=("spideroakone_${pkgver}_i386.deb::https://spideroak.com/getbuild?platform=ubuntu&arch=i386")
        sha256sums+=('0bb66a2fc60fdc2ceabed2c574d296ae6bd37a17b73d65af948fd2850cd2c4e2')
fi

package() {
tar -zxvf "${srcdir}"/data.tar.gz -C "$pkgdir"/
}