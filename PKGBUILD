# Maintainer : bipin kumar <kbipinkumar@pm.me>

pkgname=survivor
_pkgname=SURVIVOR
pkgver=1.0.6
pkgrel=1
pkgdesc='tool set for simulating/evaluating structural variations'
arch=('i686' 'x86_64')
url="https://github.com/fritzsedlazeck/SURVIVOR"
license=('MIT')
depends=('gcc-libs' 'glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fritzsedlazeck/SURVIVOR/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('506dab88a18bbf063fbab72097ae4e1be393b5e5dd632c30a247845c602d7c6a')

build() {
  cd ${_pkgname}-${pkgver}/Debug
  make
}

package() {
  cd ${_pkgname}-${pkgver}/Debug
  install -Dm755 SURVIVOR ${pkgdir}/usr/bin/SURVIVOR
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
