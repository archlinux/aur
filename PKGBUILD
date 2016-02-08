# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=aurebuildcheck
pkgname=$_pkgname-git
pkgver=2.5.r30.gdbcfaa7
pkgrel=1
pkgdesc="Shell script which checks for aur (local) packages which need rebuild according to findbrokenpkgs"
arch=('any')
url="https://github.com/matthiaskrgr/aurebuildcheck"
license=('GPL')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgname"
  install -Dm755 $_pkgname.sh "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=2 sw=2 et:
