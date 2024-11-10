# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Epix <epixtm@protonmail.com>
pkgbase=ce-toolchain
pkgname=ce-toolchain-bin
pkgver=12.1
pkgrel=1
pkgdesc="Toolchain and libraries for C/C++ programming on the TI-84+ CE calculator series"
install=$pkgname.install
depends=("glibc" "zlib" "gcc-libs")
options=("!strip" "!staticlibs")
provides=("ce-toolchain")
conflicts=("ce-toolchain")
arch=('i686' 'x86_64')
url="https://ce-programming.github.io/toolchain/index.html"
license=('LGPL-3.0-only')
source=("https://github.com/CE-Programming/toolchain/releases/download/v${pkgver}/CEdev-Linux.tar.gz")
sha256sums=('09a707fa3194dfbfd03bae26b3fb917d9f302bcc849701c099f6de561cffb272')

package_ce-toolchain-bin() {
        cd "$srcdir/CEdev"

        install -d "${pkgdir}/opt/${pkgname}"
        cp -a . "${pkgdir}/opt/${pkgname}"

        chmod -R 755 "${pkgdir}/opt/${pkgname}"
        
        # profile addenums
        install -d "${pkgdir}/etc/profile.d"
        echo -e "export CEDEV=/opt/${pkgname}\nexport PATH=\$PATH:/opt/${pkgname}/bin" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
}
