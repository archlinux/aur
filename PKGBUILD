# Maintainer: naspeh <naspeh@ya.ru>

pkgname=tider-git
pkgver=0.0.0
pkgrel=11
pkgdesc='Lightweight time tracker (GTK+)'
arch=('any')
url='http://pusto.org/en/tider/'
license=('BSD')
depends=('python-gobject' 'gtk3' 'libnotify')
makedepends=('git')
provides=('tider')
source=("$pkgname"::'git://github.com/naspeh/tider.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    python setup.py build || return 1
    python setup.py install --root=$pkgdir --optimize=1 || return 1
}
