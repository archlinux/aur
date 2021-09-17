# Maintainer: Matthew Warren <`base64 -d`(bXcK)@matthewwarren.dev>
# Contributer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=loki-render
pkgver=0.7.2
_pkgver=${pkgver//\./}
epoch=1
pkgrel=2
pkgdesc="Distribute the rendering of Blender 3D images (frames) across several computers"
arch=('any')
url="http://loki-render.berlios.de"
license=('GPL')
depends=('blender' 'java-runtime>=6')
makedepends=()
source=("loki-render" "http://downloads.sourceforge.net/project/loki-render/loki-render/${pkgver}/LokiRender-${_pkgver}.jar")
noextract=("LokiRender-${_pkgver}.jar")
md5sums=('ddf917b76e908190c50934dd01cbce69'
         '56e486e8881b493c96c890556bbdf795')

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp loki-render "$pkgdir/usr/bin"

  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/java/loki-render
  cp "LokiRender-${_pkgver}.jar" "$pkgdir/usr/share/java/loki-render/"
}
