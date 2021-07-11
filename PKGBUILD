# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: PQCraft <0456523@gmail.com>
pkgname="clibasic"
pkgver="latest"
pkgrel=3
pkgdesc="A BASIC interpreter for the terminal written in C"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://github.com/PQCraft/clibasic"
license=('GPLv3')
depends=('readline' 'lib32-readline')
makedepends=('glibc' 'make' 'readline' 'lib32-readline')
source=("Makefile::https://raw.githubusercontent.com/PQCraft/clibasic/master/Makefile"
        "clibasic.c::https://raw.githubusercontent.com/PQCraft/clibasic/master/clibasic.c"
        "commands.c::https://raw.githubusercontent.com/PQCraft/clibasic/master/commands.c"
        "functions.c::https://raw.githubusercontent.com/PQCraft/clibasic/master/functions.c"
        "logic.c::https://raw.githubusercontent.com/PQCraft/clibasic/master/logic.c")
sha256sums=('a00c4b01eb8d9838e8cdd6473309f1f98aa250740fce62e2664f1c8c384f622e'
            '1a3c80a96d7444df8c75d3c84d6fe2ce06e8a74beec64446026337d8a91c0d3c'
            '6e71e76b8943e5f7fcba9a30b56e6c52f307f034260390037b50885c7d62e119'
            '50278d8801280c2d7eb7788db010487909ccb812e29b098c948bc1d520493211'
            '9832e6065abebac396632ffdd6f5fcb34bc94045276c4661bdfd212a51fce64f')

prepare() {
    #echo "prepare()"
    #echo "srcdir: ${srcdir}"
    #echo "pkgdir: ${pkgdir}"
    cd ${srcdir}
    make clean
}

build() {
    #echo "build()"
    #echo "srcdir: ${srcdir}"
    #echo "pkgdir: ${pkgdir}"
    cd ${srcdir}
    make build
}

check() {
    #echo "check()"
    #echo "srcdir: ${srcdir}"
    #echo "pkgdir: ${pkgdir}"
    cd ${srcdir}
    [ -f ./clibasic ]
}

package() {
    #echo "package()"
    #echo "srcdir: ${srcdir}"
    #echo "pkgdir: ${pkgdir}"
    cd ${pkgdir}
    mkdir -p ./usr/bin/
    mv ${srcdir}/clibasic ${pkgdir}/usr/bin/
}

