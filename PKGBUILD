# Maintainer: Lev Lybin <lev.lybin@gmail.com>

pkgname=upwork-alpha
pkgver=4.1.347.0
_rawver=${pkgver//./_}
_hashver="rjk4flov9nu4se21"
pkgrel=1
pkgdesc="Team App (ex. oDesk)"
arch=('i686' 'x86_64')
url="https://www.upwork.com/downloads/new-team-application"
license=('unknown')
conflicts=('upwork-beta' 'upwork')
depends=('gtk2' 'nss' 'gconf' 'alsa-lib' 'glu' 'libxtst' 'gtkglext' 'libgcrypt15' 'libxss')
install=upwork.install

# how to get links Standart, Beta, Alpha: grep updates.getVersionToDownload ~/.Upwork/Upwork/Logs/* | tail -n 1 | grep -o 'http://[a-zA-Z/.0-9_]*.deb'
source_x86_64=(upwork_amd64_${pkgver}.deb::http://updates.team.odesk.com/binaries/v${_rawver}_${_hashver}/upwork_amd64.deb)
source_i686=(upwork_i386_${pkgver}.deb::http://updates.team.odesk.com/binaries/v${_rawver}_${_hashver}/upwork_i386.deb)
md5sums_i686=('7a3d5e63955e11e0dbaf1754fe7946be')
md5sums_x86_64=('a3f8c77968fa2737c2abc9e17a7e8955')

prepare() {
    cd "${srcdir}"
    tar -zxf "${srcdir}/data.tar.gz"
}

package() {
    cd "${srcdir}"
    cp -rp usr "${pkgdir}/usr"
}
