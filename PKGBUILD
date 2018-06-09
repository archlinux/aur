# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Ben Davenport-Ray <me@lazr.space>
pkgname=petit-larceny-bin
pkgver=1.3
pkgrel=1
pkgdesc="Petit Larceny is an R7RS-conformant Scheme implementation that compiles to C."
arch=(i686 x86_64)
url="http://larcenists.org"
license=('unknown; BSD-like')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.larcenists.org/LarcenyReleases/larceny-${pkgver}-bin-petit-stdc-linux86.tar.gz")
noextract=()
md5sums=('f57b9387c56fd8a70326203c405a6c32')
validpgpkeys=()

package() {
    cd "larceny-${pkgver}-bin-petit-stdc-linux86"
    sed -i 's|# LARCENY_ROOT.*|LARCENY_ROOT=/usr/share/petit-larceny|' larceny

    install -D larceny ${pkgdir}/usr/bin/larceny
    install -D petit-larceny.bin ${pkgdir}/usr/share/petit-larceny/petit-larceny.bin
    install -D petit-larceny.heap ${pkgdir}/usr/share/petit-larceny/petit-larceny.heap
    install -D startup.sch ${pkgdir}/usr/share/petit-larceny/startup.sch
    install -D compile-stale ${pkgdir}/usr/share/petit-larceny/compile-stale
    install -D COPYRIGHT ${pkgdir}/usr/share/petit-larceny/COPYRIGHT
    install -D README-FIRST.txt ${pkgdir}/usr/share/petit-larceny/README-FIRST.txt
    install -D scheme-script ${pkgdir}/usr/share/petit-larceny/scheme-script
    ln -s ${pkgdir}/usr/share/petit-larceny/scheme-script ${pkgdir}/usr/bin/scheme-script

    cp --preserve=timestamps -R lib ${pkgdir}/usr/share/petit-larceny/
    cp --preserve=timestamps -R doc ${pkgdir}/usr/share/petit-larceny/
}

