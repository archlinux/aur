# Maintainer: Caleb Maclennan <caleb@alerque.com>

_plugin=focalboard
pkgname=mattermost-plugin-$_plugin
pkgver=7.2.0
pkgrel=1
pkgdesc='an open source, self-hosted alternative to Trello, Notion, and Asana'
arch=(x86_64)
url=https://www.focalboard.com
_url="https://github.com/${pkgname%%-*}/${pkgname##*-}"
license=()
depends=('mattermost>=7')
options=(!strip)
_archive="$pkgname-$pkgver"
source=("$_archive.tgz::$_url/releases/download/v$pkgver/$pkgname.tar.gz")
sha256sums=('aea6167d6c9545a3d0dbe1dba7440251a82abf400fde4160bc70129aea35bd12')

# Note the intention of this package is to bulid from source, but I haven't
# gotten it to work yet. Contributions welcome! Temporarily it is installing
# the upstream generated binary version.

package() {
	local _plugins="$pkgdir/var/lib/mattermost/plugins"
	install -dm0755 "$_plugins"
	cp -r "$_plugin" "$_plugins"
}
