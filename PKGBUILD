# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Epix <epixtm@protonmail.com>
pkgbase=ce-toolchain
pkgname=ce-toolchain-bin
pkgver=11.2
pkgrel=1
pkgdesc="Toolchain and libraries for C/C++ programming on the TI-84+ CE calculator series"
install=$pkgname.install
depends=("glibc" "zlib" "gcc-libs")
options=("!strip" "!staticlibs")
provides=("ce-toolchain")
conflicts=("ce-toolchain")
arch=('i686' 'x86_64')
url="https://ce-programming.github.io/toolchain/index.html"
license=('LGPL3')
source=("https://github.com/CE-Programming/toolchain/releases/download/v${pkgver}/CEdev-Linux.tar.gz")
sha256sums=('94688d7a6684a0a8521161ba2e9b0068262dcbe7b4db3867cd4b5d74af646a07')

package_ce-toolchain-bin() {
        cd "$srcdir/CEdev"

        install -d "${pkgdir}/opt/${pkgname}"
        cp -a . "${pkgdir}/opt/${pkgname}"

        chmod -R 755 "${pkgdir}/opt/${pkgname}"
        
        # profile addenums
        install -d "${pkgdir}/etc/profile.d"
        echo -e "export CEDEV=/opt/${pkgname}\nexport PATH=\$PATH:/opt/${pkgname}/bin" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
}
