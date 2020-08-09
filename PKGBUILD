# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=opennlp-bin
pkgver=1.9.3
pkgrel=1
pkgdesc='Machine learning-based toolkit for processing natural language text (bin)'
arch=(any)
url=https://opennlp.apache.org
license=(Apache)
depends=(java-environment)
source=(https://www.apache.org/dist/opennlp/opennlp-$pkgver/apache-opennlp-$pkgver-bin.tar.gz{,.asc})
sha512sums=('f93ac87ef2a050d77495f4e4bb92854f8429af8f0a14650db9c269378857849d251d927a22854b8a533332d69427be8519a0560116c2e3da8f433510326ac135'
            'SKIP')
validpgpkeys=('6786BCFFBD2AE66E737FE97760E63AD841EF12D8')

package() {
  install -d $pkgdir/usr/{lib/opennlp,bin,share/doc/opennlp}
  cd apache-opennlp-$pkgver
  cp -r lib/* $pkgdir/usr/lib/opennlp
  sed s#$OPENNLP_HOME/lib#$OPENNLP_HOME/lib/opennlp# < bin/opennlp > $pkgdir/usr/bin/opennlp
  chmod +x $pkgdir/usr/bin/opennlp
  cp -r docs/* $pkgdir/usr/share/doc/opennlp
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/opennlp/LICENSE
}
