# Maintainer: Caleb Maclennan <caleb@alerque.com>

_plugin=focalboard
pkgname=mattermost-plugin-$_plugin
pkgver=7.4.4
pkgrel=1
pkgdesc='an open source, self-hosted alternative to Trello, Notion, and Asana'
arch=(x86_64)
url=https://www.focalboard.com
_url="https://github.com/${pkgname%%-*}/${pkgname##*-}"
license=()
depends=('mattermost>=7.2.0')
options=(!strip)
_archive="$pkgname-$pkgver"
source=("$_archive.tgz::$_url/releases/download/v$pkgver/$pkgname.tar.gz")
sha256sums=('e7e899c2042532d7f719dfedc764491bd10e9b4ba2e320bb3ab19a79a197a4e8')

# Note the intention of this package is to bulid from source, but I haven't
# gotten it to work yet. Contributions welcome! Temporarily it is installing
# the upstream generated binary version.

package() {
	local _plugins="$pkgdir/var/lib/mattermost/plugins"
	install -dm0755 "$_plugins"
	cp -r "$_plugin" "$_plugins"
}
