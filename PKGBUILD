# Maintainer: Mansour Behabadi <mansour@oxplot.com>

pkgname=svglinkify-git
_pkgname=svglinkify
pkgver=r8.2a2f4bc
pkgrel=1
pkgdesc='Export inkscape SVGs to PDF while preserving hyperlinks.'
arch=('any')
url='https://github.com/oxplot/svglinkify'
license=('MIT')
depends=('qpdf>=11.1.1' 'inkscape>=1.2.1')
source=("git+https://github.com/oxplot/svglinkify.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/svglinkify"
  echo "r$(git rev-list --count HEAD).$(git describe --always)"
}

package()
{
  cd "${srcdir}/svglinkify"
  install -D svglinkify.py "${pkgdir}/usr/bin/svglinkify"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
