# Mantainer: 3ED_0 <krzysztof1987 at gmail.com>

pkgname=vold2-tnc-gtk-theme-git
pkgver=20150416.14eace5
pkgrel=1
pkgdesc="The successor of Vold GTK Theme with semi-material design influences and authentic flat, based on Iris Dark theme."
arch=('any')
url="http://gnome-look.org/content/show.php/Vold+2%3A+The+Next+Chapter?content=168976"
license=('GPL3')
depends=('gtk3')
makedepends=('git')
source=("${pkgname}::git+https://github.com/thearakattack/vold2-tnc.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

package() {
  cd "${pkgname}"
  _DESTDIR="${pkgdir}/usr/share/themes/"
  install -dm755 "$_DESTDIR"
  bsdtar -cf - */ | bsdtar -xf - -C "$_DESTDIR"
  chmod a=r,a+X,u+w "$_DESTDIR"
}
