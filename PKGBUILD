# Maintainer: twa022 <twa022 at gmail dot com>

pkgname='nemo-media-columns'
pkgver=5.2.0
pkgrel=2
pkgdesc="Media properties columns in Nemo"
arch=('any')
license=('GPL2')
url="https://github.com/linuxmint/nemo-extensions"
depends=('nemo-python>=3.9.0' 'python-mutagen' 'exiv2' 'python-pymediainfo'
         'python-pillow' 'python-pypdf2' 'python-stopit')
options=('!emptydirs')
makedepends=('python-distutils-extra')
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('92364ac03be3458d3cdfa39ebd4061babd3926c280459e66f8814a6acc42a6a5')

package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  python ./setup.py install --prefix=/usr --root="${pkgdir}" \
                            --no-compile -O0
}
