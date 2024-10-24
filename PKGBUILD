# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christopher Rogers <slaxemulator@gmail.com>

pkgname=jnetmap
_pkgname=jNetMap
pkgver=0.5.6
subver=732
pkgrel=1
pkgdesc="Graphical network monitoring and documentation tool"
arch=('any')
url="http://rakudave.ch/jnetmap"
license=('GPL3')
depends=('java-runtime')
provide=('jnetmap')
conflicts=('jnetmap')
source=(https://rakudave.synology.me/jnetmap/${pkgname}-${pkgver}-${subver}_all.deb)
sha256sums=('c92862d514de864bc154c4c80e29a6f2ab65f2655b7ba27ab329b133d16de855')

package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
    install -dm755 $pkgdir/usr/bin
    ln -s /opt/$_pkgname/jnetmap "${pkgdir}/usr/bin/jNetMap"
}
