# Maintainer: Sigmund Vestergaard <sigmundv at gmail dot com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=openstego
pkgver=0.7.0
pkgrel=1
pkgdesc="Plugin based tool for steganography, with encrytion support."
arch=('i686' 'x86_64')
url="http://openstego.sourceforge.net"
license=('GPL2')
depends=('java-environment' 'java-runtime' 'x-server')
makedepends=('unzip')
source=(https://github.com/syvaidya/openstego/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.zip $pkgname.sh)
sha256sums=('6cf89b9441abe60d8e1bea6dabb8a86ff6c93007f5524678a1f50b3385574dc7'
            'ca7876d874eef214d238d1b43809c1eb2bb5b327d7b5188198ecfc29a036061e')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m644 lib/$pkgname.jar "$pkgdir"/usr/share/java/$pkgname/$pkgname.jar
  install -D -m644 README "$pkgdir"/usr/share/doc/$pkgname/README
  install -D -m755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
