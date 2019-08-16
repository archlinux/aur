# Contributor: Navet56 <evandib@gmail.com> 
# Maintainer: Navet56 <evandib@gmail.com> 
# Maintainer : Anarchiste

pkgname=opmon
pkgver=0.16
pkgrel=1
license=('GPL')
arch=('x86_64')
pkgdesc="A open source RPG monster fighting game"
url="http://opmon-game.ga"
depends=('sfml' 'gcc' 'libstdc++5' 'smpeg')
makedepends=('cmake')
conflicts=('opmon-git')
source=("https://github.com/OpMonTeam/OpMon/archive/alpha-v${pkgver}.zip")
md5sums=('3EC509A1E50633B432B380D619D8E7FC')

build() {
cd ${srcdir}/OpMon-alpha-v${pkgver}

cmake  . -DCMAKE_BUILD_TYPE=Release || return 1

make || return 1

}

package()
{

mkdir "${pkgdir}/usr"
mkdir "${pkgdir}/usr/bin"
mkdir "${pkgdir}/usr/local"
mkdir "${pkgdir}/usr/share"
mkdir "${pkgdir}/usr/local/share"
mkdir "${pkgdir}/usr/local/share/OpMon"
mkdir "${pkgdir}/usr/share/applications"

cp ${srcdir}/OpMon-alpha-v${pkgver}/bin/Release/opmon ${pkgdir}/usr/bin/opmon
cp -r ${srcdir}/OpMon-alpha-v${pkgver}/data/* ${pkgdir}/usr/local/share/OpMon
cp ${srcdir}/OpMon-alpha-v${pkgver}/data/OPMon.desktop ${pkgdir}/usr/share/applications/

cd "${srcdir}/OpMon-alpha-v${pkgver}"

}
