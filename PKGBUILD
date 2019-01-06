# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=instalooter
pkgver=2.3.2
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
sha512sums=('4a509d1f9f859d3aff8b835c0d3cfa281dfa30728c7dfb6c9a3eb72bc9b868329b152627f9b5e08c5a1f736cb8247b6b8ad69ad2ea6660916f7d80e13b7a2178')

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
