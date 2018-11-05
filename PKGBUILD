# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=nemo-emblems
pkgver=4.0.0
pkgrel=1
pkgdesc="Nemo file emblems extension"
arch=('any')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL3')
depends=('nemo-python>=3.9.0')
makedepends=('python-distutils-extra')
options=('!libtool' '!emptydirs')
install="$pkgname".install
#source=("${pkgname}-${pkgver}.tar.gz::http://packages.linuxmint.com/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver}.tar.gz")
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('4bee7336554fd3c6e87371bc4683e5bee989a67030582b89a050aad5874a04de')

package() {
  #cd ${pkgname}-${pkgver}+${_mintrel}
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  python ./setup.py install --prefix=/usr --root="${pkgdir}" \
                            --no-compile -O0
}
