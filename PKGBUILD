# Maintainer: Valerii Huz <ghotrix@gmail.com>
pkgname=clop
pkgver=1
pkgrel=1
pkgdesc="Confident Local Optimization for Noisy Black-Box Parameter Tuning"
arch=('any')
depends=('qt4')
url="https://www.remi-coulom.fr/CLOP/"
license=('GPL3')
source=("https://www.remi-coulom.fr/CLOP/CLOP-0.0.9.tar.bz2")
md5sums=("902d566fc0ff00f69476a7386081444a")
project_dir="CLOP-0.0.9/programs/clop/compqt"

build() {
    cd "${project_dir}"
    for d in */; do cd "${d}"; qmake-qt4; make; cd ..; done
}

package() {
    cd "${project_dir}"
	install -Dm 755 clop-console/clop-console $pkgdir/usr/bin/clop-console
	install -Dm 755 clop-gui/clop-gui $pkgdir/usr/bin/clop-gui
}

