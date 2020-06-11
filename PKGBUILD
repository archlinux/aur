# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=trueline
pkgname=${_pkgname}-git
pkgver=r42.a1aaf95
pkgrel=1
pkgdesc="Fast and extensible bash powerline prompt with true color and fancy icon support"
arch=('any')
url="https://github.com/petobens/${_pkgname}"
license=('MIT')
install='add-to-bash.install'
source=("git+${url}.git")
depends=('bash')
optdepends=('nerd-fonts-anonymous-pro: Font support'
            'nerd-fonts-arimo: Font support'
            'nerd-fonts-bitstream-vera-mono: Font support'
            'nerd-fonts-cascadia-code: Font support'
            'nerd-fonts-dejavu-complete: Font support'
            'nerd-fonts-droid-sans-mono: Font support'
            'nerd-fonts-fantasque-sans-mono: Font support'
            'nerd-fonts-fira-code: Font support'
            'nerd-fonts-fira-mono: Font support'
            'nerd-fonts-go-mono: Font support'
            'nerd-fonts-hack: Font support'
            'nerd-fonts-hermit: Font support'
            'nerd-fonts-ibm-plex-mono: Font support'
            'nerd-fonts-inconsolata: Font support'
            'nerd-fonts-inconsolata-go: Font support'
            'nerd-fonts-jetbrains-mono: Font support'
            'nerd-fonts-liberation-mono: Font support'
            'nerd-fonts-meslo: Font support'
            'nerd-fonts-monoid: Font support'
            'nerd-fonts-mononoki: Font support'
            'nerd-fonts-mplus: Font support'
            'nerd-fonts-noto: Font support'
            'nerd-fonts-noto-sans-mono: Font support'
            'nerd-fonts-noto-sans-regular-complete: Font support'
            'nerd-fonts-profont: Font support'
            'nerd-fonts-roboto-mono: Font support'
            'nerd-fonts-source-code-pro: Font support'
            'nerd-fonts-terminus: Font support'
            'nerd-fonts-ubuntu-mono: Font support'
            'nerd-fonts-victor-mono: Font support'
)
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}