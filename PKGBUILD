# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=iredis-bin
pkgver=1.6.2
pkgrel=1
pkgdesc="Interactive Redis: A Terminal Client for Redis with AutoCompletion and Syntax Highlighting"
arch=('x86_64')
url='https://iredis.io'
license=('custom')
provides=('iredis')
depends=('bash' 'python')
noextract=("${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/laixintao/iredis/releases/download/v${pkgver}/iredis.tar.gz"
        'LICENSE::https://raw.githubusercontent.com/laixintao/iredis/master/LICENSE')
sha256sums=('c8cd859ddae622bc24668ca7e1f52c75f978e92f0408210c6eee3078bf8a39f8'
         '489222c8a4a5b237aa3c72b7f3a13cad3281b1c261d3242522ee4de6c4c7c1be')

package() {
  mkdir -p ${pkgdir}/usr/lib/iredis
  mkdir -p ${pkgdir}/usr/bin
  tar xvf ${pkgname}-${pkgver}.tar.gz -C ${pkgdir}/usr/lib/iredis
  chown -R root:root ${pkgdir}/usr/lib/iredis
  chmod 755 ${pkgdir}/usr/lib/iredis/iredis
  ln -s /usr/lib/iredis/iredis ${pkgdir}/usr/bin
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/iredis-bin/LICENSE
}