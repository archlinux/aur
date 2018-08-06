# $Id: PKGBUILD 366114 2018-07-31 19:39:06Z foutrelis $
# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: robertfoster <morf3089@gmail.com>
# Contributor: Håvard Pettersson <mail@haavard.me>

pkgname=python-sounddevice
pkgver=0.3.11
pkgrel=2
pkgdesc='Play and Record Sound with Python'
url='http://python-sounddevice.rtfd.io/'
arch=('any')
license=('MIT')
depends=('portaudio' 'python-cffi')
makedepends=('python-setuptools')
optdepends=('python-numpy: to play back and record NumPy arrays')
source=("https://files.pythonhosted.org/packages/source/s/sounddevice/sounddevice-$pkgver.tar.gz")
md5sums=('e40927c78366d4503413f4d6f62be23e')

package() {
  cd "sounddevice-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# getver: -u 2 anaconda.org/conda-forge/sounddevice
# vim: ts=2 sw=2 et:
