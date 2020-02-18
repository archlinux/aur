# Maintainer: eriXD <the.eriXD {a.t} gmail {d.o.t} com>

pkgname=coppeliasim
pkgver=4_0_0
pkgrel=2
pkgdesc="CoppeliaSim, formerly known as V-REP, is the Swiss army knife among robot simulators."
arch=("x86_64")
url="http://www.coppeliarobotics.com/index.html"
license=("GPL" "LGPL")
#depends=('')
optdepends=('icu60: BlueZero api dependency')
#replaces=('vrep')
options=(!strip)
provides=('vrep')
install=""
source=("http://www.coppeliarobotics.com/files/CoppeliaSim_Edu_V${pkgver}_Ubuntu18_04.tar.xz"
        "coppeliasim.sh")
md5sums=('3634eaa7b5e01c258422b11761430dfc'
         'c6ac387b3f540d5d6a7bcb0b97c67828')
prepare()
{
    echo "nothing to prepare"
}

build() {
    echo "nothing to build"
}

package() {
    # Create wrapper for java8 + buider and documentation symlink
    install -Dm755 "coppeliasim.sh" "${pkgdir}/usr/bin/coppeliasim"

    if [ "$CARCH" = x86_64 ]
    then
        cd "${srcdir}/CoppeliaSim_Edu_V${pkgver}_Ubuntu18_04"
    else
        cd "${srcdir}/CoppeliaSim_Edu_V${pkgver}_Ubuntu18_04"
    fi

    # Copy the whole thing
    install -dm766 "${pkgdir}/usr/share/coppeliasim"
    yes | cp -prf . "${pkgdir}/usr/share/coppeliasim"
    chmod -R 777 "${pkgdir}/usr/share/coppeliasim"
}
