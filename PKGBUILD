# Maintainer: Christian Kühn (damachine3 at proton dot me)

_pkgbase=tkginstaller
pkgname=${_pkgbase}-git
pkgver=0.61.0.r405.ge20ea33
pkgrel=1
_commit=e20ea33345c184dd7a269e9b9bfb6c3f068722c7
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
    '4abcda823906b2e12ebf2b915c772410ee5a6e4eda923f84993273c3069fe99e'
    '56dd64d4ec2b46b68cb52f5ac35dd7f0fe6bec1054f5a0837bc3b82950f23758'
    '79bc7fb7d8a1f8ffed4083f8055e5951dfb2900131d70b7b66070ea5c4133634'
)

package() {
    install -Dm755 "${srcdir}/${_pkgbase}-${pkgver}" "${pkgdir}/usr/bin/${_pkgbase}"
    install -Dm644 "${srcdir}/${_pkgbase}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgbase}.bash"
    install -Dm644 "${srcdir}/_${_pkgbase}" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgbase}"
}
