# Maintainer: ghost64 <michael at corrigan dot xyz>
# Previous Maintainer: uzerus <szymonscholz at gmail dot com>
# Previous Maintainer: Matthew Gamble 

pkgname=duck
pkgver=7.2.2.32045
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
source_x86_64=("https://repo.cyberduck.io/stable/x86_64/$pkgname-$pkgver.$CARCH.rpm")
source_i686=("https://repo.cyberduck.io/stable/i386/$pkgname-$pkgver.$CARCH.rpm")

package() {
     cp -R opt "${pkgdir}/opt"
     chmod -R go-w "${pkgdir}/opt/duck"
     mkdir -p "${pkgdir}/usr/bin"
     ln -s /opt/duck/duck "${pkgdir}/usr/bin/duck"
    install -Dm644 "${pkgdir}/opt/duck/duck.desktop" "${pkgdir}/usr/share/applications/duck.desktop"
}
md5sums_x86_64=('f52961666b7afefa763081c4ca032be1')
md5sums_i686=('122eb22d219a52e420fa137f3b0a13ff')
