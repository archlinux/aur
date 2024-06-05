# Maintainer: Docler <hello@docler.me>
# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgname=fvm-bin
pkgver=3.1.7
pkgrel=1
pkgdesc="Flutter Version Management: A simple CLI to manage Flutter SDK versions"
arch=('x86_64')
url="https://github.com/leoafarias/fvm"
license=('MIT')
depends=('bash' 'git' 'glibc' 'unzip')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${url}/releases/download/${pkgver}/fvm-${pkgver}-linux-x64.tar.gz"
        "${pkgname}.sh")
sha256sums=('b3e700e414345caa3cd6d5e68cf00113fd7971643e7c828f45f3ac98fab35e09'
            'eafcf25a0db7cc51f242fea20bd0d3e83060d5abfefb16146c7862b74e6c3893')

package() {
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm755 -t "${pkgdir}/opt/${pkgname}" fvm/src/dart
  install -Dm644 -t "${pkgdir}/opt/${pkgname}" fvm/src/fvm.snapshot
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" fvm/src/LICENSE
}
