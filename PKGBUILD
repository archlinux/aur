# Maintainer: Quentin Retornaz <quentin dot retornaz at yahoo dot fr>
# Contributor: nochecksum <nochecksum at users dot noreply dot github dot com>
pkgname=gogs-openrc
pkgver=20170925
pkgrel=1
pkgdesc="Gogs init scripts for OpenRC"
arch=('any')
url="https://aur.archlinux.org/packages/gogs-openrc/"
license=('APACHE')
groups=()
depends=('gogs' 'openrc')
source=('gogs.initd'
	'gogs.confd'
	'gogs.install')
sha1sums=('fc30a49867a63222e7b5c77bf2c32c2f54abd203'
          '7b0239401a73d13743c7fe607d62c77f21109b7b'
          '44b07c2af73a9641b6e9f217c7d8b7caa5a0e5dd')

package() {
	install -Dm755 ${srcdir}/gogs.confd "$pkgdir"/etc/conf.d/gogs
	install -Dm755 ${srcdir}/gogs.initd "$pkgdir"/etc/init.d/gogs
	install=gogs.install
}
