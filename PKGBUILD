# Maintainer: Maik93 <michael.mugnai@gmail.com>
# Contributor: Ethan Zonca <e@ethanzonca.com>

pkgname=python-cantools
_gitname=cantools
provides=('python-cantools')
conflicts=('python-cantools')
pkgdesc="Python CAN bus tools in Python 3"
url="https://github.com/eerimoq/cantools"
pkgver=38.0.2
pkgrel=1
arch=('i686' 'x86_64' 'armv7h')
license=('GPL3')
depends=(
    'python-bitstruct>=6.0.0'
    'python-can>=2.2.0'
    'python-textparser>=0.21.1'
    'python-diskcache'
    'python-argparse-addons'
)
optdepends=('python-matplotlib: plot decoded messages')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
md5sums=('44fc4db1217f54dbe4608314fe3d6b79')

package() {
	cd "$srcdir/$_gitname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
