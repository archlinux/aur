# Maintainer: Dringsim <dringsim@qq.com>

pkgname=python-ipcqueue
_name="${pkgname#python-}"
pkgver=0.9.7
pkgrel=1
pkgdesc="Ipcqueue provides POSIX and SYS V message queues functionality to exchange data among processes"
arch=('x86_64')
url="https://github.com/seifert/ipcqueue"
license=('custom:BSD-3-Clause')
makedepends=('python-setuptools')
depends=('python-cffi')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('92d3361afe04a24d89b0b25485f6634c8c51aad465ae7a564cc4b81f7e04cf64')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}