# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Simon Hauser <Simon-Hauser@outlook.de>

pkgname=nextcloud-app-previewgenerator
pkgdesc='Nextcloud app that allows admins to pre-generate previews'
pkgver=3.4.0
pkgrel=1
arch=(any)
license=(AGPL)
url="https://github.com/nextcloud/${pkgname##*-}"
depends=(nextcloud)
options=('!strip')
_archive="${pkgname##*-}-$pkgver"
source=("$_archive.tgz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b43a2c3332eeb13cfeb9e8a8a9dcd64d793d90870f518c0068c5d9268679a6e5')

package() {
	local appdir="$pkgdir/usr/share/webapps/nextcloud/apps"
	install -d "$appdir"
	cp -a "$_archive" "$appdir/${pkgname##*-}"
}
