# Maintainer: Christian Kühn (damachine3 at proton dot me)

_pkgbase=tkginstaller
pkgname=${_pkgbase}-git
pkgver=0.60.5.r401.g74f203e
pkgrel=1
_commit=74f203ec968f94af2db0dd34bfac392a5bc60d45
provides=("${_pkgbase}=${pkgver}")
conflicts=("${_pkgbase}")
pkgdesc="Build & install Frogging-Family stuff with ease"
arch=('any')
url="https://github.com/damachine/${_pkgbase}"
license=('MIT')
depends=(
    'bash'
    'curl'
    'fzf'
    'git'
)
optdepends=(
    'bat: syntax-highlighted config and log previews'
    'glow: rendered Markdown previews'
    'nano: fallback configuration editor'
    'onefetch: repository summaries'
    'wdiff: word-based configuration comparisons'
)
install=tkginstaller.install
source=(
    "${_pkgbase}-${pkgver}::https://raw.githubusercontent.com/damachine/${_pkgbase}/${_commit}/${_pkgbase}"
    "${_pkgbase}.bash::https://raw.githubusercontent.com/damachine/${_pkgbase}/${_commit}/completions/${_pkgbase}.bash"
    "_${_pkgbase}::https://raw.githubusercontent.com/damachine/${_pkgbase}/${_commit}/completions/_${_pkgbase}"
)
sha256sums=(
    'e7cd5e3b224e81460d6c73a638f7ef5da2ee9fc31b6b1b2d4d5b1ff1a3c4f12f'
    'b131047c9dccfda5a06365305ffab99c881950cdc7a92c5cf5b5de19c878aaa8'
    '098b7c4c9c490ef3abe99cb2ac3c6c6aa531d1508207a06adc8ffa49615a81b6'
)

package() {
    install -Dm755 "${srcdir}/${_pkgbase}-${pkgver}" "${pkgdir}/usr/bin/${_pkgbase}"
    install -Dm644 "${srcdir}/${_pkgbase}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgbase}.bash"
    install -Dm644 "${srcdir}/_${_pkgbase}" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgbase}"
}
