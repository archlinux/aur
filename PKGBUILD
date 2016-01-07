# Maintainer: gabrielsimoes <simoes.sgabriel@gmail.com>

_pkgname='vol'
pkgname="${_pkgname}-git"
pkgver=latest
pkgrel=1
pkgdesc="Volument control and notification (PulseAudio, pamixer and volnoti) - klassiker's fork"
url="https://github.com/klassiker/vol.sh"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('pacman' 'pamixer' 'volnoti')
makedeps=('git')
source=("${_pkgname}::git+https://github.com/klassiker/vol.sh.git")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "$srcdir/$_pkgname/vol.sh" "$pkgdir/usr/bin/vol"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/vol"
}
