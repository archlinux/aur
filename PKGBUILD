# Maintainer: ous fifty <(first name)(last name) at gmail.com>
_pkgname=noisereduce
pkgname=python-noisereduce
pkgver=3.0.2
pkgrel=2
pkgdesc="Noise reduction using Spectral Gating in Python"
arch=('any')
license=('MIT')
url="https://github.com/timsainb/${_pkgname}"

depends=("python")

source=("https://github.com/timsainb/${_pkgname}/archive/v${pkgver}.zip")
sha256sums=("af1c46cdbc1eefe0bc3ba5971c49686c3bc9f085f3589dc6e4195f0701b69b2e")

build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root=$pkgdir --optimize=1 --skip-build

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
