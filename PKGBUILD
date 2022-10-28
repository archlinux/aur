# Maintainer: Bazyli Cyran <bazyli@cyran.dev>

_pkgname=timewall
pkgname="${_pkgname}-bin"
pkgver=0.2.0
pkgrel=1
pkgdesc='Apple dynamic HEIF wallpapers on GNU/Linux'
url='https://github.com/bcyran/timewall'
provides=('timewall')
conflicts=('timewall')
depends=('libheif')
license=('MIT')
arch=('x86_64')
source=("https://github.com/bcyran/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('eff226475656f0c91e521539f34fa288db8650a7f41807d221d0baed1f701d7a')

package() {
    install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
    install -Dm 644 "completions/${_pkgname}.bash" -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm 644 "completions/_${_pkgname}" -t "${pkgdir}/usr/share/zsh/site-functions"
    install -Dm 644 "completions/${_pkgname}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
}
