pkgname=dude-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='A single-binary helper that discovers, previews and removes pacman orphans (prebuilt version)'
arch=('x86_64')
url='https://github.com/seeyebe/dude'
license=('MIT' 'Apache')
depends=()
optdepends=('libnotify: desktop notifications')
provides=('dude')
conflicts=('dude')
source=(
  "dude-x86_64.tar.gz::${url}/releases/download/v${pkgver}/dude-x86_64.tar.gz"
  "${url}/raw/v${pkgver}/hooks/dude.hook"
  "${url}/raw/v${pkgver}/LICENSE-MIT"
  "${url}/raw/v${pkgver}/LICENSE-APACHE"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  tar -xzf dude-x86_64.tar.gz
  install -Dm755 dude "$pkgdir/usr/bin/dude"
  install -Dm644 dude.hook "$pkgdir/usr/share/libalpm/hooks/dude.hook"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
