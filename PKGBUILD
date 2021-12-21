# Maintainer: Francesco Persico <francesco.persico@gmail.com>
# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=nodenv-node-build
pkgver=4.9.64
pkgrel=1
pkgdesc='Install NodeJS versions'
arch=('any')
url='https://github.com/nodenv/node-build'
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/nodenv/node-build/master/LICENSE")
sha256sums=('b1ca76a3f95b140344cae747e3fc16af7c64d9698f8bb30a753d46b3e3923531'
            '8549b8425f7e169ea9bd6bd02f3c97f57a74792609485b0c868bb53d5bf0cb9d')
conflicts=("${pkgname}-git"
           "node-build")

package() {
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${srcdir}/node-build-${pkgver}"
  PREFIX="${pkgdir}/usr" ./install.sh
}
