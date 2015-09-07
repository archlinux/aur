# Maintainer: Michał Szymański <smiszym at gmail dot com>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=jokosher
pkgver=0.11.5
pkgrel=3
pkgdesc="A simple and easy-to-use Open Source multi-track editor"
arch=('any')
url="http://jokosher.org"
license=('GPL')
install="$pkgname.install"
depends=('gstreamer0.10-python' 'gnonlin' 'dbus-python' 'libcanberra'
         'gstreamer0.10-base-plugins' 'gstreamer0.10-base>=0.10.12' 'pygtk'
         'gstreamer0.10-good' 'desktop-file-utils' 'hicolor-icon-theme' 'pyxdg')
makedepends=('python2-distribute')
source=("http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz")
md5sums=('941b1fac0a93e2963afc192545caf320')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    python2 setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    python2 setup.py install --skip-build --root=$pkgdir

    # python2 fix
    sed -i 's|bin/python|&2|' `find "$pkgdir" -name "*.py"`
} 

# vim:set ts=4 sw=4 et:
