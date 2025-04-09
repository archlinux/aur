# Maintainer: Nai Erchou <naierchou@mail.ru>
pkgname=alpinejs-doc-git
pkgver=0.0.1
pkgrel=0
epoch=
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "docs-data-alpinejs" "docs-data-alpinejs-git")
pkgdesc="AlpineJs offline documentation viewer"
arch=('any')
url="https://gitverse.ru/naierchou/alpinejs-doc"
license=('MIT')
depends=('webappview-git')
makedepends=()
source=("git+https://gitverse.ru/naierchou/alpinejs-doc.git" "git+https://github.com/alpinejs/alpine.git")
sha256sums=("SKIP" "SKIP")

package() {
  PREFIX="/usr/local"
  cd "$srcdir/${pkgname%-git}"
  install -d ${pkgdir}/usr/share/applications
  install -d ${pkgdir}${PREFIX}/share/webappview/
  install -d ${pkgdir}${PREFIX}/share/webappview/markdown/alpinejs/
  cp -r $srcdir/alpine/packages/docs/src/* ${pkgdir}${PREFIX}/share/webappview/markdown/alpinejs/
  cp -r application/* ${pkgdir}${PREFIX}/share/webappview/
  cp -r shortcuts/* ${pkgdir}/usr/share/applications
}
