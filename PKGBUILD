# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=kraanzu
_pkgname=dooit
pkgname=${_pkgname}-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="A todo manager that you didn't ask for, but needed!"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc')
makedepends=('tar')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/linux-${_pkgname}")
sha256sums=('33504ada23da37774e0d02d99a3a61328f3df017a2bf8468525cd30bb86f57ec'
            '674030742a89529e8616360e923d22df737816f0fccf25c53e4790f39294adbe')
sha256sums_x86_64=('2c078bd844d3b4b1b2ca56d894d739baa0aad5fa809246ec25ee932fd2b8e029')

package() {
  cd "$srcdir/"

  install -Dm755 "linux-${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
