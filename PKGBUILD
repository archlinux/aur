# Maintainer: Miguel Useche <migueluseche@skatox.com>
# Contributor: Anton Leontiev <unsector /at/ km.ru>
# Contributor: Sandy Carter <bwrsandman /at/ gmail.com>
# Contributor: Mario Aichinger <aichingm /at/ gmail.com>
# Contributor: Florian Reimair <office /at/ florianreimair.at>

pkgname=guake-git
pkgver=3.6.3.37.g9d3ef38
pkgrel=1
pkgdesc="Top-down terminal for Gnome using gtk3 and vte3"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/Guake/guake"
license=('GPL')
depends=('vte3' 'gtk3' 'python-pbr' 'python-dbus' 'python-xdg' 'libutempter' 'libkeybinder3' 'python-cairo' 'vte-common' 'python-gobject' 'gettext' 
'gobject-introspection-runtime' 'libwnck3' 'libnotify')
makedepends=('git' 'python-pip' 'make')
conflicts=('guake' 'guake-gtk2-git')
provides=('guake')
source=("git://github.com/Guake/guake.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --tags | sed 's,-,.,g'
}

package(){
  cd "${srcdir}/${pkgname%-git}"
  cp "${srcdir}/guake/guake/data/guake.template.desktop" "${srcdir}/guake/guake/data/guake.desktop" 
  cp "${srcdir}/guake/guake/data/guake-prefs.template.desktop" "${srcdir}/guake/guake/data/guake-prefs.desktop" 
  make install DESTDIR="$pkgdir" PREFIX="/usr" COMPILE_SCHEMA=1
}
