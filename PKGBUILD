# Maintainer: Mikel Pintado <mikelaitornube2010@gmail.com>

pkgname=nuclear-player
pkgver=0.4.3
pkgrel=2
pkgdesc="A free, multiplatform music player app that streams from multiple sources."
arch=('x86_64')
url="http://nuclear.gumblert.tech/"
install=nuclear-player.install
license=('GPL3')
depends=('gconf' 'libnotify' 'libappindicator-gtk3' 'libxtst' 'nss')
source=(
    https://github.com/nukeop/nuclear/releases/download/v${pkgver}/nuclear_${pkgver}_amd64.deb
    nuclear.desktop
)
md5sums=(
    '0499640e2bfab3abcdb1dd898b97d77e'
    '02328fb5995b2e92b3ee11dca5c6b262'    
)

package()   {
    tar xf data.tar.xz

    cp --preserve=mode -r usr "${pkgdir}"
    cp --preserve=mode -r opt "${pkgdir}"

    find "${pkgdir}" -type d -exec chmod 755 {} +

    cp --preserve=mode ${srcdir}/nuclear.desktop ${pkgdir}/usr/share/applications
}
