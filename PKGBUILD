# Maintainer: Jonathan Waldrep <spartan074 at gmail dot com>
# Contributor: Niklas Bolander <niklas.bolander at gmail dot com>

# Maintainer: FlyInWind <2518509078@qq.com>

_gitname=fast-syntax-highlighting
pkgname=zsh-$_gitname
pkgver=1.55
pkgrel=1
pkgdesc='Optimized and extended zsh-syntax-highlighting'
arch=('any')
url='https://github.com/zdharma/fast-syntax-highlighting'
license=('BSD')
depends=('zsh')
makedepends=('git')
source=("git+https://github.com/zdharma/fast-syntax-highlighting.git#tag=v${pkgver}")
sha512sums=('SKIP')
provides=("$pkgname")
conflicts=(
    "${pkgname}-git"
)

package() {
  typeset _plugindir="${pkgdir}/usr/share/zsh/plugins"
  typeset _licdir="${pkgdir}/usr/share/licenses/${pkgname}"

  install -dm0755 "${_plugindir}"
  cp -r "${srcdir}/${_gitname}" "${_plugindir}"

  install -dm755 "${_licdir}"
  install -m0644 "${srcdir}/${_gitname}/LICENSE" "${_licdir}"
}
