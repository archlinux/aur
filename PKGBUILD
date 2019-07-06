# Maintainer: Henri van de Munt <(firstname) @ gmail.com>
pkgname=gnome-shell-extension-material-shell-git
pkgver=0+53+g96e68b8
pkgrel=2
pkgdesc="GNOME Shell Extension Material Shell"
arch=('any')
url="https://github.com/PapyElGringo/material-shell"
license=('GPL')
depends=('gnome-shell')
makedepends=('git')
groups=('gnome-shell-extensions')
source=('git+https://github.com/PapyElGringo/material-shell.git')
md5sums=('SKIP')

prepare() {
 cd material-shell
 printf '0+%s+g%s' $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package() {
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/material-shell@papyelgringo/"
  cp -r material-shell/. "$pkgdir/usr/share/gnome-shell/extensions/material-shell@papyelgringo/"
}
