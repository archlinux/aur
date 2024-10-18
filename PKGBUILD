# Maintainer: killab33z <killab33z @ protonmail-dot-com>
# Previous Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=pacgraph
pkgver=20110629
pkgrel=10
pkgdesc="Draws a graph of installed packages to PNG/SVG/GUI/console.  Good for finding bloat."
arch=('any')
url="https://github.com/ekorchmar/pacgraph"
raw_url="https://raw.githubusercontent.com/ekorchmar/pacgraph/refs/heads/master"
license=('GPL')
depends=('python')
optdepends=('inkscape: png backend'
            'imagemagick: png backend'
            'tk: gui version')
provides=('pacgraph')
conflicts=('pacgraph')
source=("pacgraph-$pkgver-$pkgrel::$raw_url/pacgraph"
        "pacgraph-tk-$pkgver-$pkgrel::$raw_url/pacgraph-tk"
        "pacgraph.1-$pkgver-$pkgrel::$raw_url/pacgraph.1")
sha512sums=('bbf5bb3493f0abc54324fa43fed390eb1deacfa2c01ed67a6553a1a18a6081a9f09fbae531e0de8f10693a9a9d2d9255f80df7736118fb5f61eb63df9b05c850'
            '8151966b752bf83314c7a8f24cdf6ef79249882acb64b6f8021e13bf1950d89d652a6f1793bc6cd87be3404a860e5d273b012b6983ac952560cb22780fcabe31'
            'fa3ff8b80f4ea8ffa893e51c952a0db3ffdeff262e87fbf13617ef351623fdd84c6d8a76edc3f2181baf8543230db4d0db3e16506bf899ef350d1bce81329837')

package() {
  install -Dm0755 $srcdir/pacgraph-$pkgver-$pkgrel    "$pkgdir/usr/bin/pacgraph"
  install -Dm0755 $srcdir/pacgraph-tk-$pkgver-$pkgrel "$pkgdir/usr/bin/pacgraph-tk"
  install -Dm644  $srcdir/$pkgname.1-$pkgver-$pkgrel  "$pkgdir/usr/share/man/man1/$pkgname.1"
}

