# Maintainer: nukeop <nuclear at gumblert dot tech>
pkgname=nuclear-player-bin
pkgver=2022414_6658b61feeee16266290b540096bf735
repurl=https://github.com/nukeop/nuclear
commidfull=$(git ls-remote $repurl.git -tags v$pkgver)
commid=${commidfull:0:6}
pkgrel=2
epoch=1649895782920
pkgdesc="A free, multiplatform music player app that streams from multiple sources."
arch=('x86_64')
url="http://nuclear.js.org/"
install=nuclear-player-bin.install
license=('GPL3')
depends=('libnotify' 'libappindicator-gtk3' 'libxtst' 'nss' )
source=(
    https://github.com/nukeop/nuclear/releases/download/52769a/nuclear-52769a.deb
    nuclear.desktop
)
md5sums=('6658b61feeee16266290b540096bf735'
         'eb5a64f62697098c413c0fa1e1215819')

package()   {
    tar xf data.tar.xz

    cp --preserve=mode -r usr "${pkgdir}"
    cp --preserve=mode -r opt "${pkgdir}"

    find "${pkgdir}" -type d -exec chmod 755 {} +

    cp --preserve=mode ${srcdir}/nuclear.desktop ${pkgdir}/usr/share/applications
}