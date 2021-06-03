# Maintainer: twa022 <twa022 at gmail dot com>

pkgname='nemo-pastebin'
pkgver=5.0.0
pkgrel=1
pkgdesc="Pastebin upload context menu in Nemo"
arch=('any')
license=('GPL2')
url="https://github.com/linuxmint/nemo-extensions"
depends=('pastebinit' 'nemo-python>=3.9.0')
optdepends=('libnotify')
makedepends=('python-distutils-extra')
options=('!emptydirs')
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('e9d0e592a8b8bc0a4f0eb5222994f522f0e255f5a0c86e8069933864e2ca7485')

package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  python ./setup.py install --prefix=/usr --root="${pkgdir}" \
                            --no-compile -O0
}
