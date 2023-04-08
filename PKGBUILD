# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=fusesoc
pkgver=1.12.0
pkgrel=3
pkgdesc='Package manager and build abstraction tool for FPGA/ASIC development'
arch=('any')
url='https://github.com/olofk/fusesoc'
license=('BSD')
depends=('python' 'python-edalize' 'python-ipyxact' 'python-pyparsing' 'python-yaml' 'python-simplesat' 'git')
makedepends=('python-setuptools-scm')
optdepends=('iverilog: run simulation/testbenchs'
            'svn: opencores provider')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('2a2f02313af951f17d34e317d19c85b0b9188078387e800ec78f00495fae86a3329f267ed1c8c0423d9d5bea85a36415e45acecc6b3fabdd8e6f6b978d2acc20')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd $pkgname-$pkgver

  python setup.py build
}

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
