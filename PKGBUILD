# Maintainer: Achmad Fathoni <fathoni DOT id AT gmail DOT com>

pkgname=zsh-easy-motion-git
pkgver=r65.bc71781
pkgrel=2
pkgdesc="Vim's easy-motion for zsh"
arch=('any')
url='https://github.com/IngoMeyer441/zsh-easy-motion'
license=('MIT')
depends=('zsh')
makedepends=('git')
source=("git+${url}.git")
sha512sums=('SKIP')

_gitname="${pkgname::-4}"

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  typeset _plugindir="${pkgdir}/usr/share/zsh/plugins"
  typeset _licdir="${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm755 "${srcdir}/${_gitname}/easy_motion.plugin.zsh" -t "${_plugindir}"
  install -Dm755 "${srcdir}/${_gitname}/easy_motion.py" -t "${_plugindir}"
  install -Dm644 "${srcdir}/${_gitname}/LICENSE" -t "${_licdir}"
}
