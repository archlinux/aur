# Maintainer: Kristyan Carvalho <kristyancarvalho@hotmail.com>
pkgname=brmgen
pkgver=0.5.1
pkgrel=1
pkgdesc='Generate editable brModelo conceptual and logical models from YAML or JSON'
arch=('any')
url='https://github.com/kristyancarvalho/brmgen'
license=('MIT')
depends=('java-runtime>=21')
source=(
  "brmgen-${pkgver}.tar::${url}/releases/download/v${pkgver}/brmgen-${pkgver}.tar"
  "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
)
sha256sums=(
  '29c1f8285259a472b9c843ace459c00834d47b35a8db546a5af1ee8824f985b9'
  'fb6b85af7158d2f3b5784a3ee0113bbdc94371c681518acb7bb66cf806a1f472'
)

package() {
  cd "brmgen-${pkgver}"
  install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/brmgen/bin" "$pkgdir/usr/share/brmgen/lib"
  install -m755 bin/brmgen "$pkgdir/usr/share/brmgen/bin/brmgen"
  cp -a lib/. "$pkgdir/usr/share/brmgen/lib/"
  ln -s /usr/share/brmgen/bin/brmgen "$pkgdir/usr/bin/brmgen"
  install -Dm644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/brmgen/LICENSE"
}
