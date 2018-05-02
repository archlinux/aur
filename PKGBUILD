# Maintainer: Miguel Useche <migueluseche@skatox.com>
# Contributor: Anton Leontiev <unsector /at/ km.ru>
# Contributor: Sandy Carter <bwrsandman /at/ gmail.com>
# Contributor: Mario Aichinger <aichingm /at/ gmail.com>

pkgname=guake-git
pkgver=3.2.1.11.g284f9e9
pkgrel=2
pkgdesc="Top-down terminal for Gnome using gtk3 and vte3"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/Guake/guake"
license=('GPL')
depends=('vte3' 'gtk3' 'python-pbr' 'python-dbus' 'python-xdg' 'libutempter' 'libkeybinder3' 'python-cairo' 'vte-common' 'python-gobject' 'gettext' 'gobject-introspection-runtime')
makedepends=('git' 'python-pip' 'make')
conflicts=('guake' 'guake-gtk2-git')
provides=('guake')
source=("git://github.com/Guake/guake.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --tags | sed 's,-,.,g'
}

build(){
  cd "${srcdir}/${pkgname%-git}"
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make install DESTDIR="$pkgdir/" PREFIX="/usr" COMPILE_SCHEMA=0
}
