# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=beast2
pkgver=2.6.3
pkgrel=1
pkgdesc="Bayesian Evolutionary Analysis by Sampling Trees"
arch=('x86_64')
url="http://www.beast2.org/"
license=('LGPL-2.1 License')
source=("https://github.com/CompEvol/beast2/releases/download/v${pkgver}/BEAST.v${pkgver}.Linux.tgz" "beauti.desktop" "densitree.desktop" "logcombiner.desktop" "treeannotator.desktop")
sha256sums=('8899277b0d7124ab04dc512444d45f0f1a13505f3ce641e1f117098be3e2e20d'
            '83fba4c776fd29d6852c9c412c31d98bff657e2d2d2763dfe46d4c6174a9495f'
            '40d86086691b6cb91d0af54e5dc53d6693e084242ff3cc77862650ca78667c3d'
            'c2057c6ac656e13dcfbdf580a696bc79cb22c3d5270d546eac3e2fb42d620f20'
            '960a2d9030105156e178fe8fd5a8329cf10af1e16141623da47f649f059906b0')
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
    
    install -m 755 ${srcdir}/beauti.desktop ${pkgdir}/usr/share/applications/beauti.desktop
    install -m 755 ${srcdir}/densitree.desktop ${pkgdir}/usr/share/applications/densitree.desktop
    install -m 755 ${srcdir}/logcombiner.desktop ${pkgdir}/usr/share/applications/logcombiner.desktop
    install -m 755 ${srcdir}/treeannotator.desktop ${pkgdir}/usr/share/applications/treeannotator.desktop
}
