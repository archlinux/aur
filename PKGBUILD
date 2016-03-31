# Maintainer: Lucas Severo <lucassalves65@gmail.com>

pkgname=holodev
pkgver=0.4
pkgrel=1
pkgdesc="A tool to facilitate the creation of Linux Containers for developing Debian systems"
arch=('i686' 'x86_64')
url="http://joenio.me/desenvolvendo-noosfero-usando-containers-lxc/"
license=('GPL')
depends=('libvirt' 'debootstrap' 'lxc' 'dnsmasq' 'ebtables' 'sudo' 'bash-completion')
source=("https://github.com/lappis-tools/holodev/archive/$pkgver.tar.gz")
sha256sums=('18aed78cdb39dbfdcec1ca10077b96139c3d0b70f1af7425e3598829cae70ede')
install="holodev.install"

package() {
	cd "${srcdir}/${pkgname}-$pkgver"
	install -Dm644 "${srcdir}/${pkgname}-$pkgver/debian/holodev.bash-completion" "$pkgdir/etc/bash_completion.d/holodev.bash-completion"
	install -Dm755 "${srcdir}/${pkgname}-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
