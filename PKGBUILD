# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor : Yamada Hayao <hayao@fascode.net>

pkgname=gnome-shell-extension-coverflow-alt-tab
_extname="CoverflowAltTab@palatis.blogspot.com"
pkgver=57
pkgrel=1
pkgdesc="Replacement of Alt-Tab, iterates through windows in a cover-flow manner"
arch=('any')
url="https://github.com/dmo60/CoverflowAltTab"
license=('GPL')
source=("https://extensions.gnome.org/extension-data/${_extname/@/}.v$pkgver.shell-extension.zip")
b2sums=('2498a343399f99979e78ea6a2cdb0b190577ac48a5662c3b02f912204f887eaf1f8c515470cbc92a8d77d86ffc4a2bd16948cf5e2525898c6a8fffdf4704da8c')

package(){
  readonly destdir="${pkgdir}/usr/share/gnome-shell/extensions/$_extname"
  mkdir -p "$destdir"
  install -Dt "$pkgdir/usr/share/glib-2.0/schemas/" schemas/*
  rm -r schemas *.shell-extension.zip
  cp --no-preserve=ownership,mode -r * "$destdir"
}
