# Maintainer: Kaathe <archuserrepository.urology923 at pasinbox dot com>

_pkgname=tmux-continuum
pkgname=tmux-continuum-git
pkgver=r119.0698e8f
pkgrel=1
pkgdesc="Continuous saving of tmux environment. Automatic restore when tmux is started. Automatic tmux start when computer is turned on."
arch=('any')
url='https://github.com/tmux-plugins/tmux-continuum'
license=('MIT')
depends=('tmux' 'bash' 'tmux-resurrect')
makedepends=('git')
provides=('tmux-continuum')
conflicts=('tmux-continuum')
source=("${pkgname}::git+https://github.com/tmux-plugins/tmux-continuum.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${pkgname}"

  local destdir="${pkgdir}/usr/share/${_pkgname}"
  install -d "$_destdir"

  cp -r scripts *.tmux "$destdir/"

  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
