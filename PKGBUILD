# Maintainer: Vianney le Clément de Saint-Marcq <code@quartic.eu>
pkgname=herald
pkgver=0.1.1
pkgrel=1
pkgdesc="Simple systemd Journal-to-XMPP bridge"
arch=('i686' 'x86_64')
url="https://github.com/vianney/herald"
license=('GPL3')
depends=('systemd')
makedepends=('go')
backup=('etc/herald/config.toml')
source=("https://github.com/vianney/herald/archive/v${pkgver}.tar.gz")
md5sums=('8040bbf4055fa26624a4cbde49bcea82')
sha256sums=('034e476f1bce9aab8ecdb14f489407e0fc52a9e0edfd9535e417e820b3cc64d5')

build() {
	cd "${pkgname}-${pkgver}"
    make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
    install -Dm644 README.md "${pkgdir}/usr/share/doc/herald/README.md"
}
