# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=cufflinks-bin
_realname=cufflinks
pkgver=2.2.1
pkgrel=1
pkgdesc="Transcriptome assembly and differential expression analysis for RNA-Seq."
url="http://cole-trapnell-lab.github.io/cufflinks/"
arch=("x86_64")
license=("Boost Software License v1")
provides=('cufflinks')
conflicts=('cufflinks')
source=("https://cole-trapnell-lab.github.io/cufflinks/assets/downloads/$_realname-$pkgver.Linux_x86_64.tar.gz")
sha1sums=('55fcb817faae45f465ccfaddceacc217307fc33a')

package() {
    cd "$srcdir/$_realname-${pkgver}.Linux_x86_64"

    for exe in "cuffcompare" "cuffdiff" "cufflinks" "cuffmerge" "cuffnorm" "cuffquant" "gffread" "gtf_to_sam" ; do
        install -D -m 755 $exe "${pkgdir}/usr/bin/$exe"
    done
}
