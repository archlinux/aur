# Maintainer: Caleb Maclennan <caleb@alerque.com>

_plugin=jitsi
pkgname=mattermost-plugin-$_plugin
pkgver=2.0.0
pkgrel=1
pkgdesc='Jitsi plugin for Mattermost'
arch=(x86_64)
url="https://github.com/mattermost/$pkgname"
license=()
depends=(mattermost)
options=(!strip)
source=("$pkgname-$pkgver.tgz::$url/releases/download/v$pkgver/$_plugin-$pkgver.tar.gz")
sha256sums=('97fdf292f5d0776aaf6de76d1d50ce8b343f65035f489a7c0fd074e3d065466f')

# Note the intention of this package is to bulid from source, but I haven't
# gotten it to work yet. Contributions welcome! Temporarily it is installing
# the upstream generated binary version.

package() {
	local _plugins="$pkgdir/var/lib/mattermost/plugins"
	install -dm0755 "$_plugins"
	cp -r "$_plugin" "$_plugins"
}
