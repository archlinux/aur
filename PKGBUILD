# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=sshcommand
pkgver=0.20.2
pkgrel=2
pkgdesc='Turn SSH into a thin client specifically for your app'
arch=('x86_64')
url='https://github.com/dokku/sshcommand'
license=('MIT')
depends=(
  'jq'
  'openssh'
)
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname}"
        "${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/dokku/sshcommand/refs/tags/v${pkgver}/LICENSE")
sha256sums=('15e247b30b3d113f0fda829b019c0d525cdc1679e3b625200718d834562875dc'
            'b1ac2fed5ac269fb7bbf651a3d37ef5fd56d2c33320e17cb6e23a22a93f5c046')

package() {
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 ${pkgname}-${pkgver}-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
