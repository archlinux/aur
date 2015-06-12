pkgname=captiva-icons-git
_pkgname=captiva-icon-theme
pkgver=30.409b039
pkgrel=1
pkgdesc="Captiva Icon Theme by Francisco Villarroel."
arch=('any')
url="https://github.com/captiva-project/captiva-icon-theme"
license=('GPL3')
depends=()
makedepends=('git')
optdepends=()
provides=('captiva-icons-git')
conflicts=('captiva-icons-git')
source=('git+https://github.com/captiva-project/captiva-icon-theme.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {

  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/icons/Captiva

  # install theme
  cd $srcdir/captiva-icon-theme/Captiva
  cp -r . "$pkgdir"/usr/share/icons/Captiva/
}
