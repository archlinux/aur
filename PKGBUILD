# Maintainer: Lev Lybin <lev.lybin@gmail.com>

pkgname=upwork-beta
pkgver=4.2.77.0
_rawver=${pkgver//./_}
_hashver="963lryij439iyjhc"
pkgrel=2
pkgdesc="Team App (ex. oDesk)"
arch=('i686' 'x86_64')
url="https://www.upwork.com/downloads/new-team-application"
license=('custom')
conflicts=('upwork' 'upwork-alpha')
depends=('gtk2' 'nss' 'gconf' 'alsa-lib' 'glu' 'libxtst' 'gtkglext' 'libgcrypt15' 'libxss')
install=upwork.install

#source=('LICENSE')
#md5sums=('56198f3b7f1d0371d89a044c3e110cdd')
md5sums_i686=('97cc111bb35f59d55f4326054dfbbfbf')
md5sums_x86_64=('4df4d1f69a28421075fbc30df11849a8')

# how to get links Prod, Beta, Alpha: grep downloadUrls ~/.Upwork/Upwork/Logs/*
source_x86_64=(upwork_amd64_${pkgver}.deb::http://updates.team.odesk.com/binaries/v${_rawver}_${_hashver}/upwork_amd64.deb)
source_i686=(upwork_i386_${pkgver}.deb::http://updates.team.odesk.com/binaries/v${_rawver}_${_hashver}/upwork_i386.deb)

prepare() {
    cd "${srcdir}"
    tar -zxf "${srcdir}/data.tar.gz"
}

package() {
    cd "${srcdir}"
    cp -rp usr "${pkgdir}/usr"

    #install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
