# Maintainer: Mendel Greenberg <chabad 360 at gmail dot com>
pkgname=gnome-shell-extension-argos-git
pkgver=r51.e7c69ff
pkgrel=3
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

prepare() {
  cd argos
  printf '0+%s+g%s' $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/argos"
  rm -rf ".git" "README.md"
  install -dm644 "argos@pew.worldwidemann.com/." "$pkgdir/usr/share/gnome-shell/extensions/argos@pew.worldwidemann.com/"
}

if [ -z "$install" ]; then
  install=gschemas.install
fi
