# Maintainer: maoyaotang <292898660@qq.com>

pkgname=otf-noto-full
_pkgname=otf-noto-Regular
pkgver=24.9.1.r2.ged6d582
pkgrel=1
pkgdesc='Noto Fonts for all languages'
arch=('any')
url='https://fonts.google.com/noto'
license=('Apache-2.0')
provides=('Noto')
source=("git+https://github.com/maoyaotang12/otf-noto-Regular.git")
sha256sums=('SKIP')
pkgver() {
    cd $_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

package() {
  cd "${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  rm -r LICENSE README.md
  install -dm 755 "${pkgdir}/usr/share/fonts/noto"
  cp -r * "${pkgdir}/usr/share/fonts/noto"
}
