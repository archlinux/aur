# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>
pkgname=python-i3-chrome-tab-dragging-git
pkgrel=1
pkgver=r19.9a244fc
license=('MIT')
arch=('any')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc='Float chrome windows with i3wm while dragging tabs.'
makedepends=('git')
depends=('python' 'python-i3ipc' 'python-pynput')
url='https://github.com/Syphdias/i3-chrome-tab-dragging'
source=("git+https://github.com/Syphdias/i3-chrome-tab-dragging.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D "${pkgname%-git}.py" "$pkgdir/usr/bin/${pkgname%-git}"
}
