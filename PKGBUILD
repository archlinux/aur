# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=python2-pdforg-git
pkgver=0.0.0
pkgrel=2
pkgdesc="Only something jdmundrawala slapped together to store his pdfs"
arch=('any')
url="https://github.com/jdmundrawala/pdforg"
license=('unknown')
depends=('python2' 'python2-flask' 'python2-pymongo' 'python2-whoosh')
makedepends=('git')
provides=('python2-pdforg')
conflicts=('python2-pdforg')
options=(!emptydirs)
source=("${pkgname}::git+https://github.com/jdmundrawala/pdforg.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname}"
  #python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/opt"
  cp -r app "$pkgdir/opt/pdforg"
}

# vim:set ts=2 sw=2 et:
