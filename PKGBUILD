# Maintainer: twa022 <twa022 at gmail dot com>

pkgname='nemo-pastebin'
pkgver=4.4.0
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
sha256sums=('97b4f8614ec403fa550cc9af7adf6518cd11fd8377cb535f3eecb88239588dd7')

package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  python ./setup.py install --prefix=/usr --root="${pkgdir}" \
                            --no-compile -O0
}
