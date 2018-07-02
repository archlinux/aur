# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
pkgname=python2-keyrings-alt
_pkgname=${pkgname#python2-}
pkgver=3.1
pkgrel=1
pkgdesc="Alternate keyring backend implementations for use with the keyring package."
arch=('any')
url="https://github.com/jaraco/keyring"
license=('MIT')
depends=('python2-six')
makedepends=('python2-pip')
provides=('python2-keyrings-alt')
conflicts=('python2-keyrings-alt')
source=("https://pypi.io/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('6a00fa799baf1385cf9620bd01bcc815aa56e6970342a567bcfea0c4d21abe5f')

build() {
  cd $_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1

  mv "$pkgdir"/usr/bin/keyring "$pkgdir"/usr/bin/keyring2
}

