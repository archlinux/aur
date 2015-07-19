pkgname=stark-gtk-git
_pkgname=stark-gtk-theme
pkgver=25.da14df3
pkgrel=1
pkgdesc="Stark is a modern GTK3 theme for Linux."
arch=('any')
url="https://github.com/moka-project/stark-gtk-theme"
license=('GPL3')
depends=(gtk-engine-murrine)
makedepends=('git')
optdepends=()
provides=('stark-gtk-git')
conflicts=('stark-gtk-git')
source=('git+https://github.com/semplice/stark-gtk-theme.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {

  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/themes/Stark-Ceru
  install -d -m 755 "$pkgdir"/usr/share/themes/Stark-Lutu
  install -d -m 755 "$pkgdir"/usr/share/themes/Stark-Roja 
  install -d -m 755 "$pkgdir"/usr/share/themes/Stark-Verd
  install -d -m 755 "$pkgdir"/usr/share/themes/Stark-Viol

  # install theme
  cd $srcdir/stark-gtk-theme/Stark-Ceru
  cp -r . "$pkgdir"/usr/share/themes/Stark-Ceru/
  cd $srcdir/stark-gtk-theme/Stark-Lutu
  cp -r . "$pkgdir"/usr/share/themes/Stark-Lutu/
  cd $srcdir/stark-gtk-theme/Stark-Roja
  cp -r . "$pkgdir"/usr/share/themes/Stark-Roja/
  cd $srcdir/stark-gtk-theme/Stark-Verd
  cp -r . "$pkgdir"/usr/share/themes/Stark-Verd/
  cd $srcdir/stark-gtk-theme/Stark-Viol
  cp -r . "$pkgdir"/usr/share/themes/Stark-Viol/
}
