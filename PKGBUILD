# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=u2o-git
pkgver=0.6_2_gc84f35f
pkgrel=1
_branch=master
pkgdesc="USFM to OSIS bible format converter"
arch=('any')
url="https://github.com/adyeths/u2o"
license=('unlicense')
depends=('python')
options=(!emptydirs)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git://github.com/adyeths/${pkgname%-git}.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/-/_/g'
}

package() {
  cd "${pkgname%-git}"
  mkdir -p "$pkgdir"/usr/bin
  install -m0755 u2o.py "$pkgdir"/usr/bin/u2o
  install -m0755 utaglist.py "$pkgdir"/usr/bin/utaglist
}
