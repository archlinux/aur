# Maintainer: Jerry Xiao <aur at mail.jerryxiao.cc>

_pkgbase=nginx-njs-dns
_srcname=nginx-dns
pkgname=${_pkgbase}-git
pkgver=r48.6afbf1b
pkgrel=1
pkgdesc="Sample Configuration for DNS over HTTPS (DoH/DoT gateway) and GSLB with NGINX"
arch=('any')
url="https://github.com/TuxInvader/nginx-dns"
license=('unknown')
depends=('nginx')
makedepends=('git')
source=("${_srcname}::git+https://github.com/TuxInvader/nginx-dns.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_srcname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_srcname}"
  mkdir -p "${pkgdir}/etc/nginx"
  cp -r "njs.d" "${pkgdir}/etc/nginx/"
  cp -r "examples" "${pkgdir}/etc/nginx/nginx-njs-dns-examples"
}
