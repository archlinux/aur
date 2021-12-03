# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: robertfoster <morf3089@gmail.com>
# Contributor: Håvard Pettersson <mail@haavard.me>

pkgname=python-sounddevice
pkgver=0.4.2
pkgrel=2
pkgdesc='Record and play back sound'
url='https://python-sounddevice.rtfd.io/'
arch=(any)
license=(MIT)
depends=(portaudio python-cffi)
makedepends=(python-setuptools)
optdepends=('python-numpy: to play back and record NumPy arrays')
source=("https://files.pythonhosted.org/packages/source/s/sounddevice/sounddevice-$pkgver.tar.gz")
b2sums=('2c24471e301538ca85fbee75ee79b2b83e24c2a64b0ba573a630d9d8eac7352a3c7eae3942e444ca1f6f622ffd272cdea0f88c381e2886a1468c5b4598d58912')

package() {
  cd sounddevice-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# getver: github.com/spatialaudio/python-sounddevice
