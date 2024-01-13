# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: shellkr (https://aur.archlinux.org/account/shellkr)

pkgname=fern-git
_gitname=${pkgname%-git*}
pkgver=75.0244f1a
pkgrel=3
pkgdesc='a curses-based mastodon client modeled off usenet news readers & pine, with an emphasis on getting to "timeline zero"'
arch=('any')
url="https://github.com/enkiv2/fern"
license=('BSD3')
depends=('python-mastodon')
makedepends=('git')
provides=("$_gitname")
source=("$_gitname::git+https://github.com/enkiv2/fern.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd "$srcdir/${_gitname}"
  mkdir -p "${pkgdir}/usr/bin/"
  install -Dm755 ${_gitname} "${pkgdir}/usr/bin/${_gitname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set sts=2 sw=2 ft=PKGBUILD:
