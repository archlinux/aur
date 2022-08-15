# Maintainer: seth <getchoo at tuta dot io>

pkgname=zsh-antidote
_pkgname=antidote
pkgver=1.3.0
pkgrel=1
pkgdesc="the cure to slow zsh plugin management"
arch=(any)
url="https://getantidote.github.io/"
license=('MIT')
depends=('zsh' 'git')
install=zsh-antidote.install
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/mattmc3/antidote/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('0c06cc6fcaba4312d0eb0a41be8a04717e84bbcff7f3d2a667364d78902fc5fc')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm0644 -t "$pkgdir/usr/share/${_pkgname}/" "${_pkgname}.zsh"
  cp -r functions/ "$pkgdir/usr/share/${_pkgname}/"
}

# nvim: set ts=2 sw=2 et:
