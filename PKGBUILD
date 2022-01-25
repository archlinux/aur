# Maintainer: Maik93 <michael.mugnai@gmail.com>
# Contributor: Ethan Zonca <e@ethanzonca.com>

pkgname=python-cantools
_gitname=cantools
provides=('python-cantools')
conflicts=('python-cantools')
pkgdesc="Python CAN bus tools in Python 3"
url="https://github.com/eerimoq/cantools"
pkgver=37.0.3
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
md5sums=('18e2c11f219a839b450a8f524d1843ad')

package() {
	cd "$srcdir/$_gitname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
