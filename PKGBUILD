# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('mailman-django-git')
_pkgbase=('mailman-django')
pkgver=c9a0fe0
pkgrel=1
pkgdesc="Django project skeleton for serving postorius and hyperkitty"
arch=(any)
conflicts=('mailman-django')
provides=('mailman-django')
makedepends=('git')
optdepends=(
            'python2-whoosh: Whoosh backend for hyperkitty'
            'python2-django-postorius-git: Postorius app'
            'python2-django-hyperkitty-git: Hyperkitty app'
            )
url="https://gitlab.com/thelinuxguy/mailman-django"
license=('LGPL')
options=(!emptydirs)
source=("git+https://gitlab.com/thelinuxguy/mailman-django.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  git describe --always | sed 's|-|.|g' | cut -f2 -d"v"
}

package() {
  cd "$srcdir/$_pkgbase"
  install -dm 755  "$pkgdir/usr/share/webapps/${_pkgbase}"
  install -D * "$pkgdir/usr/share/webapps/${_pkgbase}"
}

# vim:set ts=2 sw=2 et:
