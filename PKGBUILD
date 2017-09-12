# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: Brad Erhart <brae.04+aur@gmail.com>
# Contributor: Andreas Gerlach <andigerlach76@gmail.com>

pkgname=docker-machine-kvm
pkgver=0.10.0
pkgrel=1
pkgdesc="KVM driver for docker-machine"
url="https://github.com/dhiltgen/docker-machine-kvm"
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

source=("https://github.com/dhiltgen/docker-machine-kvm/releases/download/v$pkgver/docker-machine-driver-kvm-ubuntu16.04")
sha256sums=('d5cd0a1241a157aa68fbb175c4de802a953affe0dcf3e9b93e434acd91277e34')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 docker-machine-driver-kvm-ubuntu16.04 "$pkgdir/usr/bin/docker-machine-driver-kvm"
}
