# Maintainer: Lev Lybin <lev.lybin@gmail.com>

pkgname=upwork
pkgver=4.0.109.0
pkgrel=1
pkgdesc="Team App (ex. oDesk)"
arch=('i686' 'x86_64')
url="https://www.upwork.com/downloads/new-team-application"
license=('unknown')
depends=('gtk2' 'nss' 'gconf' 'alsa-lib' 'glu' 'libxtst' 'gtkglext' 'libgcrypt15' 'libudev0')
install=upwork.install

source_x86_64=(http://updates.team.odesk.com/binaries/v4_0_109_0_5dd4be27f24afbda38b590/upwork_amd64.deb)
source_i686=(http://updates.team.odesk.com/binaries/v4_0_109_0_5dd4be27f24afbda38b590/upwork_i386.deb)
md5sums_x86_64=('c0379775740ede61e431b94e22cdddbe')
md5sums_i686=('2deb4a87f09b67e20e9ae1726572b46b')

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
