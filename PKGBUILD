# Maintainer: Javier Tia <floss@jetm.me>
_pkgauthor=chojs23
_pkgname=ec
pkgname=easy-conflict-bin
pkgver=0.3.3
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
            '55fddbfd83d3e43d3dd747f6f28820e47dc37444485b846900e461e4d18d46ac')
sha256sums_x86_64=('ef2a1078f7d34363248f0cecb37020cda58f0676d3b6f1e43a456efe601abcfb')
sha256sums_aarch64=('ef2a1078f7d34363248f0cecb37020cda58f0676d3b6f1e43a456efe601abcfb')

package() {
  cd "$srcdir/" || exit

  install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim:set ft=PKGBUILD ts=2 sw=2 et:
