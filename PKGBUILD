pkgname=masalla-icon-theme
pkgver=0.8
pkgrel=1
pkgdesc="Latest flat design theme by Hayder Majid"
arch=('any')
url="https://github.com/hayderctee/masalla-icon-theme"
license=('GPL3')
depends=()
makedepends=('git')
optdepends=()
provides=('masalla-icon-theme-git')
conflicts=('masalla-icon-theme-git')
source=('git+https://github.com/hayderctee/masalla-icon-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/icons/Masalla

 # install theme
  cd $srcdir/$_pkgname/masalla-icon-theme
  cp -r . "$pkgdir"/usr/share/icons/Masalla
}

