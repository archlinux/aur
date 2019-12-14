# Maintainer: GI_Jack <GI_Jack@hackermail.com>
pkgname=ttf-ferrite-core-git
_pkgname=ttf-ferrite-core
pkgver=r14.132820d
pkgrel=1
pkgdesc="Ferrite Core display typeface by Froyo Tam"
arch=('any')
url="https://github.com/froyotam/ferrite-core/"
license=('Custom')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=
source=("${pkgname}::git+https://github.com/froyotam/ferrite-core.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-VCS}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname}"
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 fonts/FerriteCore-Regular.ttf "${pkgdir}/usr/share/fonts/TTF/FerriteCore-Regular.ttf"
}
