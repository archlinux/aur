# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=yolog-git
_gitname=yolog
pkgver=v0.2.2.r10.g8f40117
pkgrel=1
pkgdesc="Beautify your Git Logs"
arch=(any)
url=https://github.com/karandesai-96/yolog/
license=(custom:MIT)
depends=(python)
makedepends=(git)
provides=(yolog)
conflicts=(yolog)
source=(git+https://github.com/karandesai-96/yolog/)
md5sums=(SKIP)


pkgver() {
    cd "$_gitname"
    git describe --long --tags | \
        sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$_gitname"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
