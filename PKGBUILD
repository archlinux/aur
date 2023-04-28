# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: robertfoster <morf3089@gmail.com>
# Contributor: Håvard Pettersson <mail@haavard.me>

pkgname=python-sounddevice
pkgver=0.4.6
pkgrel=2
pkgdesc='Record and play back sound'
url='https://python-sounddevice.rtfd.io/'
arch=(any)
license=(MIT)
depends=(portaudio python-cffi)
makedepends=(python-setuptools)
optdepends=('python-numpy: to play back and record NumPy arrays')
source=("https://files.pythonhosted.org/packages/source/s/sounddevice/sounddevice-$pkgver.tar.gz")
b2sums=('27d8d0414f3fffa7aedc69a9795a905ab753829d7ea5f7a6baa34f32e0e8e015bd053aa7cbd56423083feb3481ad3843ff7e3da473635a6a742081a3ef765b1b')

package() {
  cd sounddevice-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
