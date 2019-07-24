# Last Maintainer: Anurag <anuragsingh3@outlook.com>
# Current Maintainer: Japorized <japorized@tuta.io>
_name=n30f
pkgname=${_name}-git
pkgver=2.0
pkgrel=2
pkgdesc='a quick hack to display a png in a borderless and transparent non-wm-managed window'
arch=('x86_64')
url="https://github.com/sdhand/n30f"
depends=('cairo' 'libxcb')
makedepends=('gcc')
license=('custom:BSD-3-Clause')
provides=('n30f')
conflicts=('n30f')
source=("${pkgname}::git+${url}.git")
md5sums=("SKIP")

build() {
  make -C "${srcdir}/${pkgname}"
}

package() {
  cd "${srcdir}/${pkgname}/"
  install -Dm 775 "${_name}" "${pkgdir}/usr/bin/${_name}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
