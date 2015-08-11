# Maintainer: Lev Lybin <lev.lybin@gmail.com>

pkgname=upwork
pkgver=4.0.103.0
pkgrel=1
pkgdesc="Team App (ex. oDesk)"
arch=('i686' 'x86_64')
url="https://www.upwork.com/downloads/new-team-application"
license=('unknown')
depends=('gtk2' 'nss' 'gconf' 'alsa-lib' 'glu' 'libxtst' 'gtkglext' 'libgcrypt15' 'libudev0')
install=upwork.install

source_x86_64=(http://updates.team.odesk.com/binaries/v4_0_103_0_c83b8ec3fe3d726/upwork_amd64.deb)
source_i686=(http://updates.team.odesk.com/binaries/v4_0_103_0_c83b8ec3fe3d726/upwork_i386.deb)
md5sums_x86_64=('83eae4da099fb4d936a8320be53b5a70')
md5sums_i686=('8df4494d846ee9fe44839f4416f7e12f')

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
