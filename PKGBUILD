# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=afx2tool-linux
pkgname=$_pkgname-git
pkgver=0.r25.f74c4fe
pkgrel=1
pkgdesc="Linux CLI tool to backup and restore Axe-FX II data"
arch=('any')
url="https://github.com/TieDyedDevil/afx2tool-linux"
license=('MIT')
depends=('alsa-utils' 'afx2usb-linux')
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
  install -Dm755 afx2-tool "$pkgdir/usr/bin/afx2-tool"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
