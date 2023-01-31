# Maintainer: Caleb Maclennan <caleb@alerque.com>

_plugin=playbooks
pkgname=mattermost-plugin-$_plugin
pkgver=1.36.0
pkgrel=1
pkgdesc='reliable and repeatable processes using checklists, automation, and retrospectives'
arch=(x86_64)
url="https://github.com/${pkgname%%-*}/$pkgname"
license=(Apache2)
# jq -r .min_server_version mattermost-plugin/plugin.json
depends=('mattermost>=7.6.0')
options=(!strip)
_archive="$_plugin-$pkgver"
source=("$url/releases/download/v$pkgver/$_archive.tar.gz")
sha256sums=('9e520bb08d46cf88cf77ceba3230b7f18dd36f5808b1cc3f7ac918a4d1d1f6f7')

# Note the intention of this package is to bulid from source, but I haven't
# gotten it to work yet. Contributions welcome! Temporarily it is installing
# the upstream generated binary version.

package() {
	local _plugins="$pkgdir/var/lib/mattermost/plugins"
	install -dm0755 "$_plugins"
	cp -r "$_plugin" "$_plugins"
}
