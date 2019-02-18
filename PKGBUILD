# Maintainer: M.Reynolds <blackboxnetworkproject@gmail.com>
# Contributer: Fabian Henze <flyser42@gmx.de>

pkgname=cournal
pkgver=r207.23392b8
pkgrel=1
pkgdesc='A collaborative note taking and journal application using a stylus.'
arch=('any')
license=('GPL3')
url='https://github.com/flyser/cournal'
depends=('python' 'gtk3' 'poppler-glib' 'gobject-introspection' 'python-gobject' 'python-cairo'
         'python-zope-interface' 'hicolor-icon-theme' 'desktop-file-utils' 'intltool')
makedepends=('git' 'mercurial')
source=('git+https://github.com/flyser/cournal.git')
md5sums=('SKIP')

pkgver () {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    ./download-twisted.sh
}

package () {
    cd "$srcdir/$pkgname"
    install -d 755 "$pkgdir"
    python setup.py install --root="$pkgdir" --optimize=1
}
