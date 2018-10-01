# Maintainer: Dmytri Kleiner <dk@trick.ca>

#
# derived from spideroak-one AUR packges
#
# Contributor: Matt Warner <mattwarner001@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: Limao Luo <luolimao@gmail.com>
#

#
# SpiderOakGroups
#

pkgname=spideroak-groups
pkgver=7.3.0
pkgrel=4
pkgdesc='SpiderOak Groups'
arch=(x86_64)
url='https://spideroak.com/'
license=('custom')
depends=('glibc>=2.9' 'desktop-file-utils')
provides=('spideroak-groups')
install=${pkgname}.install
_rpmname=("SpiderOakGroups.$pkgver.$arch.rpm")
source=("$_rpmname::https://spideroak.com/release/so.blue/rpm_x64" 'terms.txt')
noextract=("$_rpmname")
sha256sums=('ee9633ee3e119cc21360b6abee609903ba031bd79402d81755caafdb37c6e876' '4819c8d923ab19e552e877b87adf1d45aca6adcb5dffcb238d7819501e6e6737')
options=('!strip')
package() {
  bsdtar -xf $_rpmname -C $pkgdir
  install -Dm644 "$srcdir"/terms.txt "$pkgdir"/usr/share/licenses/$pkgname/terms.txt
}

