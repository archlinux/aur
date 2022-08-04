# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: robertfoster <morf3089@gmail.com>
# Contributor: Håvard Pettersson <mail@haavard.me>

pkgname=python-sounddevice
pkgver=0.4.4
pkgrel=1
pkgdesc='Record and play back sound'
url='https://python-sounddevice.rtfd.io/'
arch=(any)
license=(MIT)
depends=(portaudio python-cffi)
makedepends=(python-setuptools)
optdepends=('python-numpy: to play back and record NumPy arrays')
source=("https://files.pythonhosted.org/packages/source/s/sounddevice/sounddevice-$pkgver.tar.gz")
b2sums=('f93d30d136c5f47929fccf8923009130ae8287d5706e107c5281393889c2cf1c4c23e483c919a7d75b997bee4327ff86b477f07b6a9809f16608aa5e08deed86')

package() {
  cd sounddevice-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
