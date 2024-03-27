# Maintainer: Docler <hello@docler.me>

pkgname=fvm-bin
pkgver=3.1.3
pkgrel=1
pkgdesc="Flutter Version Management: A simple CLI to manage Flutter SDK versions"
arch=('x86_64')
url="https://github.com/leoafarias/fvm"
license=('MIT')
depends=('bash' 'glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${url}/releases/download/${pkgver}/fvm-${pkgver}-linux-x64.tar.gz"
        "${pkgname}.sh")
sha256sums=('a86aa8f218c9463c37c63db60c748a7816d40e6a600e75ba670fd264c82c985f'
            'a4b23cdb2a96907fc9c1ca041baa6e440e7a91b1af9749974a105c2b5ead7a5b')

package() {
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/fvm"
  install -Dm755 -t "${pkgdir}/opt/${pkgname}" fvm/src/dart
  install -Dm644 -t "${pkgdir}/opt/${pkgname}" fvm/src/fvm.snapshot
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" fvm/src/LICENSE
}
