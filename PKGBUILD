# Maintainer: ReneganRonin <renegan.ronin@gmail.com>

pkgname=madgraph-madanalysis
pkgver=1.1.8
pkgrel=20210407
pkgdesc="Parton showering, hadronization and detector simulation."
url="http://madgraph.hep.uiuc.edu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('madgraph' 'tcsh' 'perl')
optdepends=('topdrawer')
makedepends=('gcc-fortran')
source=("http://madgraph.physics.illinois.edu/Downloads/MadAnalysis_V${pkgver}.tar.gz")
sha256sums=('d13499ad806e1e282801b803c3c78e52bf6ef664d75270f811ff0356ac1170a7')

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

    install -dm755 "${pkgdir}/opt/madgraph/MadAnalysis"
    for f in "${files[@]}"; do
        cp -a "${srcdir}/MadAnalysis/$f" "${pkgdir}/opt/madgraph/MadAnalysis/$f"
    done
}

# Local Variables:
# mode: sh
# End:
