# Maintainer: Gustavo Jasso <gustavo at jasso dot info>
pkgname='remarkable-mouse'
pkgdesc="Python scripts to use reMarkable tablet as mouse input."
pkgver=5.1
pkgrel=1
url="https://github.com/Evidlo/remarkable_mouse"
arch=('any')
license=('GPL3')
depends=('python-setuptools' 'python-paramiko' 'python-libevdev' 'python-pynput' 'python-screeninfo')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('3bab90c04b8dd5e96dfaef88ad4189a5')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
