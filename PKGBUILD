# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cvassistant-git
pkgver=3.1.0.r155.58cf141
pkgrel=1
pkgdesc="Helps you create specialized resumes in Word .docx format fast and easy"
arch=('x86_64')
url="https://cvassistant.sourceforge.io"
license=('GPL')
depends=('qt5-base' 'quazip')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://git.code.sf.net/p/cvassistant/code.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "3.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir" install
}
