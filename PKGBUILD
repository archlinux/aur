# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christopher Rogers <slaxemulator@gmail.com>

pkgname=jnetmap
_pkgname=jNetMap
pkgver=0.5.6
subver=734
pkgrel=4
pkgdesc="Graphical network monitoring and documentation tool"
arch=('any')
url="http://rakudave.ch/jnetmap"
license=('GPL3')
depends=('java-runtime')
provide=('jnetmap')
conflicts=('jnetmap')
source=(https://rakudave.synology.me/jnetmap/${pkgname}-${pkgver}-${subver}_all.deb)
sha256sums=('bb12900f8cd8dacd7f4aa34dca838c8bf0f15a4f873c78e2019b73ef5256f9d2')

package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
    install -dm755 $pkgdir/usr/bin
    ln -s /opt/$_pkgname/jnetmap "${pkgdir}/usr/bin/jNetMap"
}
