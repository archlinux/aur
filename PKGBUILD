# Maintainer: Lev Lybin <lev.lybin@gmail.com>

pkgname=upwork
pkgver=4.1.351.0
_rawver=${pkgver//./_}
_hashver="a7qf2qa9wn508n52"
pkgrel=1
pkgdesc="Team App (ex. oDesk)"
arch=('i686' 'x86_64')
url="https://www.upwork.com/downloads/new-team-application"
license=('custom')
conflicts=('upwork-beta' 'upwork-alpha')
depends=('gtk2' 'nss' 'gconf' 'alsa-lib' 'glu' 'libxtst' 'gtkglext' 'libgcrypt15' 'libxss')
install=upwork.install

source=("https://dl.devtrue.net/archlinux/upwork/LICENSE")
md5sums=('56198f3b7f1d0371d89a044c3e110cdd')
# how to get links Standart, Beta, Alpha: grep updates.getVersionToDownload ~/.Upwork/Upwork/Logs/* | tail -n 1 | grep -o 'http://[a-zA-Z/.0-9_]*.deb'
source_x86_64=(upwork_amd64_${pkgver}.deb::http://updates.team.odesk.com/binaries/v${_rawver}_${_hashver}/upwork_amd64.deb)
source_i686=(upwork_i386_${pkgver}.deb::http://updates.team.odesk.com/binaries/v${_rawver}_${_hashver}/upwork_i386.deb)
md5sums_i686=('c5a878647632d25f257917fd7258f558')
md5sums_x86_64=('3a62f040cad70b67ea13e3de381e1cd8')

prepare() {
    cd "${srcdir}"
    tar -zxf "${srcdir}/data.tar.gz"
}

package() {
    cd "${srcdir}"
    cp -rp usr "${pkgdir}/usr"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
