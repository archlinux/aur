# Maintainer: Luke Featherston <lukefeatherston1223 at gmail dot com>
_pkgname=siji
_commit=14e7da94de514c3ada6a2b250ae3a1e76cb6c94f
pkgname="${_pkgname}-ttf"
pkgver=r22.14e7da9
pkgrel=1
pkgdesc='Siji bitmap font with scalable ttf version'
provides=("${_pkgname}")
conflicts=("${_pkgname}")
arch=('any')
url="https://github.com/fauno/${_pkgname}"
license=('GPLv2')
optdepends=('xorg-xfd: use view.sh script to view glyphs' 'font-manager: alternate way to view glyphs')
makedepends=('git')
source=("${pkgname}-${pkgver}::git+https://github.com/fauno/siji/#commit=${_commit}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 ttf/${_pkgname}.ttf "${pkgdir}/usr/share/fonts/misc/${_pkgname}.ttf"
  install -Dm644 bdf/${_pkgname}.bdf "${pkgdir}/usr/share/fonts/misc/${_pkgname}.bdf"
  install -Dm755 view.sh "${pkgdir}/usr/share/${_pkgname}/view.sh"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
