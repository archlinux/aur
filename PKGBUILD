# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=darrenldl
_pkgname=stramon
pkgname=${_pkgname}-bin
pkgver=0.3.2
pkgrel=1
pkgdesc='Process behavior monitoring utility and library based on strace'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgname}-${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}_${pkgver}::${url}/releases/download/${_pkgname}-${pkgver}/${_pkgname}"
        "LICENSE_${pkgver}::${_urlraw}/LICENSE"
        "README_${pkgver}::${_urlraw}/README.md"
        "CHANGELOG_${pkgver}::${_urlraw}/CHANGELOG.md")

sha256sums=('35c004d119364fe7da9f468747a660969e212e5543a553bc56b7cc60fbd04d84'
            '918e7f7aeac2a0e1f8557528c23499716b876bbc04700deb2cd17e0d345689be'
            'd6d05b68541d06fc177924133a416a9b7d9355075234cab242662f7c754e01e2'
            '02611e29635bb13b8b16a00e92551ef4fa99aecfb68d4f7cf791cfd1627ea624')

package() {
  cd "$srcdir/"

  install -Dm755 "${_pkgname}_${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE_${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "CHANGELOG_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
