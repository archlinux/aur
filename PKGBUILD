# Maintainer: Jonathan Wright <jon@than.io>

_pkg=tflint
pkgname=${_pkg}-bin
pkgver=0.63.1
pkgrel=1
pkgdesc="A linter for Terraform code"
arch=('x86_64')
url="https://github.com/terraform-linters/${_pkg}"
license=('MPL-2.0' 'BUSL-1.1')
depends=('glibc')
makedepends=('zip')
conflicts=("${_pkg}")
provides=("${_pkg}")
source=(
  "LICENSE-MPL-2.0"
  "LICENSE-BUSL-1.1"
  "tflint_linux_amd64-${pkgver}.zip::${url}/releases/download/v${pkgver}/tflint_linux_amd64.zip"
)
sha512sums=('c1e3a0c8f5267fb5c0b65733bda037c62d914ed989bee0f510d8196b1029eec00d40f415ce1514a4996d420ba02d856d04db0915b64573ef4a36033cc5efb94e'
            'de6495df79045a8e609771286ef2f3d0dd1908e4d8f61de5816b3e490114c76c49f0b5acf653541f283117a396f2d8e0dc5419f09e5d94aeac50c9a6d5f21fa2'
            '7e2e0d476ba3974f2069c53a92bd76597a337fa0dd918123b9edd1cd91cbe5c5c1491b13396d81f824ae4c59807e08403922b99b656de5bb2360811bff928402')

package() {
  cd ${srcdir} || exit
  install -Dm755 ${_pkg} ${pkgdir}/usr/bin/${_pkg}
  install -Dm644 LICENSE-MPL-2.0 ${pkgdir}/usr/share/licenses/$pkgname/LICENSE-MPL-2.0
  install -Dm644 LICENSE-BUSL-1.1 ${pkgdir}/usr/share/licenses/$pkgname/LICENSE-BUSL-1.1
}
