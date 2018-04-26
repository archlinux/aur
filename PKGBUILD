# Maintainer: Dmytro Korzhevin <dkorzhevin@gmail.com> 
# Controbutor: Sigmund Vestergaard <sigmundv at gmail dot com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=openstego
pkgver=0.7.3
pkgrel=1
pkgdesc="Plugin based tool for steganography, with encrytion support."
arch=('i686' 'x86_64')
url="http://openstego.sourceforge.net"
license=('GPL2')
depends=('java-environment' 'java-runtime' 'x-server')
makedepends=('unzip')
source=(https://github.com/syvaidya/openstego/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.zip $pkgname.sh)
sha256sums=('78284dcabe5c74ab22916b872a7e897a67c64df7efe222e69ef5b62b53b18834'
            'ca7876d874eef214d238d1b43809c1eb2bb5b327d7b5188198ecfc29a036061e')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m644 lib/$pkgname.jar "$pkgdir"/usr/share/java/$pkgname/$pkgname.jar
  install -D -m644 README "$pkgdir"/usr/share/doc/$pkgname/README
  install -D -m755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
