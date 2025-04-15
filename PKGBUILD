# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christopher Rogers <slaxemulator@gmail.com>

pkgname=jnetmap
_pkgname=jNetMap
pkgver=0.5.6
subver=735
pkgrel=1
pkgdesc="Graphical network monitoring and documentation tool"
arch=('any')
url="http://rakudave.ch/jnetmap"
license=('GPL3')
depends=('java-runtime')
provide=('jnetmap')
conflicts=('jnetmap')
source=(https://rakudave.synology.me/jnetmap/${pkgname}-${pkgver}-${subver}_all.deb)
sha256sums=('f5aa50cd7bbbe83e0d1f65131e6088a2ea8710133d617016255d6448def4a823')

package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
    install -dm755 $pkgdir/usr/bin
    ln -s /opt/$_pkgname/jnetmap "${pkgdir}/usr/bin/jNetMap"
}
