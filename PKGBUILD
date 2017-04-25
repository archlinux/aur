# Maintainer: patrickelectric <patrickelectric {a.t} gmail {d.o.t} com>

pkgname=vrep
pkgver=3_4_0
pkgrel=3
epoch=1
pkgdesc="V-REP is the Swiss army knife among robot simulators.

V-REP is used for fast algorithm development, factory automation simulations,
fast prototyping and verification, robotics related education, remote monitoring,
safety double-checking, etc."
arch=("x86_64")
url="http://www.coppeliarobotics.com/index.html"
license=("GPL" "LGPL")
#depends=('')
makedepends=('')
#optdepends=('')
options=(!strip)
install=""
source=("http://coppeliarobotics.com/files/V-REP_PRO_EDU_V${pkgver}_Linux.tar.gz"
        "vrep.sh")
md5sums=('a3c0f872b91703909608aee092ad03df'
         'a5f75fcd3c08b1a8c93f74997006e5d5')
prepare()
{
    echo "nothing to prepare"
}

build() {
    echo "nothing to build"
}

package() {
    # Create wrapper for java8 + buider and documentation symlink
    install -Dm755 "vrep.sh" "${pkgdir}/usr/bin/vrep"

    if [ "$CARCH" = x86_64 ]
    then
        cd "${srcdir}/V-REP_PRO_EDU_V${pkgver}_Linux"
    else
        cd "${srcdir}/V-REP_PRO_EDU_V${pkgver}_Linux"
    fi

    # Copy the whole thing
    install -dm766 "${pkgdir}/usr/share/vrep"
    yes | cp -prf . "${pkgdir}/usr/share/vrep"
    chmod -R 777 "${pkgdir}/usr/share/vrep"
}
