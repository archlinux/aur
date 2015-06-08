# Maintainer: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=python2-gnupg-patched
pkgver=1.4.0
pkgrel=1
pkgdesc="Fork of python-gnupg-0.3.2, patched to fix a potential vulnerability which could result in remote code execution."
arch=(any)
url="https://github.com/isislovecruft/python-gnupg"
depends=('python2' 'python2-psutil')
source=("https://pypi.python.org/packages/source/g/gnupg/gnupg-$pkgver.tar.gz")
sha256sums=('406752593c83cbac17f447a4e48088860ac36f0b4e40101d377f7dc018d11c57')

build() {
  cd "$srcdir/gnupg-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/gnupg-$pkgver"
  python2 setup.py install --root=$pkgdir --optimize=1
}

# vim:set ts=2 sw=2 et:
