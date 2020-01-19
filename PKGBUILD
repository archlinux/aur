# Maintainer: Tobias Farrenkopf <aur[~ at ~]emptyset[~ dot ~]de>
pkgname=ob-yml-menu
pkgrel=1
pkgver=r5.53e374b
pkgdesc="Openbox yaml menu generator"
arch=('any')
url="https://github.com/shawn-ogg/ob-yml-menu"
license=('MIT')
depends=('python'  'python-yaml')
makedepends=('git')
source=("$pkgname"::'git+https://github.com/shawn-ogg/ob-yml-menu.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -D -m0755 ${srcdir}/${pkgname}/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -D -m0644 ${srcdir}/${pkgname}/README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -D -m0644 ${srcdir}/${pkgname}/example.yml ${pkgdir}/usr/share/doc/${pkgname}/example.yml
  install -D -m0644 ${srcdir}/${pkgname}/LICENSE ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
