# Maintainer: JP-Ellis <josh@jpellis.me>

pkgname=madgraph-madanalysis
pkgver=1.1.8
pkgrel=20160929
pkgdesc="Parton showering, hadronization and detector simulation."
url="http://madgraph.hep.uiuc.edu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('madgraph' 'tcsh' 'perl')
optdepends=('topdrawer')
makedepends=('gcc-fortran')
source=("http://madgraph.hep.uiuc.edu/Downloads/MadAnalysis_V${pkgver}.tar.gz")
sha256sums=('248bd3493f9dc4f566dd85c033754b3e7b631107ac2ad55f4793f0015bb31669')

build () {
    cd "${srcdir}/MadAnalysis"
    make
}

package() {
    mkdir -p "${pkgdir}/usr/share/madgraph/MadAnalysis"
    for f in "plot_events" "ma_card.dat" "MAVersion.txt" "README"; do
        cp -a "${srcdir}/MadAnalysis/$f" "${pkgdir}/usr/share/madgraph/MadAnalysis/$f"
    done
}

# Local Variables:
# mode: sh
# End:
