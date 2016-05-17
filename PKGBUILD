# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=gedit-trailsave
pkgver=3.3.0
pkgrel=1
pkgdesc="A plugin for gedit 3 to strip trailing whitespace on save"
arch=('any')
url="https://github.com/jonleighton/gedit-trailsave"
license=('GPL')
depends=('gedit')
source=($pkgname-$pkgver.tar.gz::https://github.com/jonleighton/gedit-trailsave/archive/v3.3.0.tar.gz)
sha256sums=('9a6be787dd1c623c342fa08c8da5c2791192140edc2efe18bd48f8ed320f89e2')

package() {
  cd "$pkgname-$pkgver"

  install -Dm644 -t "$pkgdir/usr/lib/gedit/plugins" \
    trailsave.{plugin,py}

  # Compile Python scripts
  python -m compileall "$pkgdir"
  python -O -m compileall "$pkgdir"
}

# vim:set ts=2 sw=2 et:
