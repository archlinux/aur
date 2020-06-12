# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=codespace
pkgver=1.2.0
pkgrel=1
pkgdesc="The code snippet manager you've been waiting for (Requires license key)"
arch=('x86_64')
url="https://codespace.app"
license=("custom:${codespace}")
depends=('gtk3'
         'libxss'
         'nss')
source=("${pkgname}-${pkgver}.tar.gz::https://codespace.app/download/latest"
        'LICENSE')
sha256sums=('15fde4b88fae49c870691d1d6b4e8d5c0d54958adc15087c12e09d0adff697c1'
            'SKIP')

package() {
  tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}"
  install -d "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /opt/Codespace/codespace "${pkgdir}/usr/bin"
}