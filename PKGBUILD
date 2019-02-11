# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=instalooter
pkgver=2.3.3
pkgrel=1
pkgdesc='Another API-less Instagram pictures and videos downloader'
arch=('any')
url=https://github.com/althonos/InstaLooter
license=('GPL3')
depends=('python-coloredlogs' 'python-dateutil' 'python-docopt'
         'python-fake-useragent' 'python-fs' 'python-requests' 'python-six'
         'python-tenacity' 'python-tqdm' 'python-verboselogs')
makedepends=('python-setuptools')
checkdepends=('python-contexter' 'python-mock' 'python-parameterized'
              'python-piexif' 'python-pillow')
optdepends=('python-piexif: to add EXIF metadata to downloaded pictures'
            'python-pillow: to add EXIF metadata to downloaded pictures')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('9138674bd6ec1a4976f00fdaa6be44913a1d100bb8bd8f547aeb2d50e8db9267eb458f6a85226c91bae9bf840b7624c9547c5bb539ce2dcff23da693238d17cd')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  python -m unittest discover
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
