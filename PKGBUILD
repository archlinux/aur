# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Corrado 'bardo' Primier <corrado.primier@mail.polimi.it>
# Contributor: cs-cam <me.at.camdaniel.com>

pkgname=wammu
pkgver=0.44
pkgrel=3
pkgdesc="A wxPython-based GUI for Gammu"
arch=('any')
url="https://wammu.eu/"
license=('GPL')
depends=('python2-gammu' 'wxpython' 'python2-six')
makedepends=('python2-setuptools')
optdepends=('gnome-bluetooth: Bluetooth support'
            'python2-pybluez: Bluetooth support')
source=(https://dl.cihar.com/$pkgname/v0/$pkgname-$pkgver.tar.xz)
sha256sums=('bf8199f888cb60e4a24839e71ec6f8e8deb11fd22f592fe1112e3252bd4b9145')


prepare() {
  cd "$pkgname-$pkgver"

  # python2 fix
  sed -i 's_/usr/bin/env python_/usr/bin/env python2_' setup.py
}

package() {
  cd "$pkgname-$pkgver"

  python2 setup.py install --root="${pkgdir}" --optimize=1
}
