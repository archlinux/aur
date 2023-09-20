# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=angie-njs-dns-git
pkgver=r57.3ed6d1e
pkgrel=1
pkgdesc="Sample Configuration for DNS over HTTPS (DoH/DoT gateway) and GSLB with angie"
arch=('any')
url="https://github.com/TuxInvader/nginx-dns"
license=('unknown')
depends=('angie')
makedepends=('git')
source=("nginx-dns::git+https://github.com/TuxInvader/nginx-dns.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/nginx-dns"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/nginx-dns"
  mkdir -p "${pkgdir}/etc/nginx"
  cp -r "njs.d" "${pkgdir}/etc/nginx/"
  cp -r "examples" "${pkgdir}/etc/nginx/nginx-njs-dns-examples"
}
