# Maintainer: Sierra410 <(my nickname)@protonmail.com>
pkgname='transcopy-git'
pkgver=r7.71654c1
pkgrel=1
pkgdesc="Recursively copy a directory and convert some media types to a chosen format."
arch=('any')
url="https://gitlab.com/S410/transcopy"
license=('GPL-3-or-later')
depends=('python' 'ffmpeg')
makedepends=('git')
source=('git+https://gitlab.com/S410/transcopy.git')
md5sums=('SKIP')

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 transco.py "$pkgdir/usr/bin/transco.py"
}

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
