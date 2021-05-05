# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=beast2
pkgver=2.6.3
pkgrel=1
pkgdesc="Bayesian Evolutionary Analysis by Sampling Trees"
arch=('x86_64')
url="http://www.beast2.org/"
license=('LGPL-2.1 License')
source=("https://github.com/CompEvol/beast2/releases/download/v${pkgver}/BEAST.v${pkgver}.Linux.tgz")
sha256sums=('bc62c6ae0ac0e9ea24e670b4b604455a53ca3134c1ab80b654e618eb2be6224c')
depends=(
	'jre-openjdk-headless'
	'jre-openjdk'
	'jdk-openjdk'
	'openjdk-doc'
	'openjdk-src'
)
package() {
    mkdir "${pkgdir}/usr"
    mkdir "${pkgdir}/usr/bin"
    mkdir "${pkgdir}/usr/share"
    mkdir "${pkgdir}/usr/share/applications"
    mkdir "${pkgdir}/usr/share/beast2"
    mkdir "${pkgdir}/usr/share/beast2/bin"
    mkdir "${pkgdir}/usr/share/beast2/images"
    mkdir "${pkgdir}/usr/share/beast2/lib"
    
    install -m 755 ${srcdir}/beast/bin/applauncher ${pkgdir}/usr/share/beast2/bin/applauncher
    install -m 755 ${srcdir}/beast/bin/beast ${pkgdir}/usr/share/beast2/bin/beast
    install -m 755 ${srcdir}/beast/bin/beauti ${pkgdir}/usr/share/beast2/bin/beauti
    install -m 755 ${srcdir}/beast/bin/densitree ${pkgdir}/usr/share/beast2/bin/densitree
    install -m 755 ${srcdir}/beast/bin/loganalyser ${pkgdir}/usr/share/beast2/bin/loganalyser
    install -m 755 ${srcdir}/beast/bin/logcombiner ${pkgdir}/usr/share/beast2/bin/logcombiner
    install -m 755 ${srcdir}/beast/bin/packagemanager ${pkgdir}/usr/share/beast2/bin/packagemanager
    install -m 755 ${srcdir}/beast/bin/treeannotator ${pkgdir}/usr/share/beast2/bin/treeannotator
    
    install -m 755 ${srcdir}/beast/lib/beast.jar ${pkgdir}/usr/share/beast2/lib/beast.jar
    install -m 755 ${srcdir}/beast/lib/beast.src.jar ${pkgdir}/usr/share/beast2/lib/beast.src.jar
    install -m 755 ${srcdir}/beast/lib/DensiTree.jar ${pkgdir}/usr/share/beast2/lib/DensiTree.jar
    install -m 755 ${srcdir}/beast/lib/launcher.jar ${pkgdir}/usr/share/beast2/lib/launcher.jar
    
    install -m 755 ${srcdir}/beast/images/beast.png ${pkgdir}/usr/share/beast2/images/beast.png
    install -m 755 ${srcdir}/beast/images/beauti.png ${pkgdir}/usr/share/beast2/images/beauti.png
    install -m 755 ${srcdir}/beast/images/DensiTree.png ${pkgdir}/usr/share/beast2/images/DensiTree.png
    
    install -m 755 ${srcdir}/beast/LICENSE.txt ${pkgdir}/usr/share/beast2/LICENSE.txt
    install -m 755 ${srcdir}/beast/README.txt ${pkgdir}/usr/share/beast2/README.txt
    install -m 755 "${srcdir}/beast/VERSION HISTORY.txt" "${pkgdir}/usr/share/beast2/VERSION HISTORY.txt"
    
    ln -s /usr/share/beast2/bin/beauti ${pkgdir}/usr/bin/beauti
    ln -s /usr/share/beast2/bin/logcombiner ${pkgdir}/usr/bin/logcombiner
    ln -s /usr/share/beast2/bin/treeannotator ${pkgdir}/usr/bin/treeannotator
    ln -s /usr/share/beast2/bin/densitree ${pkgdir}/usr/bin/densitree
    
    cp ~/.cache/yay/beast2/beauti.desktop ${pkgdir}/usr/share/applications
    cp ~/.cache/yay/beast2/densitree.desktop ${pkgdir}/usr/share/applications
    cp ~/.cache/yay/beast2/logcombiner.desktop ${pkgdir}/usr/share/applications
    cp ~/.cache/yay/beast2/treeannotator.desktop ${pkgdir}/usr/share/applications
}
