# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=loki-render
pkgver=0.6.2b
_pkgver=${pkgver//\./}
epoch=1
pkgrel=1
pkgdesc="Distribute the rendering of Blender 3D images (frames) across several computers"
arch=('any')
url="http://loki-render.berlios.de"
license=('GPL')
depends=('blender' 'java-runtime>=6')
makedepends=()
source=("loki-render" "http://downloads.sourceforge.net/project/loki-render/loki-render/${pkgver}/lokiRender_${_pkgver}.zip")
md5sums=('973dfa476bb2e5f513730009af90deea'
         '66eb9db3352ee0309975ca06ac65fa7a')

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp loki-render "$pkgdir/usr/bin"

  cd "$srcdir/lokiRender"
  mkdir -p $pkgdir/usr/share/java/loki-render
  cp "lokiRender_${_pkgver}.jar" "$pkgdir/usr/share/java/loki-render/"
}

