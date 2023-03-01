# Maintainer: Danny Holman <dholman@gymli.org>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=apache-opennlp
pkgver=2.1.1
pkgrel=1
pkgdesc="A machine learning-based toolkit for the processing of natural language text"
arch=('any')
url="http://opennlp.apache.org/"
license=('Apache')
depends=('java-environment' 'bash')
source=("https://downloads.apache.org/opennlp/opennlp-2.1.1/apache-opennlp-2.1.1-bin.tar.gz")
sha512sums=('72a75fba9498750ee7cc269c725c86fa632dc1ea9a47c8047506da8b2522cee9913ed0bfe42676e2b497a84b60a33ae533e04aec54640a044092f6d3b0e243e5')

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib/opennlp
  mkdir -p $pkgdir/usr/share/doc/opennlp

  cp -r $srcdir/$pkgname-$pkgver/lib/* $pkgdir/usr/lib/opennlp
  cp -r $srcdir/$pkgname-$pkgver/docs/* $pkgdir/usr/share/doc/opennlp

  sed 's/$OPENNLP_HOME\/lib/$OPENNLP_HOME\/lib\/opennlp/g' < $srcdir/$pkgname-$pkgver/bin/opennlp > $pkgdir/usr/bin/opennlp
  chmod +x $pkgdir/usr/bin/opennlp
}
