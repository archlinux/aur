pkgname=fancylock-bin
pkgver=0.0.8
pkgrel=1
arch=('x86_64')
url="https://github.com/tuxx/fancylock"
license=('MIT')
depends=('mpv' 'pam')
provides=('fancylock')
options=('!debug')
conflicts=('fancylock')
source=(
  "https://github.com/tuxx/fancylock/releases/download/v${pkgver}/fancylock-linux-amd64.tar.gz"
  "https://raw.githubusercontent.com/tuxx/fancylock/refs/heads/master/pam.d/fancylock"
)
sha256sums=('SKIP' 'SKIP')

package() {
  install -Dm755 fancylock-linux-amd64 "$pkgdir/usr/bin/fancylock"
  install -Dm644 fancylock "$pkgdir/etc/pam.d/fancylock"
}
