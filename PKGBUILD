pkgname=preditor
pkgver=r5.ad8a550
pkgrel=1
pkgdesc='Minimal GTK3 image previewer with basic editing functions'
arch=('x86_64')
url='https://github.com/rabfulton/preditor'
license=('MIT')
depends=('gtk3' 'gdk-pixbuf2')
makedepends=('make' 'gcc' 'pkgconf' 'git')
source=("git+https://github.com/rabfulton/preditor.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  make release
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" install
}
