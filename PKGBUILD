# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor : Yamada Hayao <hayao@fascode.net>

pkgname=gnome-shell-extension-coverflow-alt-tab
_extname="CoverflowAltTab@palatis.blogspot.com"
pkgver=83
pkgrel=1
pkgdesc="Replacement of Alt-Tab, iterates through windows in a cover-flow manner"
arch=('any')
url="https://github.com/dsheeler/CoverflowAltTab"
license=('GPL')
source=("https://extensions.gnome.org/extension-data/${_extname/@/}.v$pkgver.shell-extension.zip")
b2sums=('7f28c49dc4dc41878a50766dce995c40cfe317a5231727a4ced5e5c6b6bdc0cedff4f010724f2551cf9ab64c23cdc16bc6aa2068e184ee533380b279fc3e0d24')

package(){
  readonly destdir="${pkgdir}/usr/share/gnome-shell/extensions/$_extname"
  mkdir -p "$destdir"
  install -Dt "$pkgdir/usr/share/glib-2.0/schemas/" schemas/*
  rm -r schemas *.shell-extension.zip
  cp --no-preserve=ownership,mode -r * "$destdir"
}
