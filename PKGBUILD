# Maintainer: Caleb Maclennan <caleb@alerque.com>

_plugin=gitlab
pkgname=mattermost-plugin-$_plugin
pkgver=1.5.0
pkgrel=1
pkgdesc='a GitLab plugin for Mattermost'
arch=(x86_64)
url=https://mattermost.gitbook.io/plugin-gitlab
_url="https://github.com/mattermost/$pkgname"
license=()
depends=(mattermost)
options=(!strip)
_archive="com.github.manland.$pkgname"
source=("$_url/releases/download/v$pkgver/$_archive-$pkgver.tar.gz")
sha256sums=('4eb6596dcf61ee5c4dae4f8bbf977e1040fb796a61898e9f67296d0bfdfdc3d8')

# Note the intention of this package is to bulid from source, but I haven't
# gotten it to work yet. Contributions welcome! Temporarily it is installing
# the upstream generated binary version.

package() {
	local _plugins="$pkgdir/var/lib/mattermost/plugins"
	install -dm0755 "$_plugins"
	cp -r "$_archive" "$_plugins"
}
