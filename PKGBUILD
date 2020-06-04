# Maintainer: Phillip Schichtel <phillip@schich.tel>
# Contributor:	Jesse Jaara	<gmail.com: jesse.jaara>
# Contributor:	p2k		<uni-ulm.de: Patrick.Schneider>

pkgname=ktlint
pkgver=0.37.0
pkgrel=1
pkgdesc="An anti-bikeshedding Kotlin linter with built-in formatter"
arch=('any')
url="https://ktlint.github.io/"
license=('MIT')
depends=('java-runtime')
validpgpkeys=(A2570288E10932263E8326CBAA49C633B4734832)
source=(ktlint-${pkgver}::https://github.com/pinterest/ktlint/releases/download/${pkgver}/ktlint
        https://raw.githubusercontent.com/pinterest/ktlint/${pkgver}/LICENSE
        ktlint-${pkgver}.asc::https://github.com/pinterest/ktlint/releases/download/${pkgver}/ktlint.asc)
sha256sums=('ee4a95021bc4c248169fec0633264fa2b8dc1520a62772d04b32879f19dc50fc'
            'b45bdb3357e761d4b1300470833cf5e5e9fafc32a5f98efef214ba926b0120d5'
            'SKIP')

package() {
  cd "${srcdir}"

  install -D -m755 ktlint-${pkgver} "${pkgdir}/usr/bin/ktlint"
  install -D -m644 LICENSE "${pkgdir}/usr/share/license/ktlint/LICENSE"
}

