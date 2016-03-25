# Maintainer: M0Rf30

pkgname=unrealtournament-bonuspack1
pkgver=20000225
pkgrel=3
pkgdesc="Bonuspack 1: The Epic Pack for Unreal Tournament."
arch=('i686' 'x86_64')
url="http://www.unrealtournament2004.com/utgoty/"
license=('custom')
groups=(unrealtournament unrealtournament-bonuspacks)
depends=(unrealtournament)
makedepends=(umodunpack)
conflicts=(ut1999-bonuspack1)
source=(https://github.com/XenGi/oldgames/raw/master/ut/utbonuspack.zip)

package() {
    cd "${srcdir}"
    install --directory -m775 -- ${pkgdir}/opt/ut/{System,Textures}
    umodunpack --base ${pkgdir}/opt/ut --unpack UTBonusPack.umod \
            || return 1
    mv -f -t ${pkgdir}/opt/ut/System -- ${pkgdir}/opt/ut/system/*
    mv -f -t ${pkgdir}/opt/ut/Textures -- ${pkgdir}/opt/ut/textures/*
    rm -rf -- ${pkgdir}/opt/ut/{system,textures}
}

md5sums=('e79b05b8a302593b53721e2a4295c6c0')

