# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=jane
pkgver=4
pkgrel=1
pkgdesc="software tool for the cophylogeny reconstruction problem"
arch=('x86_64')
url="http://www.beast2.org/"
license=('Harvey Mudd College source code & Apache License')
source=("https://www.cs.hmc.edu/~hadas/jane/downloads/linux.tar.gz" "jane.desktop" "jane.png")
sha256sums=('7cd00209eb7fcf65124b768e9d502065c45ced1800a8d691911daeb4d1664333'
            '59006d5049b718c906004912676f0d09dd8732a53ddca2697022c07f10176715'
            'cf2275b7de1beb05e3be078409f596d0f88735888ee6e8298977ee6a1427a6c1')
depends=(
	'jre-openjdk-headless'
	'jre-openjdk'
	'jdk-openjdk'
	'openjdk-doc'
	'openjdk-src'
)
package() {
    install -dm755 "$pkgdir"/usr/{bin,share/{jane,icons,applications}}
    install -m 755 ${srcdir}/*.desktop ${pkgdir}/usr/share/applications
    install -m 755 ${srcdir}/*.png ${pkgdir}/usr/share/icons
    mv "$srcdir"/* "$pkgdir"/usr/share/jane
    ln -s /usr/share/jane/lib/jane.jar ${pkgdir}/usr/bin/jane
    
}
