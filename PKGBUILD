# maintainer: Ricardo Band <email@ricardo.band>

pkgname=cephadm
pkgver=16.2.7
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
sha256sums=('236e76cdb89429f3cf1d47abb5ac6d9d68a93cc10502b7181d02e4b768848c65')

package() {
    cd $srcdir
    install -Dm0755 cephadm-$pkgver $pkgdir/usr/bin/cephadm
}

