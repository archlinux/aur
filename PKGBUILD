# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: robertfoster <morf3089@gmail.com>
# Contributor: Håvard Pettersson <mail@haavard.me>

pkgname=python-sounddevice
pkgver=0.4.5
pkgrel=2
pkgdesc='Record and play back sound'
url='https://python-sounddevice.rtfd.io/'
arch=(any)
license=(MIT)
depends=(portaudio python-cffi)
makedepends=(python-setuptools)
optdepends=('python-numpy: to play back and record NumPy arrays')
source=("https://files.pythonhosted.org/packages/source/s/sounddevice/sounddevice-$pkgver.tar.gz")
b2sums=('2288faa23280fd0a82fb239eac632e8a3e681ad9f681f7508312bad8be64b57a86de8e7384f168e362ae7c39a118fe9aeeaf40d16502b5aee3d25c7d1df48cfb')

package() {
  cd sounddevice-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
