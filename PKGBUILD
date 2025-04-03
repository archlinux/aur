pkgname=fancylock-bin
pkgver=0.0.9
pkgrel=1
arch=('x86_64')
url="https://github.com/tuxx/fancylock"
license=('MIT')
depends=('mpv' 'pam')
provides=('fancylock')
options=('!debug')
conflicts=('fancylock')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/tuxx/fancylock/releases/download/v${pkgver}/fancylock-linux-amd64.tar.gz"
  "https://raw.githubusercontent.com/tuxx/fancylock/refs/heads/master/pam.d/fancylock"
)

sha256sums=('SKIP' 'SKIP')

prepare() {
  # Remove any old cached tarball with a generic name that could be outdated
  rm -f "${srcdir}/fancylock-linux-amd64.tar.gz"
}

package() {
  install -Dm755 fancylock-linux-amd64 "$pkgdir/usr/bin/fancylock"
  install -Dm644 fancylock "$pkgdir/etc/pam.d/fancylock"
}
