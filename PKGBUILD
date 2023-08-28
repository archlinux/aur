# Maintainer: Karim Vergnes <me@thesola.io>

pkgbase=ipu6-camera-bin
pkgname="intel-ipu6-camera-bin"
provides=(intel-ipu6ep-camera-bin)
replaces=(intel-ipu6ep-camera-bin)
_pkgname=ipu6-camera-bins
pkgver=r70.c4f9e52
pkgrel=1
pkgdesc="Intel IPU6 camera binaries"
arch=('x86_64')
url="https://github.com/intel/$_pkgname"
license=('unknown')
depends=('intel-ipu6-dkms-git' 'glibc')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')


pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -dm755 "$pkgdir/usr"
    cp -rT "$_pkgname/lib" "$pkgdir/usr/lib"
    cp -rT "$_pkgname/include" "$pkgdir/usr/include"
}
