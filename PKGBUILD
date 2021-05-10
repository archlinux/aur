# Maintainer: malacology
# Contributor: malacology

pkgname=phylosuite
pkgver=1.2.2
pkgrel=1
pkgdesc="PhyloSuite is an integrated and scalable desktop platform for streamlined molecular sequence data management and evolutionary phylogenetics studies"
arch=('x86_64')
url="https://github.com/dongzhang0725/PhyloSuite"
license=('GPL3')
depends=(
	'python>=3.6'
)
source=("https://github.com/dongzhang0725/PhyloSuite/releases/download/${pkgver}/PhyloSuite_v${pkgver}_Linux.tar.gz" "PhyloSuite.desktop" "PhyloSuite.png")
md5sums=('9d43b3b2b9b076071f29f7c8f0689bd5'
         '4f07dedd56f9e15909033adf04fcef81'
         'aca08e388f8d6a180a570b31ccebe764')

package() {
  install -dm755 "$pkgdir"/usr/{bin,share/{phylosuite,applications}}
  mv "$srcdir"/PhyloSuite/* "$pkgdir"/usr/share/phylosuite
  chmod -R 755  "$pkgdir"/usr/share/phylosuite
  "$pkgdir"/usr/share/phylosuite/PhyloSuite
  install -m 755 "$srcdir"/PhyloSuite.png "$pkgdir"/usr/share/phylosuite/
  install -m 755 "$srcdir"/PhyloSuite.desktop "$pkgdir"/usr/share/applications/
}
