# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=python-fusepyng
_gitname=fusepyng
pkgver=1.0.7
pkgrel=3
pkgdesc="Simple ctypes bindings for FUSE"
arch=('i686' 'x86_64')
url="https://github.com/rianhunter/fusepyng"
license=('ISC')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rianhunter/$_gitname/archive/v$pkgver.tar.gz"
#source=($pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_gitname::1}/$_gitname/$_gitname-$pkgver.tar.gz")
        "https://raw.githubusercontent.com/rianhunter/$_gitname/$_gitname/LICENSE")
sha256sums=('e22b3643867cb1d4caa30d2bdbddbd67ac608f42438fa8307e119f101c3992e8'
            'e61e6b2171e77a5da5a6b8bdb1e588dd0c660fd2ac64342cded4ab53cf3d4140')

build() {
	cd "$_gitname-$pkgver"
    python setup.py build
}

package() {
	cd "$_gitname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
