# Maintainer: Danny Holman <dholman@gymli.org>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=apache-opennlp
pkgver=1.9.2
pkgrel=2
pkgdesc="A machine learning-based toolkit for the processing of natural language text"
arch=('any')
url="http://opennlp.apache.org/"
license=('Apache')
depends=('java-environment' 'bash')
source=("http://www.apache.org/dist//opennlp/opennlp-$pkgver/$pkgname-$pkgver-bin.tar.gz"{,.asc})
sha512sums=('d92a470e907e5844fec8ac42a05eab8be80d7dbb6d57028abafbe5c4b5d525366eb60e33e155724cb5aaf23ca93c07cc76eb2f382ce584fd33291d7d07a6236e'
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
