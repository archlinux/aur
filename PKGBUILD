# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname=wm3con-git
pkgver=11.e49f47a
pkgrel=1
pkgdesc="F-Secure Virus World Map Console Edition"
arch=('any')
url="https://github.com/shibumi/wm3con"
license=('MIT')
depends=('python2')
makedepends=('git')
source=('git+http://github.com/shibumi/wm3con')
md5sums=('SKIP')

pkgver() {
  cd wm3con
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  install -D -m755 "${srcdir}/wm3con/wm3con.py" \
    "${pkgdir}/usr/bin/wm3con"
  
  install -D -m644 "${srcdir}/wm3con/map-world-01.txt" \
    "${pkgdir}/usr/share/wm3con/map-world-01.txt"

  install -D -m644 "${srcdir}/wm3con/README.md" \
    "${pkgdir}/usr/share/wm3con/README.md"

  install -D -m644 "${srcdir}/wm3con/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/wm3con/LICENSE.txt"

  install -D -m644 "${srcdir}/wm3con/screenshot01.jpg" \
    "${pkgdir}/usr/share/wm3con/screenshot01.jpg"
}


# vim:set ts=2 sts=2 sw=2 et
