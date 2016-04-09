# Maintainer: Lucas Severo <lucassalves65@gmail.com>

pkgname=holodev
pkgver=0.5
pkgrel=2
pkgdesc="A tool to facilitate the creation of Linux Containers for developing Debian systems"
arch=('i686' 'x86_64')
url="http://joenio.me/desenvolvendo-noosfero-usando-containers-lxc/"
license=('GPL')
depends=('dmidecode' 'bridge-utils' 'libvirt' 'debootstrap' 'lxc' 'dnsmasq' 'ebtables' 'sudo' 'bash-completion')
conflicts=('holodev')
source=("https://github.com/lappis-tools/holodev/archive/$pkgver.tar.gz")
sha256sums=('4357fd42465df5ddc4cec141da57ebae15b364628de85e2bcd02b1b54856dfdd')
install="holodev.install"

package() {
	cd "${srcdir}/${pkgname}-$pkgver"
	install -Dm644 "${srcdir}/${pkgname}-$pkgver/debian/holodev.bash-completion" "$pkgdir/etc/bash_completion.d/holodev.bash-completion"
	install -Dm755 "${srcdir}/${pkgname}-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
