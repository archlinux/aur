# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_pkgname=sddm-archlinux-theme
pkgname=$_pkgname-git
pkgver=0.1.r11.8898d77
pkgrel=1
pkgdesc="Archlinux Theme for SDDM"
arch=('any')
url="https://github.com/absturztaube/sddm-archlinux-theme"
license=('CCPL:cc-by-sa')
depends=('sddm')
makedepends=('git')
install="$_pkgname.install"
source=("git://github.com/absturztaube/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  local _ver=$(awk -F '=' '/Version/ {print $2}' archlinux/metadata.desktop)
  printf "$_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname/archlinux"

  install -d "$pkgdir/usr/share/sddm/themes/archlinux/"
  install -m644 * "$pkgdir/usr/share/sddm/themes/archlinux/"
}
