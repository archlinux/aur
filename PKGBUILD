# Maintainer: Epix <epixtm@protonmail.com>
pkgname=ce-toolchain
pkgver=9.1
pkgrel=1
pkgdesc="Toolchain and libraries for C/C++ programming on the TI-84+ CE calculator series"
arch=('i686' 'x86_64')
url="https://ce-programming.github.io/toolchain/index.html"
license=('LGPL3')
source=("https://github.com/CE-Programming/toolchain/releases/download/v${pkgver}/linux_CEdev.zip")
sha256sums=('338e48b25369bd09167a77f70493c7b6acaa63b109aae6cd1f07c72f0708c757')

package() {
        cd "$srcdir"
        rm linux_CEdev.zip

        install -d "${pkgdir}/opt/${pkgname}"
        cp -a . "${pkgdir}/opt/${pkgname}"

        chmod -R 755 "${pkgdir}/opt/${pkgname}/bin"
        
        # profile addenums
        install -d "${pkgdir}/etc/profile.d"
        echo -e "export CEDEV=/opt/${pkgname}\nexport PATH=\$PATH:/opt/${pkgname}/bin" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
}