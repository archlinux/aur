# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=iredis-bin
pkgver=1.12.1
pkgrel=1
pkgdesc="A Terminal Client for Redis with AutoCompletion and Syntax Highlighting"
arch=('x86_64')
url='https://iredis.io'
license=("custom:${pkgname}")
provides=('iredis')
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/laixintao/iredis/releases/download/v${pkgver}/iredis.tar.gz"
        'LICENSE::https://raw.githubusercontent.com/laixintao/iredis/master/LICENSE')
sha256sums=('f99c09df13d524b3f285742b2a2d0fc372ddf1efa24287fe57831af347f6fb28'
            '9ac86d6afe88fc3a333a642b97b5e7219eaca704157cc4ab82de2f4f9eddfa7f')

package() {
  mkdir -p ${pkgdir}/usr/lib/iredis
  mkdir -p ${pkgdir}/usr/bin
  tar xvf ${pkgname}-${pkgver}.tar.gz -C ${pkgdir}/usr/lib/iredis
  chown -R root:root ${pkgdir}/usr/lib/iredis
  chmod 755 ${pkgdir}/usr/lib/iredis/iredis
  ln -s /usr/lib/iredis/iredis ${pkgdir}/usr/bin
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/iredis-bin/LICENSE
}
