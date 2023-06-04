# Maintainer: Asseel Naji <asseel.naji96@gmail.com>
_pkgname='inso-linux'
_upkgname='Inso-Linux'
_corepkgname='insomnia'
_corever=2023.2.2
_pkgnameroot='inso'
pkgname="inso-bin"
pkgver=3.16.0
pkgrel=1
pkgdesc='Allows you to use Insomnia application functionality in your terminal and CI/CD environments for automation.'
arch=('x86_64')
url='https://insomnia.rest'
_url_source='https://github.com/Kong/insomnia'
license=('MIT')
depends=('libxss' 'nss' 'gtk3' 'alsa-lib')
optdepends=("libappindicator-gtk3: StatusNotifierItem support"
    "xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_url_source}/releases/download/lib@${pkgver}/${_pkgname}-${pkgver}.tar.xz"
    "${_url_source}/raw/core@${_corever}/LICENSE")
sha256sums=('d20435cd95c80acac8894124ff7a79ea199395cf48329bdf171803b84a7d4a63'
    'cc91b5641bbbf592a69ca5f7b45807efba470068e815fc7682a42022bbd3cbb9')

package() {
    tar -xvf "${_pkgname}-${pkgver}.tar.xz" -C "${pkgdir}"
    # install -Dm755 "${_pkgnameroot}" "$pkgdir/usr/bin/${_pkgnameroot}" # working
    install -Dm755 "${_pkgnameroot}" "$pkgdir/opt/$_corepkgname/${_pkgnameroot}" # working
    # ln -sfv "$pkgdir/opt/$_corepkgname/${_pkgnameroot}" -T "${pkgdir/usr/bin/${_pkgnameroot}" # working
    # # rm -rf "${pkgdir}/usr/share/doc"
    # # install -dv "${pkgdir}/opt/${_corepkgname}"
    # # install -Dm755 "${_pkgnameroot}" -T "${pkgdir}/opt/${_corepkgname}/${_pkgnameroot}"
    # # mkdir -p "${pkgdir}/usr/bin"
    # # ln -sfv "${pkgdir}/opt/${_corepkgname}/${_pkgnameroot}" -T "${pkgdir}/usr/bin/${_pkgnameroot}"
    # # install -Dvm644 "/opt/${_corepkgname}/" -t "/usr/share/licenses/${_corepkgname}"
    # # install -Dvm644 LICENSE "/usr/share/licenses/${_corepkgname}/LICENSE"
}
