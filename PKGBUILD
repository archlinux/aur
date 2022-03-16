# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Simon Hauser <Simon-Hauser@outlook.de>

pkgname=nextcloud-app-previewgenerator
pkgdesc='Nextcloud app that allows admins to pre-generate previews'
pkgver=4.0.0
pkgrel=1
arch=(any)
license=(AGPL)
url="https://github.com/nextcloud/${pkgname##*-}"
depends=('nextcloud>=21'
         'php>=7.3')
options=('!strip')
_archive="${pkgname##*-}-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('4ed05867dfa39761a130cfa9a35c4cb0d9ada20033f3a2eb4749267d19b46d0b')

package() {
	local appdir="$pkgdir/usr/share/webapps/nextcloud/apps"
	install -d "$appdir"
	cp -a "$_archive" "$appdir/${pkgname##*-}"
}
