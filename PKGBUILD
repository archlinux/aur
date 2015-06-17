# Mantainer: M0Rf30

pkgname=unrealtournament-bonuspack4
pkgver=20001223
pkgrel=2
pkgdesc="Bonuspack 4: The Christmas 2000 Pack for Unreal Tournament."
arch=('i686' 'x86_64')
url="http://www.unrealtournament2004.com/utgoty/"
license=('custom')
groups=(unrealtournament unrealtournament-bonuspacks)
depends=(unrealtournament)
conflicts=(ut1999-bonuspack4)
makedepends=(umodunpack)
source=(http://downloads.unrealadmin.org/UnrealTournament/BonusPack/utbonuspack4.zip)

package() {
    cd "${srcdir}"
    install --directory -- ${pkgdir}/opt/ut/{System,Textures}
    umodunpack --base ${pkgdir}/opt/ut --unpack UTBonusPack4.umod \
            || return 1
    mv -f -t ${pkgdir}/opt/ut/System -- ${pkgdir}/opt/ut/system/*
    mv -f -t ${pkgdir}/opt/ut/Textures -- ${pkgdir}/opt/ut/textures/*
    rm -rf -- ${pkgdir}/opt/ut/{system,textures}
}

md5sums=('c9e7373ee15472ec53e62a7199f33966')

