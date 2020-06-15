# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=trueline
pkgname=${_pkgname}-git
pkgver=r42.a1aaf95
pkgrel=2
pkgdesc='Fast and extensible bash powerline prompt with true color and fancy icon support'
arch=('any')
url='https://github.com/petobens/trueline'
license=('MIT')
makedepends=('git')
optdepends=('nerd-fonts-anonymous-pro: font support'
            'nerd-fonts-arimo: font support'
            'nerd-fonts-bitstream-vera-mono: font support'
            'nerd-fonts-cascadia-code: font support'
            'nerd-fonts-dejavu-complete: font support'
            'nerd-fonts-droid-sans-mono: font support'
            'nerd-fonts-fantasque-sans-mono: font support'
            'nerd-fonts-fira-code: font support'
            'nerd-fonts-fira-mono: font support'
            'nerd-fonts-go-mono: font support'
            'nerd-fonts-hack: font support'
            'nerd-fonts-hermit: font support'
            'nerd-fonts-ibm-plex-mono: font support'
            'nerd-fonts-inconsolata: font support'
            'nerd-fonts-inconsolata-go: font support'
            'nerd-fonts-jetbrains-mono: font support'
            'nerd-fonts-liberation-mono: font support'
            'nerd-fonts-meslo: font support'
            'nerd-fonts-monoid: font support'
            'nerd-fonts-mononoki: font support'
            'nerd-fonts-mplus: font support'
            'nerd-fonts-noto: font support'
            'nerd-fonts-noto-sans-mono: font support'
            'nerd-fonts-noto-sans-regular-complete: font support'
            'nerd-fonts-profont: font support'
            'nerd-fonts-roboto-mono: font support'
            'nerd-fonts-source-code-pro: font support'
            'nerd-fonts-terminus: font support'
            'nerd-fonts-ubuntu-mono: font support'
            'nerd-fonts-victor-mono: font support')
provides=("${_pkgname}")
install='add-to-bash.install'
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "${_pkgname}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et: