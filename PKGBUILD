# Maintainer: Javier Tia <floss@jetm.me>
_pkgauthor=chojs23
_pkgname=ec
pkgname=easy-conflict-bin
pkgver=0.3.1
pkgrel=1
pkgdesc='Terminal-native Git mergetool with 3-pane IntelliJ-like conflict resolver'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('git')
conflicts=('easy-conflict')
provides=('easy-conflict' 'ec')
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
source_aarch64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")
sha256sums=('2b9594f469f8c9681fc312d9afeea94461ca929e5e109edc08f3b7e90bc34e98'
            '91c5dd065509ed9532c97a6c1f30eb5c7f3537206283149b35f71f72d8673602')
sha256sums_x86_64=('6c86df360333ba576fe16c0fd5500e34d1b6e4e0b96faf7928f95e644af16ee2')
sha256sums_aarch64=('6c86df360333ba576fe16c0fd5500e34d1b6e4e0b96faf7928f95e644af16ee2')

package() {
  cd "$srcdir/" || exit

  install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim:set ft=PKGBUILD ts=2 sw=2 et:
