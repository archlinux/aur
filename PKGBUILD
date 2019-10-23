# Maintainer: Jonathan Waldrep <spartan074 at gmail dot com>
# Contributor: Niklas Bolander <niklas.bolander at gmail dot com>

pkgname=zsh-fast-syntax-highlighting-git
pkgver=r760.01471d8
pkgrel=1
pkgdesc='Optimized and extended zsh-syntax-highlighting'
arch=('any')
url='https://github.com/zdharma/fast-syntax-highlighting'
license=('BSD')
depends=('zsh')
makedepends=('git')
source=('git+https://github.com/zdharma/fast-syntax-highlighting.git')
sha512sums=('SKIP')

_gitname='fast-syntax-highlighting'

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  typeset _plugindir="${pkgdir}/usr/share/zsh/plugins"
  typeset _licdir="${pkgdir}/usr/share/licenses/${pkgname}"

  install -dm0755 "${_plugindir}"
  cp -r "${srcdir}/${_gitname}" "${_plugindir}"

  install -dm755 "${_licdir}"
  install -m0644 "${srcdir}/${_gitname}/LICENSE" "${_licdir}"
}

# vim:set syntax=PKGBUILD ts=2 sw=2 et:
