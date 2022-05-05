# Maintainer: Bet4 <0xbet4@gmail.com>

_pkgname=udbserver
pkgname=python-$_pkgname
pkgver=0.1
pkgrel=1
pkgdesc="Python bindings for udbserver"
arch=(x86_64)
url="https://github.com/bet4it/udbserver"
license=(MIT)
depends=(udbserver python-unicorn-git)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a5c3ef3585787d73d035412a6645bfee5b7e13c7a2822ecb2ac3a0445e18c26f')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
