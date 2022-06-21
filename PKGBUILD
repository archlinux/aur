# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Neil F Jones

pkgname=python-midi
pkgver=0.2.5
pkgrel=1
pkgdesc='Feature-rich MIDI toolkit for Python'
arch=('x86_64' 'i686')
url='https://pypi.org/project/python3-midi'
license=('MIT')
depends=('alsa-lib' 'python')
makedepends=('python-setuptools' 'swig')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/7b/e1/8a1f3f1ab4d7b7205ba8c00f86d4a5fb042b2c1f285257bd9545665470cb/python3_midi-0.2.5.tar.gz")
sha256sums=('4e1f6b9c3d00363decd98b0497cb72ce1a59772e15d77ed9847dd85b0f0f32fd')

build() {
  cd "python3_midi-${pkgver}"
  python setup.py build    
}

package() {
  cd "python3_midi-${pkgver}"

  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:ts=2 sw=2 et:
