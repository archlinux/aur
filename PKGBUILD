# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: Brad Erhart <brae.04+aur@gmail.com>

pkgname=docker-machine-kvm
pkgver=0.10.1
pkgrel=1
pkgdesc="KVM driver for docker-machine"
url="https://github.com/tdilauro/docker-machine-kvm"
license=('Apache')
arch=('x86_64')
depends=(
  'docker-machine'
  'libvirt'
  'firewalld'
  'ebtables'
  'dnsmasq'
)
optdepends=(
  'docker: to manage the containers in the machine'
)
makedepends=()

source=("https://github.com/tdilauro/docker-machine-kvm/releases/download/v$pkgver/docker-machine-driver-kvm-ubuntu16.04")
sha256sums=('97f215ac0b466cc410ddd370263ad5ccb85e3b5cb199db04bce30e539b218dca')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 docker-machine-driver-kvm-ubuntu16.04 "$pkgdir/usr/bin/docker-machine-driver-kvm"
}
