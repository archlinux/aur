# Maintainer: Caleb Maclennan <caleb@alerque.com>

_plugin=focalboard
pkgname=mattermost-plugin-$_plugin
pkgver=7.4.1
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
sha256sums=('6086f72a0ef5c34d819d7b79fc564057aecadad0d7d135b7bb3db5b84fdeb84d')

# Note the intention of this package is to bulid from source, but I haven't
# gotten it to work yet. Contributions welcome! Temporarily it is installing
# the upstream generated binary version.

package() {
	local _plugins="$pkgdir/var/lib/mattermost/plugins"
	install -dm0755 "$_plugins"
	cp -r "$_plugin" "$_plugins"
}
