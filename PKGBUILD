# Maintainer: Danny Holman <dholman@gymli.org>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=apache-opennlp
pkgver=2.0.0
pkgrel=1
pkgdesc="A machine learning-based toolkit for the processing of natural language text"
arch=('any')
url="http://opennlp.apache.org/"
license=('Apache')
depends=('java-environment' 'bash')
source=("https://downloads.apache.org/opennlp/opennlp-2.0.0/apache-opennlp-2.0.0-bin.tar.gz")
sha512sums=('abf3207a7ed4e3b2b4bc947951112dd4464d84d4abbe639bfcba8ab6d6350c8f0719705824fc93b343abbf9d3ba643467a70569d6ba4fbc778fd395d216da3f1')

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib/opennlp
  mkdir -p $pkgdir/usr/share/doc/opennlp

  cp -r $srcdir/$pkgname-$pkgver/lib/* $pkgdir/usr/lib/opennlp
  cp -r $srcdir/$pkgname-$pkgver/docs/* $pkgdir/usr/share/doc/opennlp

  sed 's/$OPENNLP_HOME\/lib/$OPENNLP_HOME\/lib\/opennlp/g' < $srcdir/$pkgname-$pkgver/bin/opennlp > $pkgdir/usr/bin/opennlp
  chmod +x $pkgdir/usr/bin/opennlp
}
