# Maintainer: Phillip Schichtel <phillip@schich.tel>
# Contributor:	Jesse Jaara	<gmail.com: jesse.jaara>
# Contributor:	p2k		<uni-ulm.de: Patrick.Schneider>

pkgname=ktlint
pkgver=0.37.2
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
sha256sums=('1b301e7c6bd0b90f7541ec7ce118b497312bc5bcc37118ce33fe0571f7661ec2'
            'b45bdb3357e761d4b1300470833cf5e5e9fafc32a5f98efef214ba926b0120d5'
            'SKIP')

package() {
  cd "${srcdir}"

  install -D -m755 ktlint-${pkgver} "${pkgdir}/usr/bin/ktlint"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/ktlint/LICENSE"
}

