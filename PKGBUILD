# Maintainer: Alexandre G <alex foo lecairn bar org>
pkgname=figtree
pkgver=1.4.2
pkgrel=1
pkgdesc="Phylogenetic tree viewer"
arch=('any')
url="http://tree.bio.ed.ac.uk"
license=('GPL2')  # as stated in http://code.google.com/p/figtree/
groups=()
depends=('java-environment')
makedepends=('unzip')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.zip::http://tree.bio.ed.ac.uk/download.php?id=90&num=2" "figtree")
noextract=()
md5sums=('d3b858120612041a3f1f44ce610875b0' '917be0a986ce83ff16f80833c60bf73a')

build() {
  _figdir="${srcdir}/FigTree_v${pkgver}"
  cd ${srcdir}
  unzip -o "${pkgname}-${pkgver}.zip"
  
}

package() {
  _figdir="${srcdir}/FigTree v${pkgver}"
  
  install -D "./figtree" "${pkgdir}/usr/bin/figtree"
  install -D "${_figdir}/lib/figtree.jar" "${pkgdir}/usr/share/figtree/lib/figtree.jar"
  
  # Install doc and examples
  install -D "${_figdir}/carnivore.tree" "${pkgdir}/usr/share/doc/figtree/examples/carnivore.tree"
  install -D "${_figdir}/influenza.tree" "${pkgdir}/usr/share/doc/figtree/examples/influenza.tree"
  install -D "${_figdir}/README.txt"     "${pkgdir}/usr/share/doc/figtree/README.txt"
}
