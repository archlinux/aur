# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

_pkgname=abjad-ext-cli
pkgname="python-$_pkgname"
pkgver=3.0.0
pkgrel=1
pkgdesc='Abjad CLI extension'
arch=('any')
url="https://github.com/Abjad/$_pkgname"
license=('MIT')
depends=(
        'python-abjad'
        'python-uqbar'
        )
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('cd00835ba6313411505ca5a6be77b7457d02a32baed0fc7e66aac2cf66aac784')


build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}


package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

