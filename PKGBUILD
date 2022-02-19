# Maintainer: Caleb Maclennan <caleb@alerque.com>

_plugin=matterpoll
pkgname=mattermost-plugin-$_plugin
pkgver=1.4.0
pkgrel=1
pkgdesc='Create polls and surveys directly within Mattermost'
arch=(x86_64)
url="https://github.com/$_plugin/$_plugin"
license=()
depends=(mattermost)
options=(!strip)
_archive="com.github.matterpoll.$_plugin"
source=("$url/releases/download/v$pkgver/$_archive-$pkgver.tar.gz")
sha256sums=('4400eb77a859b290a00c611955eb4709d6e2e50cd6b8b451d223d8015aa9902f')

# Note the intention of this package is to bulid from source, but I haven't
# gotten it to work yet. Contributions welcome! Temporarily it is installing
# the upstream generated binary version.

package() {
	local _plugins="$pkgdir/var/lib/mattermost/plugins"
	install -dm0755 "$_plugins"
	cp -r "$_archive" "$_plugins"
}
