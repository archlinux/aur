# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: PQCraft <0456523@gmail.com>
pkgname="clibasic"
pkgver="latest"
pkgrel=6
pkgdesc="A BASIC interpreter for the terminal written in C"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://github.com/PQCraft/clibasic"
license=('GPLv3')
depends=('glibc' 'readline' 'lib32-readline')
makedepends=('make' 'glibc' 'readline' 'lib32-readline')
source=("Makefile::https://raw.githubusercontent.com/PQCraft/clibasic/master/Makefile"
        "clibasic.c::https://raw.githubusercontent.com/PQCraft/clibasic/master/clibasic.c"
        "commands.c::https://raw.githubusercontent.com/PQCraft/clibasic/master/commands.c"
        "functions.c::https://raw.githubusercontent.com/PQCraft/clibasic/master/functions.c"
        "logic.c::https://raw.githubusercontent.com/PQCraft/clibasic/master/logic.c")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "${srcdir}"
    make clean
}

build() {
    cd "${srcdir}"
    make build
}

check() {
    cd "${srcdir}"
    [ -f ./clibasic ]
}

package() {
    cd "${pkgdir}"
    mkdir -p ./usr/bin/
    mv "${srcdir}/clibasic" "${pkgdir}/usr/bin/"
    chmod +x "${pkgdir}/usr/bin/clibasic"
}

