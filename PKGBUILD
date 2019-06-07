# Maintainer: Johan Manuel <johan29.manuel at gmail.com>
# Original authors: Jordi Cortadella, Michael Kishinevsky, Alex Kondratyev, Luciano Lavagno, Enric Pastor and Alexandre Yakovlev
pkgname=petrify
pkgver=5.2
pkgrel=1
pkgdesc="A tool for synthesis of Petri Nets and asynchronous circuits"
arch=('i686' 'x86_64')
url="http://www.lsi.upc.edu/~jordicf/petrify/distrib/home.html"
license=('custom')
optdepends=('graphviz')
source=("http://www.lsi.upc.edu/~jordicf/petrify/distrib/petrify-$pkgver-linux.tar.gz" LICENSE)
md5sums=('598ffbb5b830e68d43c1fbb70794951d' '4b563c944fa6b67cc03d21ab3c25212e')

package() {
  cd $srcdir
  mkdir -p "$pkgdir"/usr/{share/{licenses/petrify,doc,man/man1},bin,lib}
  cp -P petrify/bin/* "$pkgdir/usr/bin"
  cp -P petrify/lib/* "$pkgdir/usr/lib"
  cp -P petrify/doc/* "$pkgdir/usr/share/doc"
  cp -P petrify/man/man1/* "$pkgdir/usr/share/man/man1"
  cp -L LICENSE "$pkgdir/usr/share/licenses/petrify"
  chmod 755 "$pkgdir"/usr/{bin,lib}/* 
  chmod 644 "$pkgdir"/usr/share/{licenses/petrify,doc,man/man1}/*
}
