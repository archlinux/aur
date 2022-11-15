# Maintainer: robertfoster

pkgname=distrobox-git
pkgver=1.4.1.r735.acb36a4
pkgrel=1
pkgdesc="Use any linux distribution inside your terminal."
arch=('any')
url="https://github.com/89luca89/distrobox"
license=('GPL3')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
optdepends=(
  'docker: enable docker usage'
  'podman: enable podman usage'
)
source=("${pkgname%-git}::git+${url}")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s.r%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  ./install -P "${pkgdir}/usr"
}

sha256sums=('SKIP')
