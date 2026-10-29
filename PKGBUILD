# Maintainer: Matthew Anderson <mpa.business@pm.me>
pkgname=jellyfin-openrc
pkgver=12.2
pkgrel=1
pkgdesc='OpenRC init script for Jellyfin'
arch=(any)
url='https://jellyfin.org'
license=(GPL-2.0)
depends=(
  openrc
  jellyfin-server
)
optdepends=(
  'jellyfin-server: web UI served by the server'
)
backup=(etc/conf.d/jellyfin)
source=(
  jellyfin.init.d
  jellyfin.conf.d
)
sha256sums=('5c8810ceaf2ed58c69ba094895c8d7708e4b4fe1eeded79a45029495aa05f7f3'
            'a89c51b4ca4ca9723f08c456da5c3474daed8fc6ace9ae9029d4a65a96a0dfc3')

package() {
  install -Dm755 jellyfin.init.d "$pkgdir/etc/init.d/jellyfin"
  install -Dm644 jellyfin.conf.d "$pkgdir/etc/conf.d/jellyfin"
}
