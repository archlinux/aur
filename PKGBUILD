# Maintainer: Kibouo <csonka.mihaly@hotmail.com>
pkgname=gnome-wallpaper-changer-git
pkgver=r19.b744127
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
  mkdir "${pkgdir}"/usr
  mkdir "${pkgdir}"/usr/bin
  mkdir "${pkgdir}"/home
  mkdir "${pkgdir}${HOME}"
  mkdir "${pkgdir}${HOME}"/.config
  mkdir "${pkgdir}${HOME}"/.config/autostart  

  cd "${pkgname}"
  cp ./gnome-wallpaper-changer /usr/bin
  cp ./gnome-wallpaper-changer.desktop "${HOME}"/.config/autostart
}