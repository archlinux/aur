# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=opennlp-bin
pkgver=1.9.2
pkgrel=1
pkgdesc='Machine learning-based toolkit for processing natural language text (bin)'
arch=(any)
url=https://opennlp.apache.org
license=(Apache)
depends=(java-environment)
source=(https://www.apache.org/dist/opennlp/opennlp-$pkgver/apache-opennlp-$pkgver-bin.tar.gz{,.asc})
sha512sums=('d92a470e907e5844fec8ac42a05eab8be80d7dbb6d57028abafbe5c4b5d525366eb60e33e155724cb5aaf23ca93c07cc76eb2f382ce584fd33291d7d07a6236e'
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
