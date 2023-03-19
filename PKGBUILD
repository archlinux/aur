# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: paul2lv <paul2lv@gmail.com>

pkgname=fahcontrol
pkgver=7.6.21
pkgrel=1
pkgdesc='Graphical monitor and control utility for the Folding@home client'
url=https://foldingathome.org
arch=(any)
license=(GPL3)
depends=(python2 pygtk)
optdepends=('fahviewer: 3D simulation viewer')
source=("https://download.foldingathome.org/releases/public/release/${pkgname}/centos-6.7-64bit/v${pkgver%.*}/${pkgname}-${pkgver}-1.noarch.rpm")
md5sums=('a64bc2e39282f77184991de5e4be3ff9')

prepare() {
    sed -i 's_/usr/bin/python_/usr/bin/python2_' usr/bin/FAHControl
}

package() {
    install -dm755 "${pkgdir}"/usr/lib/python2.7/site-packages/fah
    cp -R usr/lib/python2.7/site-packages/fah "${pkgdir}"/usr/lib/python2.7/site-packages
    install -Dm755 usr/bin/FAHControl -t "${pkgdir}"/usr/bin
    install -Dm644 usr/share/pixmaps/FAHControl.png -t "${pkgdir}"/usr/share/pixmaps
    install -Dm644 usr/share/applications/FAHControl.desktop -t "${pkgdir}"/usr/share/applications
}
