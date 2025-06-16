# Maintainer: vedant-asati03 <vedant.asati03@gmail.com>
pkgname=aurras
pkgver=2.0.2
pkgrel=1
pkgdesc="A high-end command line music player"
arch=('any')
url="https://github.com/vedant-asati03/Aurras"
license=('MIT')
depends=('python>=3.12' 'python-pip' 'mpv' 'ffmpeg')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/a/aurras/aurras-${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install license
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim:set ts=4 sw=4 et:
