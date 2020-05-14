# Maintainer: twa022 <twa022 at gmail dot com>

pkgname='nemo-pastebin'
pkgver=4.6.0
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
sha256sums=('f656a65ebb4454180f5dcddbb063c14410f38125151e762fc695993685d64edd')

package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  python ./setup.py install --prefix=/usr --root="${pkgdir}" \
                            --no-compile -O0
}
