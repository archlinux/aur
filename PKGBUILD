# Maintainer Sokoloft https://www.sokoloft.xyz/contact/
# Contributor greyltc
# Contributor piernov
# Forked from "flexbv-bin" and modified

pkgname=flexbv-free
pkgver=5.0373
pkgrel=1
pkgdesc="FlexBV Free. Professional Boardview Software."
arch=('x86_64')
url="https://pldaniels.com/flexbv5/"
license=('custom')
conflicts=('flexbv-beta-bin' 'flexbv-bin' 'flexbv-unstable-bin')
depends=('sdl2' 'fontconfig' 'sqlite' 'zlib' 'gtk3' 'libpng')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://pldaniels.com/flexbv5/free/FlexBVFree-${pkgver}-linux.tar.gz"
	"flexbv.desktop"
	"flexbv-free-icon.svg::https://pldaniels.com/flexbv5/assets/flexbv-free-icon.svg")
sha256sums=('9d9ef206edaf0f00e03abf489ee567381bdaac6192e40eb73b15477ddc857d22'
            'ee12188b6faa294e00751c99c92cdfb744fc8b8fb0f9a9585c42e4b4b1a17ed8'
            'e19c10e335eb9ba4278317c5f0f07f25e9051f0bcd3b6bb0fb85b3b2ee73124e')

package() {
	install -D "FlexBVFree-$pkgver-linux"/* "$pkgdir/usr/bin/flexbv"
	install -D -m755 flexbv.desktop "$pkgdir/usr/share/applications/flexbv.desktop" # two different paths on arch wiki. This one works for me on KDE
	install -D -m755 flexbv-free-icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/flexbv-free-icon.svg" # KDE works. Not tested on XFCE
}
