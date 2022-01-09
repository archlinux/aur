# Maintainer: Danny Holman <dholman@gymli.org>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=apache-opennlp
pkgver=1.9.4
pkgrel=1
pkgdesc="A machine learning-based toolkit for the processing of natural language text"
arch=('any')
url="http://opennlp.apache.org/"
license=('Apache')
depends=('java-environment' 'bash')
source=("https://downloads.apache.org/opennlp/opennlp-1.9.4/apache-opennlp-1.9.4-bin.tar.gz")
sha512sums=('cba717ef6327adfd37b729fc8e811af9a6b18d8b71ef8b6b1854c1ebc90dec59f93ee34cd7571edf9b29035b7bcf66c358b817e35b2b4cb17aafea788f08cf88')

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib/opennlp
  mkdir -p $pkgdir/usr/share/doc/opennlp

  cp -r $srcdir/$pkgname-$pkgver/lib/* $pkgdir/usr/lib/opennlp
  cp -r $srcdir/$pkgname-$pkgver/docs/* $pkgdir/usr/share/doc/opennlp

  sed 's/$OPENNLP_HOME\/lib/$OPENNLP_HOME\/lib\/opennlp/g' < $srcdir/$pkgname-$pkgver/bin/opennlp > $pkgdir/usr/bin/opennlp
  chmod +x $pkgdir/usr/bin/opennlp
}
