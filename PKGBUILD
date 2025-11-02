# Maintainer: sfs <sfslinux@gmail.com>

pkgname=brushshe
pkgver=2.3.0
pkgrel=1
pkgdesc="Raster graphical editor"
arch=('any')
url="https://github.com/limafresh/Brushshe"
license=('MPL2.0' 'CC0')
depends=('python' 'tk' 'python-pillow')
source=("brushshe-${pkgver}.deb::https://github.com/limafresh/Brushshe/releases/download/v2.3.0-vientiane/brushshe.deb"
	"brushshe.desktop")
sha256sums=('25964eb843ee353beddf4f40e1e308c115837490a09c90db4421492397aac697'
	    '93bf03e1c2b41f671aea4701b4c0685ac74051c9e343d37429b3f0de0ee705ce')

prepare() {
    tar -xf data.tar.xz
}

package() {
    cp -dr --no-preserve=ownership opt usr "${pkgdir}"/
    install -Dm644 $srcdir/brushshe.desktop "$pkgdir/usr/share/applications/brushshe.desktop"
}
