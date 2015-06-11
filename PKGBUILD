# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: der_FeniX <derfenix dot gmail.com>
# Contributor: Stephen Weinberg <[firstname]@q5comm.com>

pkgname=odeskteam
pkgver=3.12.9
pkgrel=1
pkgdesc="The oDesk Team client for odesk.com"
arch=('i686' 'x86_64')
conflicts=('godesk' 'odeskteam-beta')
url="http://www.odesk.com/downloads"
license=('custom:ODESK TEAM LICENSE AGREEMENT')
depends=('libxss' 'phonon-qt4')

source_x86_64=(https://www.odesk.com/downloads/linux/odeskteam_${pkgver}_amd64.deb)
sha256sums_x86_64=('f0c4c74ecd1085c435fcb5da2caab18919920f1d9b9794c4bc13a85477332750')
source_i686=(https://www.odesk.com/downloads/linux/odeskteam_${pkgver}_i386.deb)
sha256sums_i686=('cdf239509a5bc85eec2dd4dd445350726d6570ca5f247db8b5c1b42e8a9fd5dc')

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
