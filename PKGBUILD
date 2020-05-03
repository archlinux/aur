# Maintainer: Jay Ta'ala <jay@jaytaala.com>
# contributor: Niek den Breeje <n.j.den.breeje@gmail.com>
pkgname=base16-manager-git
_pkgname=base16-manager
pkgver=r168.b4d5615
pkgrel=2
pkgdesc='A command line tool to install base16 templates and set themes globally.'
arch=('any')
url='https://github.com/AuditeMarlow/base16-manager'
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('bash' 'git')
makedepends=('git')
source=("$pkgname::git+https://github.com/AuditeMarlow/base16-manager.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  mkdir -p "${pkgdir}/usr/bin"
  install -D -m755 ./base16-manager "${pkgdir}/usr/bin/$_pkgname"
}
