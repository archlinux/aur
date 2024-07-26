# Contributor: Poscat <poscat@mail.poscat.moe>

pkgname=emacs-onedark-theme-git
pkgver=r160.b34b62e
pkgrel=1
pkgdesc="An Emacs port of the Atom One Dark theme."
arch=('any')
url="https://github.com/jonathanchu/atom-one-dark-theme"
license=('GPL-3.0-or-later')
provides=('emacs-onedark-theme')
conflicts=('emacs-onedark-theme')
makedepends=('git')
depends=('emacs')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"
    install -D -m 644 atom-one-dark-theme.el "${pkgdir}/usr/share/emacs/site-lisp/onedark-theme/atom-one-dark-theme.el"
}
