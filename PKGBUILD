# Maintainer: Sosuke Inaba <mail[at]daizu[dot]dev>
# Contributor: Joakim Repomaa <aur@j.repomaa.com>

_pkgname=crystalline
pkgname=crystalline-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="A Language Server Protocol implementation for Crystal."
arch=("x86_64")
url="https://github.com/elbywan/crystalline/"
license=("MIT")
source=(
  "${_pkgname}-${pkgver}.gz::https://github.com/elbywan/crystalline/releases/download/v${pkgver}/crystalline_x86_64-unknown-linux-musl.gz"
  "LICENSE::https://raw.githubusercontent.com/elbywan/crystalline/master/LICENSE"
)
noextract=(LICENSE)

provides=(crystalline)
conflicts=(crystalline)

package() {
  cd "$srcdir"
  install -D -m 0755 crystalline-${pkgver} ${pkgdir}/usr/bin/crystalline
  install -D -m 0644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

sha512sums=('9170daabd4a9eb15cb8886d0a13b3009ccd2700bef5484935eccbc5b60dd325660aeb2f55f88247fec07107cecbf83fa6c9b5fc620d42725abdc13f8871cb53e'
            '81cab25a58a3e23f1548e7fcf11934cf6146af6a407292b4d043458da24803fe4c489f1f2a69d033623557eeaa2908efb26bf4750908e271b13e0406bc4203c7')
