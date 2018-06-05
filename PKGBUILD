# Maintainer: Kalle Lindqvist <kalle.lindqvist@mykolab.com>
pkgname=xkeysnail-git
pkgver=r51.g26ecdf8
pkgrel=1
pkgdesc="Yet another keyboard remapping tool for X environment."
arch=('any')
url="https://github.com/mooz/xkeysnail"
license=('GPL')
depends=('python'
         'python-xlib'
         'python-evdev'
         'python-inotify-simple')
makedepends=('python-setuptools'
             'git')
provides=('xkeysnail')
conflicts=('xkeysnail')
source=("git://github.com/mooz/xkeysnail.git")
md5sums=("SKIP")
_gitname="xkeysnail"

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long | sed 's/^HEAD-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$_gitname"
    python setup.py install --root="$pkgdir/" --optimize=1
}
