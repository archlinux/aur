pkgname=sky-gtk-theme
pkgver=1.0
pkgrel=1
pkgdesc="This is the Gtk part of Sky Theme"
arch=('i686' 'x86_64')
url="https://gitcafe.com/WaWei/sky-gtk-theme"
license=('GPL v3.0')
depends=('gtk-engine-murrine')
makedepends=('git')
source=("$pkgname"::'git+https://gitcafe.com/WaWei/sky-gtk-theme.git')

# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
}

package() {
  cd "$srcdir/$pkgname/Sky"
  install -d -m 755 "$pkgdir"/usr/share/themes/Sky
  rm -rf {.git,.gitignore,CONTRIBUTORS,COPYING,CREDITS,LICENSE,README.md}
  cp -r . "$pkgdir"/usr/share/themes/Sky
}
