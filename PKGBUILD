# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Tomasz Hamerla <tomasz.hamerla@outlook.com>

pkgname=powershell-bin
binaryname=pwsh
_pkgver=6.0.0-beta.9
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc='A cross-platform automation and configuration tool/framework (binary package)'
arch=('x86_64')
url='https://github.com/Powershell/Powershell'
license=('MIT')
provides=('powershell')
conflicts=('powershell')
options=(staticlibs !strip)
install=powershell.install
md5sums=('44ca09fedfb71f3ff3a5e11d8effdb8d')
source=("https://github.com/PowerShell/PowerShell/releases/download/v${_pkgver}/powershell_${_pkgver}-1.ubuntu.17.04_amd64.deb")

package() {
    bsdtar xf data.tar.gz

    mv usr "${pkgdir}"
    mv opt "${pkgdir}"

    cd "${pkgdir}"
    cp -r usr/local/share usr
    rm -rf usr/local

    chmod 755 usr/bin/$binaryname
}
