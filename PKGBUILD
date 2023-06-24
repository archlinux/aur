# Maintainer: twa022 <twa022 at gmail dot com>

pkgname='nemo-media-columns'
pkgver=5.8.0
pkgrel=1
pkgdesc="Media properties columns in Nemo"
arch=('any')
license=('GPL2')
url="https://github.com/linuxmint/nemo-extensions"
depends=('nemo-python>=3.9.0' 'python-mutagen' 'exiv2' 'python-pymediainfo'
         'python-pillow' 'python-pypdf2' 'python-stopit')
options=('!emptydirs')
makedepends=('python-distutils-extra')
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('66140a8d7365c1333f219d3012bf51c9462df4f8b1187d08716c9c577a77af28')

package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  python ./setup.py install --prefix=/usr --root="${pkgdir}" \
                            --no-compile -O0
}
