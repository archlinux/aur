# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=iredis-bin
pkgver=1.15.2
pkgrel=1
pkgdesc="A Terminal Client for Redis with AutoCompletion and Syntax Highlighting"
arch=('x86_64')
url='https://iredis.io'
license=("custom:${pkgname}")
options=(!debug)
provides=('iredis')
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/laixintao/iredis/releases/download/v${pkgver}/iredis.tar.gz"
        'LICENSE::https://raw.githubusercontent.com/laixintao/iredis/master/LICENSE')
sha256sums=('3c58269285c6745513698fe7d8d0abf6671ef1f7dcef748fb233bebfb089beec'
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
