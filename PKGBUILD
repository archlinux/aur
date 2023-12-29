# Maintainer: Antheas Kapenekakis <aur at antheas dot dev>
pkgname=hhd-user
pkgver=0.0.1
pkgrel=2
pkgdesc='Handheld Daemon User Service. Adds a user service file, and the appropriate rules so that hhd can run as a user daemon. Enable with `systemctl --user enable hhd-user` and reboot.'
arch=('x86_64')
url='https://github.com/antheas/hhd'
license=('MIT')
depends=()
provides=()
makedepends=( )
source=( "hhd-user.conf" "83-hhd-user.rules" "hhd-user.service" )
sha512sums=( 'SKIP' 'SKIP' 'SKIP' )

package() {
  # Install minimally necessary rules for running as a user service
	mkdir -p ${pkgdir}/usr/lib/modules-load.d/
  install -m644 hhd-user.conf ${pkgdir}/usr/lib/modules-load.d/hhd-user.conf
	mkdir -p ${pkgdir}/usr/lib/udev/rules.d/
  install -m644 83-hhd-user.rules ${pkgdir}/usr/lib/udev/rules.d/83-hhd-user.rules
	mkdir -p ${pkgdir}/usr/lib/systemd/user/
  install -m644 hhd-user.service ${pkgdir}/usr/lib/systemd/user/hhd-user.service
}