# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=mattermost-plugin-calls
pkgver=0.13.0
pkgrel=1
pkgdesc='enables voice calling and screen sharing functionality in Mattermost channels'
arch=(x86_64)
url="https://github.com/${pkgname%%-*}/$pkgname"
license=(MIT)
# jq -r .min_server_version mattermost-plugin/plugin.json
depends=('mattermost>=7.6.0')
options=(!strip)
_plugin="com.mattermost.${pkgname##*-}"
_archive="$_plugin-$pkgver"
source=("$url/releases/download/v$pkgver/$_archive.tar.gz")
sha256sums=('66ae2f46e44affaeabcfae280ff1bffcc2d311da69f5ef21459de600a57211b4')

# Note the intention of this package is to bulid from source, but I haven't
# gotten it to work yet. Contributions welcome! Temporarily it is installing
# the upstream generated binary version.

package() {
	local _plugins="$pkgdir/var/lib/mattermost/plugins"
	install -dm0755 "$_plugins"
	cp -r "$_plugin" "$_plugins"
}

