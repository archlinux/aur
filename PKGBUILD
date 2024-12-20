# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

pkgname=gitql-bin
_pkgname=${pkgname%-bin}
pkgver=2.3.1
pkgrel=1
pkgdesc='A git query language'
arch=('x86_64' 'i386')
url="https://github.com/filhodanuvem/gitql"
license=('MIT')
provides=('gitql' 'git-ql')
depends=('glibc')
source_x86_64=("${pkgname}-${arch[0]}-${pkgver}.tar.gz::https://github.com/filhodanuvem/gitql/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_${arch[0]}.tar.gz")
source_i386=("${pkgname}-${arch[1]}-${pkgver}.tar.gz::https://github.com/filhodanuvem/gitql/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_${arch[1]}.tar.gz")
sha256sums_x86_64=('d3700db2fcdf7a2d392ee015a74c8c70edc2fd148505343aea251c353d6c1790')
sha256sums_i386=('e3754c9f66b72dd443682436c2fdfd60b9a3ab592dec5a4e77a1eef31423543b')

package() {
  install -Dm755 gitql "${pkgdir}/usr/bin/gitql"

  ln -rsf "$pkgdir/usr/bin/gitql" "$pkgdir/usr/bin/git-ql"

  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
