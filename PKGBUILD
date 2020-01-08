# Maintainer: Mendel Greenberg <chabad 360 at gmail dot com>
pkgname=gnome-shell-extension-argos-git
pkgver=r51.e7c69ff
pkgrel=1
pkgdesc="Create GNOME Shell extensions in seconds"
arch=('any')
url="https://github.com/p-e-w/argos"
license=('GPL3')
groups=('gnome-shell-extensions')
depends=('gnome-shell')
makedepends=('git')
provides=('gnome-shell-extension-argos')
conflicts=('gnome-shell-extension-argos')
source=('git+https://github.com/p-e-w/argos.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/argos"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/argos"
  chmod -R 644 ./*
  install -d "${pkgdir}/usr/share/gnome-shell/extensions/"
  cp -r "argos@pew.worldwidemann.com/" "${pkgdir}/usr/share/gnome-shell/extensions/"
  chmod -R 755 "${pkgdir}/usr/share/gnome-shell/extensions/argos@pew.worldwidemann.com/"
}

if [ -z "$install" ]; then
  install=gschemas.install
fi
