# Maintainer: Christian Kühn (damachine3 at proton dot me)

_pkgbase=tkginstaller
pkgname=${_pkgbase}-git
pkgver=0.60.3.r398.gfc304cc
pkgrel=1
_commit=fc304cc7f27d3ea5962da57073afe1561e210dd8
provides=("${_pkgbase}=${pkgver}")
conflicts=("${_pkgbase}")
pkgdesc="bash wrapper to build & install Frogging-Family stuff with ease"
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
    'ee93514b8a9b292505f426b8bba8aad1a5dba2dd0b8bf8e4ad346a0c15627e0e'
    '84d525b028fe9d84f66c3a4dd7595db6420163eb59016eca7ae07aa5e57a737a'
    '327433813ba8f6f40bfef9111a50e056e058a572bca06cfd5105c57719387cf3'
)

package() {
    install -Dm755 "${srcdir}/${_pkgbase}-${pkgver}" "${pkgdir}/usr/bin/${_pkgbase}"
    install -Dm644 "${srcdir}/${_pkgbase}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgbase}.bash"
    install -Dm644 "${srcdir}/_${_pkgbase}" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgbase}"
}
