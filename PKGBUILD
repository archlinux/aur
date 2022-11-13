# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=repoup
pkgver=0.1.0
pkgrel=1
pkgdesc="A git repository updater and manager"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=()
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '3f0dad993fd4e754e4b0c67da34b5a8479278deb51ef674bbbb0df61be90811ad336af966efdc0a837e1ba308e27f56dab50d09d677e0fda8719f2c621bd9294'
  '6f515b736f94f2732b7dd056061d64eb8958ac701bd3505dc69ddea75e9d03539dfcc57790d1ce2c3bb9d09e653c162d8c0d0e21c49ccb729631fc62d42df0f9'
  )
md5sums=(
  '91c46a72410a989da7b2938104a29d35'
  '03b7c1ba6966b0276869f60cff386e69'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 usr/share/repoup/repouprc "${pkgdir}${XDG_CONFIG_HOME:-$HOME/.config}/repoup/repouprc"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
