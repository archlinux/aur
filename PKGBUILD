# Maintainer: twa022 <twa022 at gmail dot com>

pkgname='nemo-media-columns'
pkgver=6.0.0
pkgrel=2
pkgdesc="Media properties columns in Nemo"
arch=('any')
license=('GPL2')
url="https://github.com/linuxmint/nemo-extensions"
depends=('nemo-python>=3.9.0' 'python-mutagen' 'libgexiv2' 'python-pymediainfo'
         'python-pillow' 'python-pypdf2' 'python-stopit')
options=('!emptydirs')
makedepends=('python-distutils-extra')
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('e87ab3fc803c2d0f7bee4bbbbf9074382469352774caeafc88a10b969097cf82')

package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  python ./setup.py install --prefix=/usr --root="${pkgdir}" \
                            --no-compile -O0
}
