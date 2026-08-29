# Maintainer: Christian Kühn (damachine3 at proton dot me)

_pkgbase=tkginstaller
pkgname=${_pkgbase}-git
pkgver=0.60.0.r393.g65132c3
pkgrel=1
_commit=65132c3b4785114193fa606e54733d6940aa12e5
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
sha256sums=('b202fe9dbc390c09c667c445683d9778381447593a1087edf6ad0d960e65f7a1')

package() {
    install -Dm755 "${srcdir}/${_pkgbase}-${pkgver}" "${pkgdir}/usr/bin/${_pkgbase}"
}
