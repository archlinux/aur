# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=cura-print-cost-calculator
_reponame=PrintCostCalculator
pkgver=r18.1476ef3
pkgrel=1
pkgdesc="Print cost calculator plugin for Cura."
arch=('x86_64' 'i686')
url="Print cost calculator plugin for Cura"
license=('AGPL')
depends=('cura')
makedepends=()
provides=('cura-print-cost-calculator')
source=('git+https://github.com/nallath/PrintCostCalculator')
md5sums=('SKIP')

package() {
  cd "$srcdir/$_reponame"
  mkdir -p "$pkgdir/usr/lib/cura/plugins/$_reponame"
  cp $_reponame.py $_reponame.qml __init__.py LICENSE \
    "$pkgdir/usr/lib/cura/plugins/$_reponame/"
}

pkgver() {
  cd "$srcdir/$_reponame"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
