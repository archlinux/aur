# Maintainer: yuzujr <15568103056@163.com>

pkgname=ani2xcursor-bin
_pkgname=ani2xcursor
pkgver=1.3.1
pkgrel=1
pkgdesc="Convert Windows animated cursor themes to Linux Xcursor format (prebuilt binary)"
arch=('x86_64')
url="https://github.com/yuzujr/ani2xcursor"
license=('MIT')
depends=('glibc')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-v${pkgver}-linux-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('b0817f58a693607230d5532c73dfd243a1418d7c8380b000711761291616d03a')

package() {
  cd "$srcdir"

  install -Dm755 ani2xcursor \
    "${pkgdir}/usr/bin/ani2xcursor"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 completions/fish/ani2xcursor.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/ani2xcursor.fish"

  install -Dm644 completions/bash/ani2xcursor \
    "$pkgdir/usr/share/bash-completion/completions/ani2xcursor"

  install -Dm644 completions/zsh/_ani2xcursor \
    "$pkgdir/usr/share/zsh/site-functions/_ani2xcursor"
}
