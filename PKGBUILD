# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

_pkgname=abjad-ext-rmakers
pkgname="python-$_pkgname"
pkgver=3.0.0
pkgrel=1
pkgdesc='Abjad rhythm-maker extension'
arch=('any')
url="https://github.com/Abjad/$_pkgname"
license=('MIT')
depends=('python-abjad')
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('c3f49fe4425b7b37e7491845be0972ac47f5d63120303b30ec077ef3c5522cac')


build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}


package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

