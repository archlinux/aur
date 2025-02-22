# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=walles
_pkgname=riff
pkgname=${_pkgname}-bin
pkgver=3.3.8
pkgrel=1
pkgdesc='A diff filter highlighting which line parts have changed'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64')
license=('MIT')
conflicts=("${_pkgname}" 'riffdiff')
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch[0]}-linux")
sha256sums=('8fe11bd57802035aa8be7cb7382edd1e5f7e53cc6d2ca078271b59b1f94bde26'
            '9d9d78d18ca3aac694d162a2a3f3a719c74f6ba105a33ffc0170c8ad0719a8f6')
sha256sums_x86_64=('fe4be634efa13adcb8c19374681d9c684737fad8722c2e336715a2137fa78307')


package() {
  cd "$srcdir/" || exit

  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}-linux" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
