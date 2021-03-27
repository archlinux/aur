# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>

pkgname=run-scaled-git
_gitdir=run-scaled
pkgver=r3.4b7fc79
pkgrel=1
pkgdesc='Run an X application scaled via xpra. Useful on hidpi screens. (Rewritten in Python and added input method support)'
arch=('any')
url='https://github.com/SamLukeYes/run-scaled'
license=('Boost')
provides=('run-scaled')
conflicts=('run-scaled')
makedepends=('git')
depends=('xpra' 'xorg-xrandr' 'xorg-server-xvfb')
source=("git+${url}.git")
md5sums=(SKIP)

pkgver() {
  cd "${srcdir}/${_gitdir}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_gitdir}"
  install -Dm755 run_scaled.py "${pkgdir}/usr/bin/run-scaled"
}