# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Epix <epixtm@protonmail.com>
pkgbase=ce-toolchain
pkgname=ce-toolchain-bin
pkgver=15.0
pkgrel=1
pkgdesc="Toolchain and libraries for C/C++ programming on the TI-84+ CE calculator series"
install=$pkgname.install
depends=("glibc" "zlib" "gcc-libs" "zstd")
options=("!strip" "!staticlibs")
provides=("ce-toolchain")
conflicts=("ce-toolchain")
arch=('i686' 'x86_64')
url="https://ce-programming.github.io/toolchain/index.html"
license=('LGPL-3.0-only')
source=("CEdev-Linux-${pkgver}.tar.gz::https://github.com/CE-Programming/toolchain/releases/download/v${pkgver}/CEdev-Linux.tar.gz")
sha256sums=('85f4794a617b134249a9cba8a084414e86e16d2a68377b1d72ace30c636dbdf9')

package_ce-toolchain-bin() {
        cd "$srcdir/CEdev"

        install -d "${pkgdir}/opt/${pkgname}"
        cp -a . "${pkgdir}/opt/${pkgname}"

        chmod -R 755 "${pkgdir}/opt/${pkgname}"
        
        # profile addenums
        install -d "${pkgdir}/etc/profile.d"
        echo -e "export CEDEV=/opt/${pkgname}\nexport PATH=\$PATH:/opt/${pkgname}/bin" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
}
