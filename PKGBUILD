# Maintainer: ghost64 <michael at corrigan dot xyz>
# Previous Maintainer: uzerus <szymonscholz at gmail dot com>
# Previous Maintainer: Matthew Gamble 

pkgname=duck
pkgver=7.6.2.33520
pkgrel=1
pkgdesc="Cyberduck CLI"
arch=('x86_64' 'i686')
license=('GPL')
options=(!strip)
url="https://duck.sh/"
depends=(
	'java-runtime'
#	'java-environment-common'
	'pango'
	'libxi'
	'libnet'
	'libglvnd'
	'gdk-pixbuf2'
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
sha256sums_x86_64=('612aae66bef284f199ffc1dc9facc206fedc5a62a500750238f0967fa1507382')
sha256sums_i686=('8a95c65d10a9171f5ac1ed7f50e4c139d6df8080b8665821befd4d920c0eb92a')
