# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>

_pkgname=mopidy-notifier
pkgname=${_pkgname}-git
pkgver=0.r45.df9032f
pkgrel=1
pkgdesc='Mopidy extension for showing song changes in notifications.'
arch=('any')
url="https://github.com/sauberfred/${_pkgname}"
license=('Apache')
depends=('python2' 'mopidy' 'libnotify')
makedepends=('git')
provides=("$_pkgname")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 README.rst "$pkgdir/usr/share/doc/${_pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
