# Maintainer: Reto <reto@labrat.space>
pkgname=notmuch-extract-patch-git
_realname=${pkgname%-git}
pkgver=r4.f732a53
pkgrel=2
pkgdesc='Extract git patchset from notmuch emails'
url='https://github.com/aaptel/notmuch-extract-patch'
arch=('any')
license=('GPLv3')
depends=('python' 'notmuch-runtime')
makedepends=('git')
source=(
    'git+https://github.com/aaptel/notmuch-extract-patch.git'
)
sha256sums=('SKIP')

pkgver() {
    cd $_realname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $_realname
    install -Dm755 "${_realname}" "${pkgdir}/usr/bin/${_realname}"
}
