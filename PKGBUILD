# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Michal Bozon <michal.bozon__at__gmail.com>

pkgbase=pypy-yaml
pkgname=(pypy-yaml pypy3-yaml)
pkgver=3.11
pkgrel=1
pkgdesc="Python bindings for YAML, using fast libYAML library (for pypy)"
arch=('i686' 'x86_64')
url="http://pyyaml.org"
license=('MIT')
makedepends=('pypy3' 'pypy' 'libyaml')
install='pypy-yaml.install'
source=(http://pyyaml.org/download/pyyaml/PyYAML-$pkgver.tar.gz)
md5sums=('f50e08ef0fe55178479d3a618efe21db')

build() {
  true
}

package_pypy-yaml() {
  depends=('pypy' 'libyaml')

  cd $srcdir/PyYAML-$pkgver
  pypy setup.py install --prefix=/opt/pypy --root=$pkgdir
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

package_pypy3-yaml() {
  depends=('pypy3' 'libyaml')

  cd $srcdir/PyYAML-$pkgver
  pypy3 setup.py install --prefix=/opt/pypy3 --root=$pkgdir
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
