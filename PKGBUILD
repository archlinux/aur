# Maintainer: Nate Dalliard <nate@dalliard.ch>
pkgname=fin-git
_gitname=fin
pkgver=r10.8486731
pkgrel=1
pkgdesc="Zero-configuration, concurrent plugin manager for the fish shell in one file"
arch=('any')
url="https://github.com/fisherman/fin"
license=('MIT')
makedepends=('git')
source=('git+https://github.com/fisherman/fin.git')
md5sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  sharepath="${pkgdir}/usr/share"
	cd "${_gitname}"
  install -Dm 644 fin.fish "${sharepath}/fish/functions/fin.fish"
  install -Dm 644 LICENSE "${sharepath}/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${sharepath}/doc/${pkgname}/README"
}
# vim: ft=sh ts=2 sw=2 et
