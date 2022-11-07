# Maintainer: Caleb Maclennan <caleb@alerque.com>

_plugin=jitsi
pkgname=mattermost-plugin-$_plugin
pkgver=2.0.1
pkgrel=1
pkgdesc='Jitsi plugin for Mattermost'
arch=(x86_64)
url="https://github.com/mattermost/$pkgname"
license=()
depends=(mattermost)
options=(!strip)
source=("$pkgname-$pkgver.tgz::$url/releases/download/v$pkgver/$_plugin-$pkgver.tar.gz")
sha256sums=('895996f5974d9f3ab4f1cf76f537f5fb19c0edc1d6bae8db9fc042a5fe99cdea')

# Note the intention of this package is to bulid from source, but I haven't
# gotten it to work yet. Contributions welcome! Temporarily it is installing
# the upstream generated binary version.

package() {
	local _plugins="$pkgdir/var/lib/mattermost/plugins"
	install -dm0755 "$_plugins"
	cp -r "$_plugin" "$_plugins"
}
