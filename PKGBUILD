# Maintainer: mocihan <ly50247@126.com>
pkgname=just-bin
_realname=just
pkgver=0.6.1
pkgrel=1
pkgdesc="A handy way to save and run project-specific commands"
arch=("x86_64")
url="https://github.com/casey/${_realname}"
license=("custom:CC0")
depends=("gcc-libs")
provides=("just")
conflicts=("just")
source=("https://github.com/casey/${_realname}/releases/download/v${pkgver}/${_realname}-v${pkgver}-${arch}-unknown-linux-musl.tar.gz")
sha256sums=("9f22294fd0b130ef924a37403e761ea8e26d627bca8c8bb6010089af82e96400")

package() {
  cd "${srcdir}"
  install -Dm755 "${_realname}" "${pkgdir}/usr/bin/${_realname}"
  install -Dm644 "${_realname}.1" "${pkgdir}/usr/share/man/man1/${_realname}.1"
  install -Dm644 GRAMMAR.md "${pkgdir}/usr/share/doc/${_realname}/GRAMMAR.md"
  install -Dm644 README.adoc "${pkgdir}/usr/share/doc/${_realname}/README.adoc"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_realname}/LICENSE"
}
