# Maintainer: Henri van de Munt <(firstname) @ gmail.com>
pkgname=gnome-shell-extension-material-shell-git
pkgver=0+76+gc1c4fe3
pkgrel=4
pkgdesc="GNOME Shell Extension Material Shell"
arch=('any')
url="https://github.com/PapyElGringo/material-shell"
license=('GPL')
depends=('gnome-shell')
makedepends=('git')
optdepends=('plata-theme: gtk and shell theme'
            'tela-icon-theme-git: icon theme'
            'ttf-roboto: font')
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
