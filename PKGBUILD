# Maintainer: Christian Kühn (damachine3 at proton dot me)

_pkgbase=tkginstaller
pkgname=${_pkgbase}-git
pkgver=0.55.9.r392.g00f8725
pkgrel=1
_commit=00f87259acd7e567cd617b11672becbe68192593
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
sha256sums=('e7b384e63a6fa2ce56135af477d8893ed762fb5edb646fa0ea4a32e42e2c7596')

package() {
    install -Dm755 "${srcdir}/${_pkgbase}-${pkgver}" "${pkgdir}/usr/bin/${_pkgbase}"
}
