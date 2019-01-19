# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>

pkgname=slim-theme-arch-solarized-git
_pkgname=slim-theme-arch-solarized
pkgver=r1.42a9589
pkgrel=1
pkgdesc="Solarized Spiral theme for SLiM using the Arch Linux logo"
arch=('any')
url="https://github.com/kylesferrazza/slim-theme-arch-solarized"
license=('GPL')
depends=('slim')
source=("$_pkgname::git+https://github.com/kylesferrazza/slim-theme-arch-solarized.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/share/slim/themes/arch-solarized"
    cp panel.png background.png slim.theme "$pkgdir/usr/share/slim/themes/arch-solarized/"
}
