# Maintainer: jetm <floss at jetm.me>
# Old Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=walles
_pkgname=riff
pkgname=${_pkgname}-bin
pkgver=3.5.1
pkgrel=2
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
            'eb90777c642c349cb22ad78cffd57a13da2de7eea2bccdfe635084d497de7a48')
sha256sums_x86_64=('a06451f7860ee44f863cbba4b74ab5d0fdbfe22d8408a0c58e93fd1a650c4c60')


package() {
  cd "$srcdir/" || exit

  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}-linux" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
