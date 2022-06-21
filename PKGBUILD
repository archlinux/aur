# Maintainer: Laurent Carlier <lordheavym@archlinux.org>

pkgname=cpcec-gtk
pkgver=1.5
_tag=20220104
pkgrel=1
pkgdesc="An Amstrad CPC / Plus / GX-4000 emulator"
url="https://gitlab.com/norecess464/cpcec-gtk"
license=('custom')
arch=('x86_64')
depends=('sdl2' 'gtk3')
makedepends=('git')
source=("${pkgname}-${pkgver}::git+https://gitlab.com/norecess464/cpcec-gtk#tag=v${pkgver}-${_tag}"
        cpcec-gtk.mk)
sha256sums=('SKIP'
            'a2ee410380a74c1fbd4ee6d87ca764e5b2ab07711cee57caa9ec66701f266deb')

prepare() {
  cp cpcec-gtk.mk "${pkgname}-${pkgver}"/
}

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"
  
  cp -r cpcec-gtk/usr "${pkgdir}"/
}
