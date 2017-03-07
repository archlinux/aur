# Maintainer: Michael Kogan <michael dot kogan at gmx dot net>

pkgname='logsgui-git'
pkgdesc='Simple GUI to show log files in a graphical editor, git version'
pkgver=r90.d5287e2
pkgrel=1

depends=('python-pyqt4' 'python-sh' 'xdg-utils')
optdepends=('inxi: Show system information'
		'xorg-server: Show Xorg log'
		'systemd: Show systemd log'
		'mhwd: Show driver information using mhwd from Manjaro Linux' )
makedepends=('git')

source=("git+https://github.com/AlManja/logs.py.git")
md5sums=('SKIP')

arch=('any')
url='https://github.com/AlManja/logs.py'
license=('MIT')

package() {
	install -d -m755 "$pkgdir/usr/bin"
	install -m 755 "$srcdir/logs.py/logsgui.py" "$pkgdir/usr/bin/logsgui"
}

pkgver() {
	cd "logs.py"
	printf -- "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}