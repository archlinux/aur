# Maintainer: Yamashita Ren <lemaitre dot lotus at gmail dot com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>

_pkgname=sddm-numix-theme
pkgname=$_pkgname-git
pkgver=0.1.r42.3db8e3a
pkgrel=1
pkgdesc="Numix Theme for SDDM"
arch=('any')
url="https://github.com/intialonso/intialonso.github.io.git"
license=('CCPL:cc-by-sa')
depends=('sddm')
makedepends=('git')
install="$_pkgname.install"
source=('git://github.com/intialonso/intialonso.github.io.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/intialonso"

  local _ver=$(awk -F '=' '/Version/ {print $2}' themes/sddm/numix/metadata.desktop)
  printf "$_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/intialonso/themes/sddm/numix"

  install -d "$pkgdir/usr/share/sddm/themes/numix/"
  install -m644 * "$pkgdir/usr/share/sddm/themes/numix/"
}
