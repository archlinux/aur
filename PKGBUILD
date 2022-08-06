# Maintainer: zhuangzhuang <xufengyuan20080802@outlook.com>

pkgname=piscesde-cursor-themes-git
_pkgname=piscesde-cursor-themes
pkgver=0
pkgrel=2
pkgdesc="piscesDE cursor dark/light themes"
arch=('any')
url="https://github.com/piscesys/cursor-themes"
license=('GPL')
groups=('piscesde-git')
depends=()
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd cursor-themes
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


package() {
  cd cursor-themes
	install -d "$pkgdir/usr/share/icons"
	cp -r pisces-dark pisces-light "$pkgdir/usr/share/icons"
}
