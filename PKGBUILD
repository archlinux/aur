# Maintainer: Lev Lybin <lev.lybin@gmail.com>

pkgname=upwork
pkgver=4.0.86.0
pkgrel=3
pkgdesc="Team App (ex. oDesk)"
arch=('i686' 'x86_64')
url="https://www.upwork.com/downloads/new-team-application"
license=('unknown')
depends=('gtk2' 'nss' 'gconf' 'alsa-lib' 'glu' 'libxtst' 'gtkglext' 'libgcrypt15' 'libudev0')
install=upwork.install

source_x86_64=(http://updates.team.odesk.com/binaries/v4_0_86_0_ba6c68c617adc98/upwork_amd64.deb)
source_i686=(http://updates.team.odesk.com/binaries/v4_0_86_0_ba6c68c617adc98/upwork_i386.deb)
md5sums_x86_64=('105368d2dbc989bddf21fc116487334c')
md5sums_i686=('efb5f40b7a42dce43354423696f1f44b')

prepare() {
    cd "${srcdir}"
    tar -zxf "${srcdir}/data.tar.gz"
}

package() {
    cd "${srcdir}"
    cp -rp usr "${pkgdir}/usr"

    mkdir -p "${pkgdir}/var/lib/Upwork/upwork"
    chmod 777 "${pkgdir}/var/lib/Upwork/upwork"
}
