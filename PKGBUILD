# Maintainer: Daniel E. Shub <daniel.e.shub@gmail.com>

pkgname=python-psychtoolbox
pkgver=3.0.18.2
pkgrel=1
pkgdesc="Pieces of Psychtoolbox-3 ported to CPython"
arch=('any')
url="https://pypi.org/project/psychtoolbox/"
license=('custom')
makedepends=('python-setuptools' 'libxfixes')
depends=('alsa-lib' 'libxi' 'libusb' 'portaudio' 'python-numpy')
source=("https://files.pythonhosted.org/packages/72/d9/063da37c6e3031479119922efad0cd2a0c15c43a6959cd1bb5eba579702d/psychtoolbox-$pkgver.zip")
sha512sums=('0fedba0c953b5e78929d3afc9d149aa473072e6f2b6409533aa8a8e6e296e248b9208db3c9d1aa20aaa343b62d4ee42c912bd6e19344c6d1536ba44e46182159')

build() {
  cd "$srcdir/psychtoolbox-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/psychtoolbox-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 PsychSourceGL/License.txt "$pkgdir/"usr/share/licenses/"$pkgname"/LICENSE
}
