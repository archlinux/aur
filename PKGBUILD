# Maintainer: Pierre Carru <pierre@carru.fr>
# based on dstat package

pkgname=dool-git
_pkgname=dool
pkgver=r562.6b89f2d
pkgrel=1
pkgdesc="A versatile resource statistics tool"
arch=('any')
url="https://github.com/scottchiefbaker/dool"
license=('GPL')
depends=('python' 'python-six')
provides=('dool')
conflicts=('dool')
#source=(https://github.com/scottchiefbaker/dool/archive/master.tar.gz)
#sha512sums=(SKIP)
source=("${pkgname%-*}::git+https://github.com/scottchiefbaker/dool.git")
sha512sums=(SKIP)

pkgver() {
  cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir" install
}
