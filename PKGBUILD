# Maintainer: Lev Lybin <lev.lybin@gmail.com>

pkgname=upwork-beta
pkgver=4.1.314.0
_rawver=${pkgver//./_}
_hashver="0bo6g5kfbj07y2x4"
pkgrel=4
pkgdesc="Team App (ex. oDesk)"
arch=('i686' 'x86_64')
url="https://www.upwork.com/downloads/new-team-application"
license=('unknown')
conflicts=('upwork' 'upwork-alpha')
depends=('gtk2' 'nss' 'gconf' 'alsa-lib' 'glu' 'libxtst' 'gtkglext' 'libgcrypt15' 'libxss')
install=upwork.install

# how to get links Standart, Beta, Alpha: grep updates.getVersionToDownload ~/.Upwork/Upwork/Logs/* | tail -n 1 | grep -o 'http://[a-zA-Z/.0-9_]*.deb'
source_x86_64=(upwork_amd64_${pkgver}.deb::http://updates.team.odesk.com/binaries/v${_rawver}_${_hashver}/upwork_amd64.deb)
source_i686=(upwork_i386_${pkgver}.deb::http://updates.team.odesk.com/binaries/v${_rawver}_${_hashver}/upwork_i386.deb)
md5sums_i686=('2d560a17408fe2b73c8951d7ddb3b0c1')
md5sums_x86_64=('60fb1c1147db08e675fa007ac6f84b17')

prepare() {
    cd "${srcdir}"
    tar -zxf "${srcdir}/data.tar.gz"
}

package() {
    cd "${srcdir}"
    cp -rp usr "${pkgdir}/usr"
}
