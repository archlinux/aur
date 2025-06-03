pkgname='termtrack'
pkgver=0.7.4
pkgrel=1
pkgdesc='Track satellites in your terminal'
arch=('any')
url='https://github.com/trehn/termtrack'
license=('GPL3')
depends=('python-click' 'python-pillow' 'python-pyshp' 'python-requests')
makedepends=('python-setuptools' 'python-wheel')

source=("https://wumbo.site/bin/linux/termtrack/termtrack-0.7.4.tar.gz")
sha256sums=("5390f20563d84d7923b18d0876fa48ba57b6f3083cd250435afd457d47d25f69")


build() {
  cd "$srcdir/termtrack" || exit 1
  python setup.py build
}

package() {
  cd "$srcdir/termtrack" || exit 1
  python setup.py install --root="$pkgdir/" --optimize=1
}
