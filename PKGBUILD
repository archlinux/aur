# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_subscription
_name=trytond_sale_subscription
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for subscription"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7eb9220f8c3f13c995516b31aa368cb3be0eef66219f0e2517017beac5737e5b')
sha512sums=('bfcef6b4508a945c1a819790c8e94a23718883bb14eb1a4da5dacd99b6a1857538b40e0b8c47cb38db6333716ca00587f04a30b2f20c3bc79a46af8fa29a8270')
b2sums=('d4ca86b0fff4fc8c080576c2f778caa977c4810b68644e976f66709962ff470588c46df9e971eef07f14aa5123d9c02e24d49f68ddb468dd962a1ca626b177f0')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
