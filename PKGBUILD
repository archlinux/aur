# Maintainer: Kibouo <csonka.mihaly@hotmail.com>
pkgname=gnome-wallpaper-changer-git
pkgver=r26.19c3b6a
pkgrel=1
pkgdesc='Set Gnome Desktop wallpaper to an image from a provided directory.'
arch=('any')
url='https://github.com/Kibouo/gnome-wallpaper-changer'
license=('GPL2')
depends=('bash')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}::git+https://github.com/Kibouo/gnome-wallpaper-changer.git")
md5sums=('SKIP')
pkgver() {
	cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}${HOME}/.config/autostart"

  cd "${pkgname}"
  cp ./gnome-wallpaper-changer "${pkgdir}/usr/bin"
  cp ./gnome-wallpaper-changer.desktop "${pkgdir}${HOME}/.config/autostart"
}