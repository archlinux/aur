# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=beast2
pkgver=2.6.7
pkgrel=1
pkgdesc="Bayesian Evolutionary Analysis by Sampling Trees. https://doi.org/10.1371/journal.pcbi.1003537"
arch=('x86_64')
url="http://www.beast2.org/"
license=('LGPL-2.1 License')
provides=("beast2")
source=("https://github.com/CompEvol/beast2/releases/download/v${pkgver}/BEAST.v${pkgver}.Linux.tgz" "beauti.desktop" "densitree.desktop" "logcombiner.desktop" "treeannotator.desktop")
sha256sums=('05dcc619c2e10163f2c1089ec66149f6e53ec5a0583cd2cb8ffdccbbdb1d8183'
            '83fba4c776fd29d6852c9c412c31d98bff657e2d2d2763dfe46d4c6174a9495f'
            '40d86086691b6cb91d0af54e5dc53d6693e084242ff3cc77862650ca78667c3d'
            'c2057c6ac656e13dcfbdf580a696bc79cb22c3d5270d546eac3e2fb42d620f20'
            '960a2d9030105156e178fe8fd5a8329cf10af1e16141623da47f649f059906b0')
depends=(
	'java-runtime'
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
