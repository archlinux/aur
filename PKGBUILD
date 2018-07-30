# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

_pkgname=abjad-ext-ipython
pkgname="python-$_pkgname"
pkgver=3.0.0
pkgrel=2
groups=('abjad')
pkgdesc='Abjad IPython extension'
arch=('any')
url="https://github.com/Abjad/$_pkgname"
license=('MIT')
depends=(
        'python-abjad'
        'python-uqbar'
        'jupyter'
        )
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('2d1035ad99bd8538d6a00947ac67bc1197aed5f912fb52552ce9500d744b5d24')


build() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py build
}


package() {
    cd $srcdir/$_pkgname-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

