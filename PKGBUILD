# Maintainer: Bazyli Cyran <bazyli@cyran.dev>

_pkgname=timewall
pkgname="${_pkgname}-bin"
pkgver=2.1.0
pkgrel=1
pkgdesc='Apple dynamic HEIF wallpapers on GNU/Linux'
url='https://github.com/bcyran/timewall'
provides=('timewall')
conflicts=('timewall')
depends=('libheif')
license=('MIT')
arch=('x86_64')
source=("https://github.com/bcyran/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('b3ef6acaa6e35048a429d52a50d2703130a30010f23f6b43b2028b490e3350a3')

package() {
    install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
    install -Dm 644 "completions/${_pkgname}.bash" -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm 644 "completions/_${_pkgname}" -t "${pkgdir}/usr/share/zsh/site-functions"
    install -Dm 644 "completions/${_pkgname}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
    install -Dm 644 "timewall.service" -t "${pkgdir}/usr/lib/systemd/user"
}
