# Maintainer: Gabriele Musco <gabmus@disroot.org>
# Upstream URL: https://gitlab.gnome.org/ZanderBrown/gnome-source-thumbnailer
# Modified from Eric Bélanger <eric@archlinux.org> PKGBUILD of python-feedparser

pkgname=gnome-source-thumbnailer-git
pkgver=3e1503c
pkgrel=1
pkgdesc="Thumbnails for your code"
arch=('any')
url="https://gitlab.gnome.org/ZanderBrown/gnome-source-thumbnailer"
license=('GPL-3.0')
makedepends=('python-setuptools' 'git')
depends=('python')
conflicts=('gnome-source-thumbnailer')
source=("gnome-source-thumbnailer::git+https://gitlab.gnome.org/ZanderBrown/gnome-source-thumbnailer.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/gnome-source-thumbnailer"
  git describe --always --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/gnome-source-thumbnailer"
  python setup.py install --root="${pkgdir}"
}
