# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=awk-raycaster
pkgname=$_pkgname-git
pkgver=0.r16.016a1d4
pkgrel=1
pkgdesc="Pseudo-3D shooter written completely in awk using raycasting technique "
arch=('any')
url="https://github.com/TheMozg/awk-raycaster"
license=('GPL')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git"
        "launch.sh")
md5sums=('SKIP'
         '5e13fab2a863f67a7fc36762bf823f82')

pkgver() {
  cd "$_pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 launch.sh "$pkgdir/usr/bin/awkaster"
  install -Dm644 "$_pkgname/awkaster.awk" "$pkgdir/usr/share/$pkgname/awkaster.awk"
}

# vim:set ts=2 sw=2 et:
