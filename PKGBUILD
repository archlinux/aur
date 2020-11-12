# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=fusesoc
pkgver=1.11.0
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
sha512sums=('3b31f7e72eb54f3de1a4b5e2d959fb2affaf2e9189b1ab66629e153d95ee13304bf873b643726b9b0d2223e0c0b074691c1c0fd85dc1832f677b729a85ce4daf')

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
