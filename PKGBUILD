# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=opennlp-bin
pkgver=1.9.0
pkgrel=1
pkgdesc='Machine learning-based toolkit for processing natural language text (bin)'
arch=(any)
url=https://opennlp.apache.org
license=(Apache)
depends=(java-environment)
source=(https://www.apache.org/dist/opennlp/opennlp-$pkgver/apache-opennlp-$pkgver-bin.tar.gz{,.asc})
sha1sums=(80712378e53463fa82aa409317b3257ee16518e9
          SKIP)
sha512sums=(1bbf089ceb0ca8c0f4451aa6ff3ec5762b9ceb0f13ace7bf2605fa01d0c8a0ec718b4ca54e5c477b64bcc30f9409b0f4637c05120ab395b134052a0837b53bc4
            SKIP)

package() {
  install -d $pkgdir/usr/{lib/opennlp,bin,share/doc/opennlp}
  cd apache-opennlp-$pkgver
  cp -r lib/* $pkgdir/usr/lib/opennlp
  sed s#$OPENNLP_HOME/lib#$OPENNLP_HOME/lib/opennlp# < bin/opennlp > $pkgdir/usr/bin/opennlp
  chmod +x $pkgdir/usr/bin/opennlp
  cp -r docs/* $pkgdir/usr/share/doc/opennlp
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/opennlp/LICENSE
}
