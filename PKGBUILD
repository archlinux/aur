# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=walles
_pkgname=riff
pkgname=${_pkgname}diff-bin
pkgver=3.6.1
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
        "README-${pkgver}::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${_barch[0]}-linux")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${_barch[1]}-linux")
sha256sums=('8fe11bd57802035aa8be7cb7382edd1e5f7e53cc6d2ca078271b59b1f94bde26'
            'eb90777c642c349cb22ad78cffd57a13da2de7eea2bccdfe635084d497de7a48')
sha256sums_x86_64=('e3fc15a8119660f45f97c760a6c4701a3d4344140d125c2367d1c9a99cc483d6')
sha256sums_aarch64=('e6970bce4fe1d47204f6aee950eeca2f572d4936b95453860f7c72839b6e4ab3')


package() {
  cd "$srcdir/" || exit

  install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
