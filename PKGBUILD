# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=apache-opennlp
pkgver=1.9.2
pkgrel=1
pkgdesc="A machine learning-based toolkit for the processing of natural language text"
arch=('any')
url="http://opennlp.apache.org/"
license=('Apache')
depends=('java-environment' 'bash')
source=("http://www.apache.org/dist//opennlp/opennlp-$pkgver/$pkgname-$pkgver-bin.tar.gz"{,.asc})
sha256sums=('26b55416a6c330e9c91bf9ad31183f3ed3104643b3d74ad2ee6e16b0c0e44f3b'
            'SKIP')
validpgpkeys=('6786BCFFBD2AE66E737FE97760E63AD841EF12D8')

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib/opennlp
  mkdir -p $pkgdir/usr/share/doc/opennlp

  cp -r $srcdir/$pkgname-$pkgver/lib/* $pkgdir/usr/lib/opennlp
  cp -r $srcdir/$pkgname-$pkgver/docs/* $pkgdir/usr/share/doc/opennlp

  sed 's/$OPENNLP_HOME\/lib/$OPENNLP_HOME\/lib\/opennlp/g' < $srcdir/$pkgname-$pkgver/bin/opennlp > $pkgdir/usr/bin/opennlp
  chmod +x $pkgdir/usr/bin/opennlp
}
