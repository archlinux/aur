# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=walles
_pkgname=riff
pkgname=${_pkgname}diff-bin
pkgver=3.6.2
pkgrel=1
pkgdesc='A diff filter highlighting which line parts have changed'

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

license=('MIT')

conflicts=("${_pkgname}" "${_pkgname}-bin" "${pkgname%%-bin}")
replaces=("${_pkgname}-bin")
provides=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${_barch[0]}-linux")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${_barch[1]}-linux")
sha256sums=('8fe11bd57802035aa8be7cb7382edd1e5f7e53cc6d2ca078271b59b1f94bde26'
            'fa622f9a15b96f5aebb65de430287cfaecb1bfd4ecae6ab5ce6b457c5964a307')
sha256sums_x86_64=('f9c6cf02023b76182c9a9638916217054f4e9cf5a0b46b208f7ab96f6f8aa2e3')
sha256sums_aarch64=('8732887eafd4913131a8afe5c78330afb5acf701a166b27e8ab2f9f2d2c931c2')


package() {
  cd "$srcdir/" || exit

  install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
