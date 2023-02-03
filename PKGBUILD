# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>
pkgname=python-i3-chrome-tab-dragging-git
pkgrel=1
pkgver=r21.4a60ce9
license=('MIT')
arch=('any')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc='Float chrome windows with i3wm while dragging tabs.'
makedepends=('git')
depends=('i3-wm' 'python' 'python-i3ipc' 'python-pynput')
url='https://github.com/Syphdias/i3-chrome-tab-dragging'
source=("git+https://github.com/Syphdias/i3-chrome-tab-dragging.git")
md5sums=('SKIP')

_appname=i3-chrome-tab-dragging

pkgver() {
	cd "$srcdir/${_appname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_appname}"
	install -D "${_appname}.py" "$pkgdir/usr/bin/${_appname}"
}
