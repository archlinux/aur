# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Eric Mertens <emertens@gmail.com>
# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

gitname="biosdisk"
pkgname="${gitname}-git"
pkgver=1.01
pkgrel=1
arch=('any')
pkgdesc="Utility for creating Dell BIOS flash disks"
url="https://github.com/dell/${gitname}"
license=("GPL")
makedepends=('git')
depends=(cdrtools syslinux wget)
conflicts=("${gitname}")
provides=("${gitname}")
backup=("etc/biosdisk.conf")
options=('!strip')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${gitname}"
    git describe --tags | sed 's|-|\.|g'
}

package() {
    cd "${srcdir}/${gitname}"
    make DESTDIR="${pkgdir}" sbindir=/usr/bin install
}
