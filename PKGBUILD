# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=catox
pkgname=$_pkgname-git
pkgver=0.r18.953679e
pkgrel=1
pkgdesc="A customizable, lightweight, minimalistic, text-based UI for single user chat that runs on top of ratox."
arch=('any')
url="https://github.com/Paraknight/catox"
license=('unknown')
depends=('nodejs' 'ratox-git')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  npm install --user root -g --prefix "$pkgdir/usr" catox
}

# vim:set ts=2 sw=2 et:
