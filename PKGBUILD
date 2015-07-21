# Maintainer: foalsrock <foalsrock at gmail dot-com>

pkgname=moslight-themes-git
pkgver=r130.e7dbc15
pkgrel=1
pkgdesc="Slick GTK 2/3 and GNOME Shell themes resembling the elementary look"
arch=(any)
url="http://dasnoopy.deviantart.com/art/MosLight-3-12-448823771"
license=('GPL2')
depends=('gtk-engine-murrine' 'gtk-engines' 'gnome-themes-standard')
makedepends=('git')
source=("git://github.com/dasnoopy/moslight-themes")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/moslight-themes"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "${pkgdir}/usr/share/themes"
  cp -r "${srcdir}/moslight-themes/MosLight" "${pkgdir}/usr/share/themes/MosLight"
  cp -r "${srcdir}/moslight-themes/Mosemite" "${pkgdir}/usr/share/themes/Mosemite"
  cp -r "${srcdir}/moslight-themes/MosSky" "${pkgdir}/usr/share/themes/MosSky"
}
