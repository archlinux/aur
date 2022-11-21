# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: David Campbell <davekong@archlinux.us>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=python38-paste
pkgver=3.5.2
pkgrel=1
pkgdesc="Tools for using a Web Server Gateway Interface stack"
arch=('any')
url="https://pythonpaste.readthedocs.io/"
license=('MIT')
depends=('python38-six')
optdepends=('python38-flup: WSGI utilities')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest' 'python38-flup')
source=("https://files.pythonhosted.org/packages/source/P/Paste/Paste-${pkgver}.tar.gz")
sha512sums=('a1920dbd7ebea137ca33f8f8c33aad563329d1eea193d84e6aa7fc57690f706c1969e3ba76bbf21a73c59a0fe0f732daa4db15705914ac359814b4332a01bc75')

build() {
  cd Paste-$pkgver
  python3.8 setup.py build
}

check() {
  cd Paste-$pkgver
  pytest
}

package() {
  cd Paste-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 docs/license.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
