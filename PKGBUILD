# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=python2-liblarch
pkgver=3.0
pkgrel=1
pkgdesc="Python library to easily handle data structure"
arch=('any')
url="https://wiki.gnome.org/action/show/Projects/liblarch"
license=('LGPL3')
depends=('python2')
makedepends=('python2-distribute' 'git')
checkdepends=('python2-nose' 'python2-gobject')
provides=('python2-liblarch_gtk')
conflicts=('python2-liblarch_gtk')
source=("git+https://github.com/liblarch/liblarch#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  cd "$srcdir/liblarch"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  find "$pkgdir"/usr/lib/python2.7/site-packages/liblarch -name '*.py' | \
  xargs sed -i "s|#!/usr/bin/env python|#!/usr/bin/env python2|"
}
