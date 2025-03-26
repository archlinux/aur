# Maintainer: Rin <icealtria at gmail dot com>

pkgname='tlm-bin'
pkgdesc='Local CLI Copilot, powered by Ollama.'
pkgver='1.2'
pkgrel='2'
arch=('x86_64')
url='https://github.com/yusufcanb/tlm'
license=('Apache-2.0')
conflicts=('tlm')
depends=('glibc')
optdepends=('ollama: ollama required, can be on another machine.')
source=(
  "https://github.com/yusufcanb/tlm/releases/download/${pkgver}/tlm_${pkgver}_linux_amd64"
  "https://raw.githubusercontent.com/yusufcanb/tlm/main/LICENSE"
)
b2sums=('d597916fbc6f851b0de70d439c086491cb44aae8a12870b1d4fa0bf9ed049e90e12c93309deb2bb6aadcba6616c51f8e647a9826775e25143b0b7f3c77531b7f'
        '81427994d6874368b33fcf2346d61cc26e49b701816fb7044f5fa7872190cc39e0ead226733544faa34224438a558fd35dc420344aa4289331c7a4dcc3d2b49f')

package() {
  install -Dm755 "$srcdir/tlm_${pkgver}_linux_amd64" "$pkgdir/usr/bin/tlm"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

