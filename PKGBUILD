# Maintainer: John Lane <archlinux at jelmail.com>

pkgname=aws-vault-bin
pkgver=5.3.2
pkgrel=1
pkgdesc="a tool to securely store and access AWS credentials in a development environment"
url="https://github.com/99designs/aws-vault"
conflicts=('aws-vault')
provides=('aws-vault')
license=('MIT')
arch=('x86_64')
source=(
  "https://raw.githubusercontent.com/99designs/aws-vault/v${pkgver}/LICENSE"
  "aws-vault-linux-amd64-${pkgver}::https://github.com/99designs/aws-vault/releases/download/v${pkgver}/aws-vault-linux-amd64"
)
sha256sums=('f57f886a33e0ae7b50093f19051e65edcd1fde7cde63caa6b1ba4254856f4e4f'
            'a537e1f4a2286cdf0c6c21dc41e64f30dc7e457ad5d8a21fbc9099bb7666c9c3')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m 755 "${srcdir}/${source[1]%%::*}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}

# vim:set ts=2 sw=2 et:
