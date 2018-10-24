# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: robertfoster <morf3089@gmail.com>
# Contributor: Håvard Pettersson <mail@haavard.me>

pkgname=python-sounddevice
pkgver=0.3.12
pkgrel=1
pkgdesc='Play and Record Sound with Python'
url='https://python-sounddevice.rtfd.io/'
arch=('any')
license=('MIT')
depends=('portaudio' 'python-cffi')
makedepends=('python-setuptools')
optdepends=('python-numpy: to play back and record NumPy arrays')
source=("https://files.pythonhosted.org/packages/source/s/sounddevice/sounddevice-$pkgver.tar.gz")
sha256sums=('f59ae4e2ec12cb1e5940f06f08804ecca855d959de25ca45a3938de45d0f81a2')

package() {
  cd "sounddevice-$pkgver"

  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# getver: github.com/spatialaudio/python-sounddevice
# vim: ts=2 sw=2 et:
