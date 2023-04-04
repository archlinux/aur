# Maintainer: malacology
# Contributor: malacology

pkgname=phylosuite
pkgver=1.2.3
pkgrel=2
pkgdesc="an integrated and scalable desktop platform for streamlined molecular sequence data management and evolutionary phylogenetics studies. https://doi.org/10.1111/1755-0998.13096"
arch=('x86_64')
url="https://github.com/dongzhang0725/PhyloSuite"
license=('GPL3')
depends=(
	'python>=3.6'
)
source=("https://github.com/dongzhang0725/PhyloSuite/releases/download/${pkgver}/PhyloSuite_v${pkgver}_Linux.tar.gz" "PhyloSuite.desktop" "PhyloSuite.png")
md5sums=('7fd6209f3ec5e20e48a7b63249e60fb8'
         'b8783008d96fa26dfd2570221243a86a'
         'aca08e388f8d6a180a570b31ccebe764')

package() {
  install -dm755 "$pkgdir"/usr/{bin/phylosuite,share/applications}
  mv "$srcdir"/PhyloSuite/* "$pkgdir"/usr/bin/phylosuite
  chmod -R 755  "$pkgdir"/usr/bin/phylosuite
  chmod +x "$pkgdir"/usr/bin/phylosuite
  install -m 755 "$srcdir"/PhyloSuite.png "$pkgdir"/usr/bin/phylosuite/
  install -m 755 "$srcdir"/PhyloSuite.desktop "$pkgdir"/usr/share/applications/
}
