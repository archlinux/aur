# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

_pkgname=abjad-ext-book
pkgname="python-$_pkgname"
pkgver=3.0.0
pkgrel=2
groups=('abjad')
pkgdesc='Abjad book extension'
arch=('any')
url="https://github.com/Abjad/$_pkgname"
license=('MIT')
depends=(
        'python-abjad'
        'python-uqbar'
        'python-pypdf2'
        )
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('0a4c89f538ba626258dd033ec53e74544b54bef614d91cceb73cea7203003c4f')


build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}


package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

