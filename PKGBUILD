# Maintainer: uzerus <szymonscholz at gmail dot com>
# Previous Maintainer: Matthew Gamble 

pkgname=duck
pkgver=6.8.3.29107
pkgrel=1
pkgdesc="Cyberduck CLI"
arch=('x86_64' 'i686')
license=('GPL')
options=(!strip)
url="https://duck.sh/"
depends=(
	'java-runtime'
	'libxtst'
	'java-environment-common'
	'libglvnd'
)
optdepends=(
	'gtk2: Graphical interface'
	'alsa-lib: Audio support'
)
source_x86_64=("https://repo.cyberduck.io/stable/x86_64/$pkgname-$pkgver.x86_64.rpm")
source_i686=("https://repo.cyberduck.io/stable/i386/$pkgname-$pkgver.i686.rpm")

package() {
     cp -R opt "${pkgdir}/opt"
     chmod -R go-w "${pkgdir}/opt/duck"
     mkdir -p "${pkgdir}/usr/bin"
     ln -s /opt/duck/duck "${pkgdir}/usr/bin/duck"
    install -Dm644 "${pkgdir}/opt/duck/duck.desktop" "${pkgdir}/usr/share/applications/duck.desktop"
}
md5sums_x86_64=('1fbfdf6f41678441abf45870af7091d3')
md5sums_i686=('2606566aaf7864c5ec334a4815e06483')
