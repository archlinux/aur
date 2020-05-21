# Maintainer: Gustavo Jasso <gustavo at jasso dot info>
pkgname='remarkable-mouse'
pkgdesc="Python scripts to use reMarkable tablet as mouse input."
pkgver=5.2.1
pkgrel=1
url="https://github.com/Evidlo/remarkable_mouse"
arch=('any')
license=('GPL3')
depends=('python-setuptools' 'python-paramiko' 'python-libevdev' 'python-pynput' 'python-screeninfo')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('e0418d34a25308f6d49ccad5f4c6af03')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
