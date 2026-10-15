# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=munin-libvirt-plugins
pkgver=0.0.7
pkgrel=1
pkgdesc='Munin plugins to monitor virtual machines managed via libvirt'
arch=('any')
url='https://github.com/agx/munin-libvirt-plugins'
license=('GPL-2.0-only')
depends=('munin-node' 'libvirt-python' 'libxml2' 'python')
source=("git+https://github.com/agx/munin-libvirt-plugins.git#tag=debian/${pkgver}-1")
sha256sums=('SKIP')

build() {
	cd "${pkgname}"
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="${pkgdir}" SBINDIR=/usr/bin install

	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
