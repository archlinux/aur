# Maintainer: Advaith Madhukar <advaith.madhukar at gmail dot com>
pkgname=nuclear-player-bin
pkgver=0.6.6
repurl=https://github.com/nukeop/nuclear
commidfull=$(git ls-remote $repurl.git -tags v$pkgver)
commid=${commidfull:0:6}
pkgrel=4
pkgdesc="A free, multiplatform music player app that streams from multiple sources."
arch=('x86_64')
url="http://nuclear.gumblert.tech/"
install=nuclear-player-bin.install
license=('GPL3')
depends=('libnotify' 'libappindicator-gtk3' 'libxtst' 'nss' )
source=(
    https://github.com/nukeop/nuclear/releases/download/v${pkgver}/nuclear-v${pkgver}.deb
    nuclear.desktop
)
md5sums=(
    '3bfd3911d4e1e649d71db562f1f52ea2'
    'SKIP'    
)

package()   {
    tar xf data.tar.xz

    cp --preserve=mode -r usr "${pkgdir}"
    cp --preserve=mode -r opt "${pkgdir}"

    find "${pkgdir}" -type d -exec chmod 755 {} +

    cp --preserve=mode ${srcdir}/nuclear.desktop ${pkgdir}/usr/share/applications
}
