# Maintainer: Atreya Shankar <shankar.atreya@gmail.com>

pkgname='i3-balance-workspace'
pkgver=1.8.6
pkgrel=1
pkgdesc='Balance windows and workspaces in i3wm'
url='https://github.com/atreyasha/i3-balance-workspace'
depends=('python>=3.5.0' 'python-i3ipc>=2.2.1-1')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('786d29f2ac5679b42cc0efd061dc8310')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
