# Maintainer: wordofglass <wordofglass@users.noreply.github.com>

pkgname=beets-copyartifacts-git
pkgver=0.1.5.r1.2583e59
pkgrel=1
pkgdesc="A beets plugin that moves non-music files during the import process."
arch=('any')
url="https://github.com/adammillerio/${pkgname%-git}"
license=('MIT')
depends=('python' 'beets')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
    install -Dm644 README.rst "$pkgdir/usr/share/doc/${pkgname%-git}/README.rst"
}

# vim: set et sw=4 ts=4 :
