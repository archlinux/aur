# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jdx
_pkgname=chim
pkgname=${_pkgname}-bin
pkgver=1.1.2
pkgrel=1
pkgdesc='Cross-platform binary shims with optional remote fetching'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x64.tar.xz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.tar.xz")
sha512sums_x86_64=('765973e3cc820b9fd216be365a8e6b280fd46b5bc6184fcc71e3774b4bc9fc8e433a6628de662984337818a6af3a4ac7e0da870c0e2e73872fa7885506b4d779')
sha512sums_aarch64=('e8ccf40417972f93161363cc00855d2e2456d0650a878b74bbb7bc40bcccf4e896e7ea8a2cd09335c818f68176ef4f3628acf7f937f26a28bb044865129b4a1a')

package() {
  cd "${srcdir}/"

  install -Dm755 ${_pkgname}/bin/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}

  install -Dm644 ${_pkgname}/README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
}
