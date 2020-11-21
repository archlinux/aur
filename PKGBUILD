# Maintainer: pumpkincheshire <sollyonzou@gmail.com>

_name=anyconfig-configobj-backend
pkgname=python-$_name
pkgver=0.1.4
pkgrel=1
pkgdesc='A backend module for python-anyconfig to load and dump ConfigObj data'
url='https://github.com/ssato/python-anyconfig-configobj-backend'
arch=('any')
license=('MIT')
depends=('python-anyconfig' 'python-configobj')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('28216d5a5714491e1155df26743ae75741e87fb00b5f54f07301dfa56bfe7e5a')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}
