# Maintainer: slact
#author: Daniel Christophis
pkgname=tlpui-git
pkgver=0.r84.ca97f57
pkgrel=1
epoch=
pkgdesc="A GTK-UI to change TLP configuration files easily. It has the aim to protect users from setting bad configuration and to deliver a basic overview of all the valid configuration values."
arch=('any')
url="https://github.com/d4nj1/TLPUI"
license=('GPLv2')
groups=()
depends=(tlp python pygtk)
makedepends=()
provides=()
conflicts=()
install=
source=(git+https://github.com/d4nj1/TLPUI.git
	tlpui.sh
        tlpui.desktop)
md5sums=('SKIP'
         '9f23dcf973bac1089280be1255dfe34d'
         'ac5c088895666e9cdf095023acea5163')

pkgver() {
  cd "TLPUI"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/TLPUI"
  mkdir -p "$pkgdir"/opt/tlpui
  cp -dpr --no-preserve=ownership ./ "$pkgdir"/opt/tlpui/

  install -Dm644 "$srcdir"/tlpui.desktop "$pkgdir"/usr/share/applications/tlpui.desktop
  install -Dm755 "$srcdir"/tlpui.sh "$pkgdir"/usr/bin/tlpui
}

# vim:set ts=2 sw=2 et:
