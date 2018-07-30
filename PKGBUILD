# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

_pkgname=abjad-ext-nauert
pkgname="python-$_pkgname"
pkgver=3.0.0
pkgrel=2
groups=('abjad')
pkgdesc="Abjad quantization extension, based on Paul Nauert's Q-Grids"
arch=('any')
url="https://github.com/Abjad/$_pkgname"
license=('MIT')
depends=(
        'python-abjad'
        'python-uqbar'
        )
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('94835fa7dfeb8856d222387a9a4a73a3a71cd6b818145d6ec5a09859e6a10f2f')


build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}


package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

