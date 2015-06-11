# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: der_FeniX <derfenix dot gmail.com>
# Contributor: Stephen Weinberg <[firstname]@q5comm.com>

pkgname=odeskteam-beta
pkgver=3.12.19
pkgrel=1
pkgdesc="The oDesk Team client for odesk.com"
arch=('i686' 'x86_64')
conflicts=('godesk' 'odeskteam')
url="http://www.odesk.com/downloads"
license=('custom:ODESK TEAM LICENSE AGREEMENT')
depends=('libxss' 'phonon-qt4')

source_x86_64=(https://www.odesk.com/downloads/linux/beta/odeskteam_${pkgver}_amd64.deb)
sha256sums_x86_64=('c2687daf78b6ca25b000e2805fdadcd93d0071c718d2796f8873037d4f778b5b')
source_i686=(https://www.odesk.com/downloads/linux/beta/odeskteam_${pkgver}_i386.deb)
sha256sums_i686=('7209a631f7e091d4c8af6e375ed9a28989c2845124f862de58abd1007f0c94d8')

prepare() {
    cd "${srcdir}"
    tar -zxf "${srcdir}/data.tar.gz"
}

package() {
    cd "${srcdir}"
    cp -rp usr "${pkgdir}/usr"
    zcat usr/share/doc/odeskteam/COPYING.gz > usr/share/doc/odeskteam/COPYING
    install -Dm644 usr/share/doc/odeskteam/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
