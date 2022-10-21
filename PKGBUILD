pkgname=python-clip
pkgver=0.2.0
pkgrel=1
pkgdesc='A CLI clipboard manager '
arch=(x86_64)
url='https://github.com/silent1mezzo/clip'
license=('custom')
source=("$pkgname-$pkgver::https://files.pythonhosted.org/packages/58/dc/12bf8888635ade4de57565dca75909a809d1da6ec341eacd546028a73ab9/clip-0.2.0.tar.gz")
sha512sums=('9216a8975ffcb3a99ed20cbd7ce7ee7f37ce93a9d17b58a9d4e35d336b9f0e481b4d34ae7689dd0ce90dabb975567b1243911762ebd4bc706f19bbabd92d916b')
depends=(
    'python'
)

build() {
    cd clip-$pkgver
    python setup.py build
}

package() {
    cd clip-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
