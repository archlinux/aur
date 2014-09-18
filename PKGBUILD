# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_pkgname=sddm-archlinux-theme
pkgname=$_pkgname-git
pkgver=r11.8898d77
pkgrel=2
pkgdesc="Archlinux Theme for SDDM"
license=('GPL')
arch=('i686' 'x86_64')
url="https://github.com/absturztaube/sddm-archlinux-theme"
makedepends=('git')
depends=('sddm')
install="$_pkgname.install"
source=("git://github.com/absturztaube/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  printf "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname/archlinux"

  install -d "$pkgdir/usr/share/sddm/themes/archlinux/"
  install -m644 * "$pkgdir/usr/share/sddm/themes/archlinux/"
}
