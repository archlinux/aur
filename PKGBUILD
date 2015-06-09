# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=lossywav
pkgname=$_pkgname-git
pkgver=1.4.0p.r0.g0c8343e
pkgrel=1
pkgdesc="An attempt to port lossyWAV to POSIX."
arch=('i686' 'x86_64')
url="https://github.com/MoSal/lossywav-for-posix"
license=('GPL')
depends=('gcc-libs')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/MoSal/lossywav-for-posix.git")
md5sums=('SKIP')

pkgver() {
 cd "$_pkgname"
 git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
 cd "$_pkgname"
 make
}

package() {
 cd "$_pkgname"
 install -Dm755 lossywav "$pkgdir/usr/bin/lossywav"
}

# vim:set ts=2 sw=2 et:
