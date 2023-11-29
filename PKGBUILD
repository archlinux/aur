# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Old Maintainer:Lubosz Sarnecki <lubosz@gmail.com>
# Old Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
 
pkgname=python-cairo-git
pkgver=1.25.0.r21.ge44fe88
pkgrel=1
pkgdesc="Python bindings for the cairo graphics library. Git version."
url="http://www.cairographics.org/"
arch=('i686' 'x86_64')
license=('LGPL3')
depends=('python' 'cairo>=1.12')
makedepends=('git' 'pkg-config' 'python-setuptools')
options=('!libtool')
provides=("python-cairo=1.20.0")
conflicts=('python-cairo')
source=("${pkgname}::git+https://github.com/pygobject/pycairo")
sha256sums=('SKIP')
 
pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48
}
 
package() {
    cd ${srcdir}/${pkgname}
    python setup.py install --root=${pkgdir}/ --optimize=1
}
 
# vim:set ts=4 sw=4 et:
