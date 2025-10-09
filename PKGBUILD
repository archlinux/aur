# Maintainer: Karim Vergnes <me@thesola.io>

pkgname="intel-ipu7-camera-bin"
_pkgname=ipu7-camera-bins
pkgver=r31.09ccd02
pkgrel=1
pkgdesc="Intel IPU7 camera binaries"
arch=('x86_64')
url="https://github.com/intel/$_pkgname"
license=('unknown')
depends=('intel-ipu7-dkms-git' 'glibc')
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
