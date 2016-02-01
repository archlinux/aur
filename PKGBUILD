# Maintainer: Matt Aitchison

pkgname=plex-sub-zero
pkgver=1.3.27.491
pkgrel=1
pkgdesc="Subtitles done right"
arch=('any')
url="https://github.com/pannal/Sub-Zero.bundle"
license=('custom')
depends=('python' 'plex-media-server')
source=(https://github.com/pannal/Sub-Zero.bundle/releases/download/$pkgver/Sub-Zero.bundle-$pkgver.zip)
md5sums=('276fd8089c071eeb3b3594a71e76b8d2')

package() {
  mkdir -p "$pkgdir/opt/plexmediaserver/Resources/Plug-ins"
  mkdir -p "$pkgdir/var/lib/plex/Plex Media Server/Plug-ins"
  
  install -D -m644 Sub-Zero.bundle/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  cp -r "Sub-Zero.bundle" "$pkgdir/opt/plexmediaserver/Resources/Plug-ins"
  ln -s "/opt/plexmediaserver/Resources/Plug-ins/Sub-Zero.bundle" "$pkgdir/var/lib/plex/Plex Media Server/Plug-ins"
  chmod a=,u=rwX,go=rX -R "$pkgdir"
}

