# Maintainer: Ait contributors <https://github.com/ait-app/ait>

pkgname=aitd-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Ait headless daemon (prebuilt release)'
arch=('x86_64')
url='https://github.com/ait-app/ait'
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++' 'bash' 'git' 'ca-certificates' 'bubblewrap>=0.8.0')
optdepends=('openssh: SSH Git remotes' 'systemd: user service management')
provides=("aitd=${pkgver}")
conflicts=('aitd')
options=('!strip' '!debug')
source=(
  "${url}/releases/download/v${pkgver}/Ait-${pkgver}-daemon-linux-x64.tar.gz"
  'aitd.service'
)
sha256sums=(
  '8931ef149407b5a803bbb245679a5aa6064d807d0877e07bee19474a3bca399c'
  '8d4f2659b311dab569bfcd10542ea74bdc2d482ef1b36dca143e5edc2b493699'
)

package() {
  install -Dm755 "$srcdir/aitd" "$pkgdir/usr/bin/aitd"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/aitd.service" "$pkgdir/usr/lib/systemd/user/aitd.service"
}
