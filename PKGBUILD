# Maintainer: Vianney le Clément de Saint-Marcq <code@quartic.eu>
pkgname=herald
pkgver=0.1
pkgrel=1
pkgdesc="Simple systemd Journal-to-XMPP bridge"
arch=('i686' 'x86_64')
url="https://github.com/vianney/herald"
license=('GPL3')
depends=('systemd')
makedepends=('go')
backup=('etc/herald/config.toml')
source=("https://github.com/vianney/herald/archive/v${pkgver}.tar.gz")
md5sums=('e2130a22bc8d6155f2353e2aa803fb86')
sha256sums=('947fb8efa0d32eeffce114d336642b733fcd2f2598efdd8ac64d1aa9bb895d1b')

build() {
	cd "${pkgname}-${pkgver}"
    make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
    install -Dm644 README.md "${pkgdir}/usr/share/doc/herald/README.md"
}
