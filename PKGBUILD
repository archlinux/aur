# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_pkgname=sddm-archlinux-theme
pkgname=$_pkgname-git
pkgver=0.1.r13.ge2054bd
pkgrel=1
pkgdesc="Archlinux Theme for SDDM"
arch=('any')
url="https://github.com/absturztaube/sddm-archlinux-theme"
license=('CCPL:cc-by-sa')
depends=('sddm')
makedepends=('git')
source=("git+https://github.com/absturztaube/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname

  local _ver=$(awk -F '=' '/Version/ {print $2}' archlinux/metadata.desktop)
  printf '%s.r%s.g%s' "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm644 $_pkgname/archlinux/* -t "$pkgdir/usr/share/sddm/themes/archlinux/"
}
