# Maintainer: Atreya Shankar <shankar.atreya@gmail.com>

pkgname='i3-balance-workspace'
pkgver=1.8.5
pkgrel=3
pkgdesc='Balance windows and workspaces in i3wm'
url='https://github.com/atreyasha/i3-balance-workspace'
depends=('python>=3.5.0' 'python-i3ipc>=2.2.1-1')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('69c8a0c11c4bf9ac87012548f886445a')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
