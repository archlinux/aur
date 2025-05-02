# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=kraanzu
_pkgname=dooit
pkgname=${_pkgname}-bin
pkgver=3.1.0
pkgrel=2
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
            '795ff2bce675c7c69ae378c903925f9d1c9277bc9579e9b4b84423fc10772ec4')
sha256sums_x86_64=('d5755a9a7ef5ef8a3362796965c55eca16747bee98bd15ed2fef580792ff8dbb')

package() {
  cd "$srcdir/" || exit

  install -Dm755 "linux-${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
