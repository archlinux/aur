# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=beast2
pkgver=2.6.4
pkgrel=1
pkgdesc="Bayesian Evolutionary Analysis by Sampling Trees"
arch=('x86_64')
url="http://www.beast2.org/"
license=('LGPL-2.1 License')
source=("https://github.com/CompEvol/beast2/releases/download/v${pkgver}/BEAST.v${pkgver}.Linux.tgz" "beauti.desktop" "densitree.desktop" "logcombiner.desktop" "treeannotator.desktop")
sha256sums=('4f80e2920eb9d87f3e9f64433119774dc67aca390fbd13dd480f852e3f8701a4'
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
    install -dm755 "$pkgdir"/usr/{bin,share/{beast2,applications}}
    mv "$srcdir"/beast/* "$pkgdir"/usr/share/beast2
        
    ln -s /usr/share/beast2/bin/beauti ${pkgdir}/usr/bin/beauti
    ln -s /usr/share/beast2/bin/logcombiner ${pkgdir}/usr/bin/logcombiner
    ln -s /usr/share/beast2/bin/treeannotator ${pkgdir}/usr/bin/treeannotator
    ln -s /usr/share/beast2/bin/densitree ${pkgdir}/usr/bin/densitree
    
    install -m 755 ${srcdir}/*.desktop ${pkgdir}/usr/share/applications
}
