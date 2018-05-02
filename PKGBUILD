# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=opennlp-bin
pkgver=1.8.4
pkgrel=1
pkgdesc='A machine learning-based toolkit for the processing of natural language text (bin)'
arch=(any)
url='http://opennlp.apache.org'
license=(Apache)
depends=(java-environment)
source=(http://www.apache.org/dist/opennlp/opennlp-$pkgver/apache-opennlp-$pkgver-bin.tar.gz{,.asc})
md5sums=(0279b3eb2da521eeedd4d2ed081d1a90
         SKIP)
sha1sums=(cdabd91c5e7bf94c940e7aaa2b658f4860aa4feb
          SKIP)
sha512sums=(f27547efb823cea6fee13f5b95184f4be87334095ff9843738c0f0712f589458e95f0bcf02ccc95975e9d0122f47a12755b834570441fdae1aa5b6b98b3ba05a
            SKIP)

package() {
  mkdir -p $pkgdir/usr/{bin,lib/opennlp,share/doc/opennlp}

  cd $srcdir/apache-opennlp-$pkgver
  cp -r lib/* $pkgdir/usr/lib/opennlp
  cp -r docs/* $pkgdir/usr/share/doc/opennlp
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/opennlp/LICENSE

  sed 's/$OPENNLP_HOME\/lib/$OPENNLP_HOME\/lib\/opennlp/' < bin/opennlp > $pkgdir/usr/bin/opennlp
  chmod +x $pkgdir/usr/bin/opennlp
}
