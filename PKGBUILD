# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=python-midi
pkgver=0.2.3
pkgrel=1
pkgdesc='Feature-rich MIDI toolkit for Python'
arch=('x86_64' 'i686')
url='https://github.com/vishnubob/python-midi'
license=('MIT')
depends=('alsa-lib' 'python')
makedepends=('python-setuptools' 'swig')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vishnubob/python-midi/archive/feature/python3.tar.gz")
sha256sums=('1a77874594f27d7ccb2c26bbb936d5ad35fbffa037bb0088028556afaee887f8')

build() {
  cd "$pkgname-feature-python3"

  python setup.py build    
}

package() {
  cd "$pkgname-feature-python3"

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:ts=2 sw=2 et:
