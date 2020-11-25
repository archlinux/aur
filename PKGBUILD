# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=codespace
pkgver=1.4.0
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
sha256sums=('3cd6dbcc3f57bd264099278da3348095194da997650817c71f9642db7cd90d16'
            '5664f8fcdf3e2b3c3f8a70d573aea65bed01c815a5971ff24e97e9cc3717ec6d')

package() {
  tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}"
  install -d "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /opt/Codespace/codespace "${pkgdir}/usr/bin"
}
