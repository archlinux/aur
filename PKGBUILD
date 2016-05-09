# Maintainer: Lucas Severo <lucassalves65@gmail.com>

pkgname=holodev
pkgver=0.8
pkgrel=2
pkgdesc="A tool to facilitate the creation of Linux Containers for developing Debian systems"
arch=('i686' 'x86_64')
url="http://joenio.me/desenvolvendo-noosfero-usando-containers-lxc/"
license=('GPL')
depends=('dmidecode' 'bridge-utils' 'libvirt' 'debootstrap' 'lxc' 'dnsmasq' 'ebtables' 'sudo' 'bash-completion')
conflicts=('holodev-git')
source=("https://github.com/lappis-tools/holodev/archive/$pkgver.tar.gz")
sha256sums=('5b93e823512b8e3d71f1618efb363bf3c8591f0bea9d07b465e39eb6ca678103')
install="holodev.install"

package() {
	cd "${srcdir}/${pkgname}-$pkgver"
	install -Dm644 "${srcdir}/${pkgname}-$pkgver/debian/holodev.bash-completion" "$pkgdir/etc/bash_completion.d/holodev.bash-completion"
	install -Dm755 "${srcdir}/${pkgname}-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
