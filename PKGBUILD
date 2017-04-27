# Maintainer: JP-Ellis <josh@jpellis.me>

pkgname=madgraph-madanalysis
pkgver=1.1.8
pkgrel=20170424
pkgdesc="Parton showering, hadronization and detector simulation."
url="http://madgraph.hep.uiuc.edu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('madgraph' 'tcsh' 'perl')
optdepends=('topdrawer')
makedepends=('gcc-fortran')
source=("http://madgraph.hep.uiuc.edu/Downloads/MadAnalysis_V${pkgver}.tar.gz")
sha256sums=('8820b304daa42d5d72d799a7ac1703c01011832b40b1fd02514500df3e38325e')

build () {
    cd "${srcdir}/MadAnalysis"
    make
}

package() {
    files=("combine-pl"
           "epstosmth"
           "ma_card.dat"
           "makefile"
           "MAVersion.txt"
           "plot_events"
           "README"
           "restorelinks.sh"
           "script")

    mkdir -p "${pkgdir}/opt/madgraph/MadAnalysis"
    for f in "${files[@]}"; do
        cp -a "${srcdir}/MadAnalysis/$f" "${pkgdir}/opt/madgraph/MadAnalysis/$f"
    done
}

# Local Variables:
# mode: sh
# End:
