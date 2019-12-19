# Maintainer: Trevor Facer <trevordf@protonmail.com>

pkgname=aliyun-cli-bin
pkgver=3.0.31
pkgrel=1
pkgdesc="A tool to manage and use Alibaba Cloud resources through a command line interface"
url="https://github.com/aliyun/aliyun-cli"

conflicts=('aliyun')
depends=('glibc')
provides=('aliyun')
license=('Apache')
arch=('x86_64')

source=(
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/aliyun/aliyun-cli/v${pkgver}/LICENSE"
  "aliyun-cli-linux-${pkgver}-amd64::https://github.com/aliyun/aliyun-cli/releases/download/v${pkgver}/aliyun-cli-linux-${pkgver}-amd64.tgz"
)

sha256sums=(
  '479818324be726e5596a2a9fb6fd9e5c5edfe2fa967dc69c23ff1bba707e84bb'
  '42511069a9115b0ede40cad29453364da1346ddc513f3f9be705ba59c8156083'
)

package() {
  tar xvf "aliyun-cli-linux-${pkgver}-amd64"
  install -D -m 644 "${srcdir}/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m 755 "aliyun" "${pkgdir}/usr/bin/${pkgname%-cli-bin}"
}

# vim:set ts=2 sw=2 et:
