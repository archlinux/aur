# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=iredis-bin
pkgver=1.4.3
pkgrel=1
pkgdesc="Interactive Redis: A Terminal Client for Redis with AutoCompletion and Syntax Highlighting"
arch=('any')
url='https://iredis.io'
license=('custom')
provides=('iredis')
noextract=("iredis.tar.gz")
source=("https://github.com/laixintao/iredis/releases/download/v${pkgver}/iredis.tar.gz"
        'LICENSE')
md5sums=('6d77f6ce1025a63a43f7c7321476953d'
         'b4a154b21cf1866729383356f640b247')

package() {
  mkdir -p ${pkgdir}/usr/lib/iredis
  mkdir -p ${pkgdir}/usr/bin
  tar xvf iredis.tar.gz -C ${pkgdir}/usr/lib/iredis
  ln -s /usr/lib/iredis/iredis ${pkgdir}/usr/bin
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/iredis/LICENSE
}