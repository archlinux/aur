# Maintainer: Christian Kühn (damachine3 at proton dot me)

_pkgbase=tkginstaller
pkgname=${_pkgbase}-git
pkgver=0.60.1.r394.g3bd9f27
pkgrel=1
_commit=3bd9f276cb707422e8b25109fd5159bdd96d2a13
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
    'opendoas: privilege escalation (alternative to sudo)'
    'sudo: privilege escalation (alternative to opendoas)'
    'wdiff: word-based configuration comparisons'
)
install=tkginstaller.install
source=("${_pkgbase}-${pkgver}::https://raw.githubusercontent.com/damachine/${_pkgbase}/${_commit}/${_pkgbase}")
sha256sums=('ea31463107b64d674d81854db1bc1c786fcb26def308fc925178facea79e79eb')

package() {
    install -Dm755 "${srcdir}/${_pkgbase}-${pkgver}" "${pkgdir}/usr/bin/${_pkgbase}"
}
