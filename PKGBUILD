# Maintainer: Phillip Schichtel <phillip@schich.tel>
# Contributor:	Jesse Jaara	<gmail.com: jesse.jaara>
# Contributor:	p2k		<uni-ulm.de: Patrick.Schneider>

pkgname=ktlint
pkgver=0.48.2
pkgrel=1
pkgdesc="An anti-bikeshedding Kotlin linter with built-in formatter"
arch=('any')
url="https://ktlint.github.io/"
license=('MIT')
depends=('java-runtime')
# See: https://github.com/pinterest/ktlint#installation
validpgpkeys=(ADBC987D1A7B91DB6B0AAA81995EFBF4A3D20BEB)
source=(ktlint-${pkgver}::https://github.com/pinterest/ktlint/releases/download/${pkgver}/ktlint
        https://raw.githubusercontent.com/pinterest/ktlint/${pkgver}/LICENSE
        ktlint-${pkgver}.asc::https://github.com/pinterest/ktlint/releases/download/${pkgver}/ktlint.asc)
sha256sums=('e0647f930f48583b35b7d52133119a3e5efdd9cf57384847bfe6241544fd0342'
            'b45bdb3357e761d4b1300470833cf5e5e9fafc32a5f98efef214ba926b0120d5'
            'SKIP')

package() {
  cd "${srcdir}"

  install -D -m755 ktlint-${pkgver} "${pkgdir}/usr/bin/ktlint"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/ktlint/LICENSE"
}

