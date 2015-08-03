# Maintainer: Thermi <noel [at] familie-kuntze dot com>

pkgname=fence-virt-git
pkgver=0.4
pkgrel=1
pkgdesc="fencing daemon for a virtualised environment"
url='https://github.com/ClusterLabs/fence-virt'
license=("GPLv2")
arch=('i686' 'x86_64')
depends=()
#makedepends=('corosync' 'pacemaker')
conflicts=()

source=("git://github.com/ClusterLabs/fence-virt.git")
md5sums=('SKIP')

build() {
  cd ${srcdir}/fence-virt/
  ./autogen.sh
  ./configure --prefix=/ --sbindir=/usr/bin --libdir=/usr/lib --datarootdir=/usr/share --disable-libvirt-qmf-plugin 
  make
}

package() {
  cd "${srcdir}/fence-virt"
  make DESTDIR=${pkgdir} install
}
