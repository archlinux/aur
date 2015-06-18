# Maintainer: Sébastien Luttringer <seblu.seblu.net>

pkgname=lkvm-git
pkgver=20130921
pkgrel=1
pkgdesc='Native Linux KVM tool'
arch=('i686' 'x86_64')
license=('GPL2')
url='https://github.com/penberg/linux-kvm'
depends=('glibc' 'zlib' 'libaio' 'libvncserver' 'sdl' 'git')
provides=('kvm')
options=('!buildflags')
source=('git+git://github.com/penberg/linux-kvm.git')
md5sums=('SKIP')

build() {
  cd linux-kvm/tools/kvm
  make
}

package() {
  cd linux-kvm/tools/kvm
  install -D -m 755 lkvm "$pkgdir/usr/bin/lkvm"
  install -D -m 755 vm "$pkgdir/usr/bin/vm"
}

# vim:set ts=2 sw=2 ft=sh et:
