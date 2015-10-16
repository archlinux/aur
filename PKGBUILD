# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('mailman-suite-git')
_pkgbase=('mailman-suite')
pkgver=r14.627dc30
pkgrel=1
pkgdesc="Provides a django project skeleton for serving postorius and hyperkitty"
arch=(any)
conflicts=('mailman-suite')
provides=('mailman-suite')
makedepends=('git')
optdepends=('mailman-core: the actual Mailman backend'
            'python-mailman-hyperkitty-plugin: hyperkitty archiver plugin'
            'python2-whoosh: search backend for hyperkitty'
            'python2-django-postorius-git: for list management'
            'python2-django-hyperkitty-git: for archives'
            )

url="https://gitlab.com/thelinuxguy/mailman-suite"
license=('MIT')
options=(!emptydirs)
source=("git+https://gitlab.com/thelinuxguy/mailman-suite.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgbase"
  install -dm 755 "${pkgdir}/usr/share/webapps/${_pkgbase}"
  cp -r * "${pkgdir}/usr/share/webapps/${_pkgbase}"
}

# vim:set ts=2 sw=2 et:
