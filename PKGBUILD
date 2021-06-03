# Maintainer: twa022 <twa022 at gmail dot com>

pkgname='nemo-media-columns'
pkgver=5.0.0
pkgrel=1
pkgdesc="Media properties columns in Nemo"
arch=('any')
license=('GPL2')
url="https://github.com/linuxmint/nemo-extensions"
depends=('nemo-python>=3.9.0' 'python-mutagen' 'exiv2' 'python-pymediainfo' 'python-pillow' 'python-pypdf2')
options=('!emptydirs')
makedepends=('python-distutils-extra')
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('e9d0e592a8b8bc0a4f0eb5222994f522f0e255f5a0c86e8069933864e2ca7485')

package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  python ./setup.py install --prefix=/usr --root="${pkgdir}" \
                            --no-compile -O0
}
