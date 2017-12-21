# Maintainer: Kyle McNally <kyle@kmcnally.net>
# Contributor: Matt Aitchison

pkgname=plex-sub-zero
pkgver=2.0.33.1871
pkgrel=1
pkgdesc="Subtitles done right"
arch=('any')
url="https://github.com/pannal/Sub-Zero.bundle"
license=('custom')
depends=('python' 'plex-media-server')
source=(https://github.com/pannal/Sub-Zero.bundle/releases/download/$pkgver-$pkgrel/Sub-Zero.bundle-$pkgver-$pkgrel.zip)
sha256sums=('a72259ba52b9dc73764c838b3372b9ace3964e4c1e43a424ab9f2b9bd01f6729')

package() {
  mkdir -p "$pkgdir/opt/plexmediaserver/Resources/Plug-ins"
  mkdir -p "$pkgdir/var/lib/plex/Plex Media Server/Plug-ins"

  install -D -m644 Sub-Zero.bundle/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -r "Sub-Zero.bundle" "$pkgdir/opt/plexmediaserver/Resources/Plug-ins"
  ln -s "/opt/plexmediaserver/Resources/Plug-ins/Sub-Zero.bundle" "$pkgdir/var/lib/plex/Plex Media Server/Plug-ins"
  chmod a=,u=rwX,go=rX -R "$pkgdir"
}
