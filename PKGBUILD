# Maintainer: Epix <epixtm@protonmail.com>
pkgname=ce-toolchain
pkgver=9.2.2
pkgrel=1
pkgdesc="Toolchain and libraries for C/C++ programming on the TI-84+ CE calculator series"
arch=('i686' 'x86_64')
url="https://ce-programming.github.io/toolchain/index.html"
license=('LGPL3')
source=("https://github.com/CE-Programming/toolchain/releases/download/v${pkgver}/linux_CEdev_v${pkgver}.tar.gz")
sha256sums=('7d5ce9b5200677357ce1b351fb4c3ba5aa6944d42745b3c504a38bf99db9a17b')

package() {
        cd "$srcdir/CEdev"

        install -d "${pkgdir}/opt/${pkgname}"
        cp -a . "${pkgdir}/opt/${pkgname}"

        chmod -R 755 "${pkgdir}/opt/${pkgname}"
        
        # profile addenums
        install -d "${pkgdir}/etc/profile.d"
        echo -e "export CEDEV=/opt/${pkgname}\nexport PATH=\$PATH:/opt/${pkgname}/bin" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
}
