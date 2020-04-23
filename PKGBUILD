# Maintainer: Daniel E. Shub <daniel.e.shub@gmail.com>

pkgname=python-psychtoolbox
pkgver=3.0.16
pkgrel=2
pkgdesc="Pieces of Psychtoolbox-3 ported to CPython"
arch=('any')
url="https://pypi.org/project/psychtoolbox/"
license=('custom')
makedepends=('python-setuptools' 'libxfixes')
depends=('alsa-lib' 'libxi' 'libusb' 'portaudio' 'python-numpy')
source=("https://files.pythonhosted.org/packages/88/53/7f7f1b5f6da12219b2262284e0371307037ca0fb60fb28480aa9743b4d54/psychtoolbox-$pkgver.tar.gz")
sha512sums=('bb78bd0a9daf6cc9d9c565534abd76635b523d54df5870dbeacf023efb7a43a8d268b545bca11e6ea018e548a3dce223e1dc9b9578d90269eee6ac30fbab9548')

build() {
  cd "$srcdir/psychtoolbox-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/psychtoolbox-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 PsychSourceGL/License.txt "$pkgdir/"usr/share/licenses/"$pkgname"/LICENSE
}
