# Maintainer: Lev Lybin <lev.lybin@gmail.com>

pkgname=upwork
pkgver=4.0.70.0
pkgrel=1
pkgdesc="Team App (ex. oDesk)"
arch=('i686' 'x86_64')
url="https://www.upwork.com/downloads/new-team-application"
license=('unknown')
depends=('gtk2' 'gcc-libs-multilib' 'nss' 'gconf' 'alsa-lib' 'glu' 'libxtst' 'gtkglext' 'libgcrypt15' 'libudev.so.0')
install=upwork.install

source_x86_64=(http://updates.team.odesk.com/binaries/v4_0_70_0_bccbf5c8e0866/upwork_amd64.deb)
sha256sums_x86_64=('026226b1411a0b22b79beb241e82a5682cc5379e0eace517e5056f902fda3f11')
source_i686=(http://updates.team.odesk.com/binaries/v4_0_70_0_bccbf5c8e0866/upwork_i386.deb)
sha256sums_i686=('5a2f955e3b12b5c7448f79604f6d645ff56b9f7aaccd65d7c7338749aee629f3')

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
