# maintainer: Ricardo Band <email@ricardo.band>

pkgname=cephadm
pkgver=16.2.6
pkgrel=1
pkgdesc='Cephadm deploys and manages a Ceph cluster by connection to hosts from the manager daemon via SSH to add, remove, or update Ceph daemon containers'
arch=('any')
url="https://ceph.com/"
license=('GPL2' 'LGPL2.1' 'LGPL3')
depends=('lvm2' 'python>=3')
optdepends=('podman: container backend'
            'docker: container backend'
            'chrony: time sync service'
            'ntp: time sync service')
provides=('cephadm')
conflicts=('cephadm-git')
source=("cephadm-$pkgver::https://github.com/ceph/ceph/raw/v$pkgver/src/cephadm/cephadm")
sha256sums=('927a6fed39f10a3a9c1f5c6514183352f8d18948649e98ce61bf503f9c08a01c')

package() {
    cd $srcdir
    install -Dm0755 cephadm-$pkgver $pkgdir/usr/bin/cephadm
}

