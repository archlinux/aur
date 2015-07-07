# Maintainer: Foppe HEMMINGA <foppe(at)foppe(dot)org>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=tinyuml
pkgver=0.13_02
pkgrel=4
pkgdesc="A tool for creation of UML 2 diagrams with a focus on easy use and a small & stable feature set"
arch=('i686' 'x86_64')
url="https://tinyuml.wordpress.com/about/"
license=('GPL')
depends=('java-runtime')
makedepends=('unzip')
source=("http://sourceforge.net/projects/tinyuml/files/tinyuml/0.13/tinyuml-0.13_02-bin.zip"
		"${pkgname}.sh")
md5sums=('0050ecb62f2563cb3e1f5932cf762a9c'
         'c308aec89648dc15da0b710671127927')

package(){
  cd "$srcdir"/$pkgname-$pkgver-bin/
  install -d -m755 "$pkgdir"/usr/share/java/$pkgname/lib
  install -m644 lib/*.jar "$pkgdir"/usr/share/java/$pkgname/lib/
  install -m644 $pkgname.jar "$pkgdir"/usr/share/java/$pkgname/
  install -D -m755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
