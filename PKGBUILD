# Maintainer: Caleb Maclennan <caleb@alerque.com>

_plugin=gitlab
pkgname=mattermost-plugin-$_plugin
pkgver=1.4.0
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
sha256sums=('f097b1b978602e32fb6dc1ccd4c928b0fd9c7e7639dfddc17b36bcb945bc0c38')

# Note the intention of this package is to bulid from source, but I haven't
# gotten it to work yet. Contributions welcome! Temporarily it is installing
# the upstream generated binary version.

package() {
	ls -al
	local _plugins="$pkgdir/var/lib/mattermost/plugins"
	install -dm0755 "$_plugins"
	cp -r "$_archive" "$_plugins"
}
