pkgname=craftbukkit-plugin-worldguard
pkgver=6.0.0_beta_05
pkgrel=1
pkgdesc="plugin providing all the little things (and some big ones), and it protects your servers from various problems."
arch=(any)
url="http://dev.bukkit.org/bukkit-plugins/worldguard"
license=("GPLv3")
makedepends=(dos2unix)
depends=("craftbukkit>=1.8.1")
optdepends=(mariadb)
source=("http://dev.bukkit.org/media/files/856/297/worldguard-6.0.0-beta-05.zip")
md5sums=('2be54eaecd0558ebca84850100f26810')

package() {
  install -Dm644 worldguard-${pkgver//_/-}.jar "$pkgdir/srv/craftbukkit/plugins/worldguard.jar"
  cd contrib
  find . -name '*.sql' -exec install -Dm644 {} "$pkgdir/srv/craftbukkit/contrib/worldguard/"{} \;
}

# vim:set ts=2 sw=2 et:
