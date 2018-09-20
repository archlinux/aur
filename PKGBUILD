# Maintainer: Lars Hagström <lars@foldspace.nu>
pkgname=openxenmanager-git
pkgver=r292.1cb5c1c
pkgrel=1
pkgdesc="An opensource multiplatform clone of Citrix XenCenter"
arch=('any')
url="https://github.com/OpenXenManager/openxenmanager"
license=('GPL2')
groups=()
depends=('python2' 'rrdtool' 'gtk-vnc-gtk2' 'python2-configobj' 'pygtk' 'python2-raven')
makedepends=('git' 'python2-setuptools')
conflicts=('openxenmanager-svn' 'python2-gtkchart-git')
options=(!emptydirs)
install=
source=("$pkgname"::"git+https://github.com/OpenXenManager/openxenmanager.git")
sha1sums=('SKIP')
backup=()

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -D -m644 "desktop_and_icons/openxenmanager.desktop" ${pkgdir}/usr/share/applications/openxenmanager.desktop
}

