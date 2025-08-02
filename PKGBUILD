# Maintainer: Bazyli Cyran <bazyli@cyran.dev>

_pkgname=timewall
pkgname="${_pkgname}-bin"
pkgver=2.0.2
pkgrel=1
pkgdesc='Apple dynamic HEIF wallpapers on GNU/Linux'
url='https://github.com/bcyran/timewall'
provides=('timewall')
conflicts=('timewall')
depends=('libheif')
license=('MIT')
arch=('x86_64')
source=("https://github.com/bcyran/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('3e5301fbdadffe965ed93ec980d45411eaaa774429e62d8b067379f77267af20')

package() {
    install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
    install -Dm 644 "completions/${_pkgname}.bash" -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm 644 "completions/_${_pkgname}" -t "${pkgdir}/usr/share/zsh/site-functions"
    install -Dm 644 "completions/${_pkgname}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
    install -Dm 644 "timewall.service" -t "${pkgdir}/usr/lib/systemd/user"
}
