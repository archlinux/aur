# Maintainer: patrickelectric <patrickelectric {a.t} gmail {d.o.t} com>

pkgname=vrep
pkgver=3_3_2
pkgrel=0.1
epoch=1
pkgdesc="V-REP is the Swiss army knife among robot simulators.

V-REP is used for fast algorithm development, factory automation simulations,
fast prototyping and verification, robotics related education, remote monitoring,
safety double-checking, etc."
arch=("i686" "x86_64")
url="http://www.coppeliarobotics.com/index.html"
license=("GPL" "LGPL")
#depends=('')
makedepends=('')
#optdepends=('')
options=(!strip)
install=""
source=("http://coppeliarobotics.com/files/V-REP_PRO_EDU_V${pkgver}_64_Linux.tar.gz"
        "vrep.sh")
source_i686=("http://coppeliarobotics.com/files/V-REP_PRO_EDU_V${pkgver}_Linux.tar.gz"
        "vrep.sh")
md5sums=('49952386d7e67a9c83b5aaf63f4de597'
         'a5f75fcd3c08b1a8c93f74997006e5d5')
md5sums_i686=('af3ca287b8ec4ad935fd16e725d414d9'
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
        cd "${srcdir}/V-REP_PRO_EDU_V${pkgver}_64_Linux"
    else
        cd "${srcdir}/V-REP_PRO_EDU_V${pkgver}_Linux"
    fi

    # Copy the whole thing
    install -dm766 "${pkgdir}/usr/share/vrep"
    yes | cp -prf . "${pkgdir}/usr/share/vrep"
    chmod -R 777 "${pkgdir}/usr/share/vrep"
}
