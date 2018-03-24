# Maintainer: Ramana Kumar <firstname at member.fsf.org>
# Contributor: Jesus Alvarez <jeezusjr@gmail.com>
pkgname=pacnews-git
pkgver=1.0.r341.87fee7a
pkgrel=1
pkgdesc="Find .pacnew files and merge them with vimdiff"
arch=(any)
license=('unknown')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/pbrisbin/scripts.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/scripts"
  # Adding the 1.0 because the repo changed and the revision count is lower than the previous pkgver. This way
  # users will learn the package has been updated.
	printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/scripts"
  mkdir -p "${pkgdir}/usr/bin"
  install ${pkgname%-git} "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 et:
