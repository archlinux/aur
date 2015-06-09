# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=bash-supergenpass
pkgname=$_pkgname-git
pkgver=0.r5.c84eaa2
pkgrel=1
pkgdesc="Bash shell-script implementation of SuperGenPass"
arch=('any')
url="https://github.com/lanzz/bash-supergenpass"
license=('custom')
depends=('bash' 'openssl')
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
  install -Dm755 supergenpass.sh "$pkgdir/usr/bin/supergenpass.sh"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
