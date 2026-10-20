# Maintainer: Francesco Persico <francesco.persico@gmail.com>
# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=nodenv-node-build
pkgver=5.4.59
pkgrel=1
pkgdesc='Install NodeJS versions'
arch=('any')
url='https://github.com/nodenv/node-build'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/nodenv/node-build/refs/tags/v${pkgver}/LICENSE")
sha256sums=('3a7b65b44c51e2be0a368e26aa9246b37ae07dcd48d5b3acbc4d3c0e21d515cc'
            '8549b8425f7e169ea9bd6bd02f3c97f57a74792609485b0c868bb53d5bf0cb9d')
conflicts=("${pkgname}-git"
           "node-build")

package() {
  install -Dm644 "${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${srcdir}/node-build-${pkgver}"
  PREFIX="${pkgdir}/usr" ./install.sh
}
