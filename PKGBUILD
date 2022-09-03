# Maintainer: nukeop <nuclear at gumblert dot tech>
pkgname=nuclear-player-bin
pkgver=202293_9bf1a4ce1070f344d3a7a7195428aff0
repurl=https://github.com/nukeop/nuclear
commidfull=$(git ls-remote $repurl.git -tags v$pkgver)
commid=${commidfull:0:6}
pkgrel=2
epoch=1662247798134
pkgdesc="A free, multiplatform music player app that streams from multiple sources."
arch=('x86_64')
url="http://nuclear.js.org/"
install=nuclear-player-bin.install
license=('GPL3')
depends=('libnotify' 'libappindicator-gtk3' 'libxtst' 'nss' )
source=(
    https://github.com/nukeop/nuclear/releases/download/9545bf/nuclear-9545bf.deb
    nuclear.desktop
)
md5sums=('9bf1a4ce1070f344d3a7a7195428aff0'
         'eb5a64f62697098c413c0fa1e1215819')

package()   {
    tar xf data.tar.xz

    cp --preserve=mode -r usr "${pkgdir}"
    cp --preserve=mode -r opt "${pkgdir}"

    find "${pkgdir}" -type d -exec chmod 755 {} +

    cp --preserve=mode ${srcdir}/nuclear.desktop ${pkgdir}/usr/share/applications
}