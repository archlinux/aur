# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Will Alexander <archlinux dot org at willalexander dot me>

pkgname="sic"
pkgver=1.3
pkgrel=1
pkgdesc="An extremely simple IRC client"
url="https://tools.suckless.org/sic"
arch=('x86_64')
license=('MIT')
depends=('glibc')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://dl.suckless.org/tools/${_pkgsrc}.tar.gz")
b2sums=('40b4e11982f9bca2ad8904c1c17e9a302dde90f27bf486541db1746afa6f88b8947b8a61406708b014231a197e35bdd5d672f2335816fd3b658f1fc758a1efc0')

build() {
  cd "${srcdir}/${_pkgsrc}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make PREFIX='/usr' DESTDIR="${pkgdir}" install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README"  "${pkgdir}/usr/share/doc/${pkgname}/README"
}
