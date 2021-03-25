# Maintainer: naspeh <naspeh@gmail.com>

pkgname=perevod-git
pkgver=0.0.0
pkgrel=4
pkgdesc='Lightweight selection translator (GTK+)'
arch=('any')
url='https://github.com/naspeh/perevod'
license=('BSD')
depends=('python-gobject' 'gtk3')
makedepends=('git')
provides=('perevod')
source=("$pkgname"::'git+https://github.com/naspeh/perevod.git')
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
