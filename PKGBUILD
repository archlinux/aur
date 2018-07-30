# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

_pkgname=abjad-ext-tonality
pkgname="python-$_pkgname"
pkgver=3.0.0
pkgrel=2
groups=('abjad')
pkgdesc='Abjad tonal analysis extension'
arch=('any')
url="https://github.com/Abjad/abjad-ext-tonality"
license=('MIT')
depends=('python-abjad')
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('89c861f7e6de78f32beb5a37c61f6e6edee087243bbcc83fa9a7793417568571')


build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}


package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

