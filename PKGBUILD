# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gridea-bin
pkgver=0.9.2
pkgrel=1
pkgdesc="A static blog writing client"
arch=('x86_64')
url='https://gridea.dev'
license=('MIT')
provides=("${pkgname%-bin}")
depends=('gtk3'
         'libxss'
         'nss')
makedepends=('tar')
source=("${pkgname%-bin}-${pkgver}.deb::https://github.com/getgridea/gridea/releases/download/v${pkgver}/gridea_${pkgver}_amd64.deb"
        'LICENSE::https://github.com/getgridea/gridea/raw/master/LICENSE')
sha256sums=('807157305754475853aa5693d9a6bd21d5ee6538eb645a58ba79de525c1e35ba'
            'd5fd1669066ffaab84a9063cd2792ded7aca1f6f92a972f58ffb5173404b53d2')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}