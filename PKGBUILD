# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=drmdecrypt
pkgname=$_pkgname-git
pkgver=1.0.r13.ge7f479f
pkgrel=1
pkgdesc="DRM decrypting tool for Samsung TVs"
arch=('i686' 'x86_64')
url="https://github.com/decke/drmdecrypt"
license=('GPL2')
depends=('glibc')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=2 sw=2 et:
