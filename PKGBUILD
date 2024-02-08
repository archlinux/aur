# Maintainer: Manuel Wiesinger <m@mmap.at>

pkgname=i3-gnome-pomodoro-git
_srcname=i3-gnome-pomodoro

pkgver=r92.7fe1895
pkgrel=1
pkgdesc="Integrate gnome-pomodoro into i3"
arch=('any')
url="https://github.com/kantord/i3-gnome-pomodoro"
license=('GPL3')

depends=('python' 'gnome-shell-pomodoro' 'python-click>=6.7' 'python-pydbus>=0.6.0' 'python-i3ipc>=1.3.0' 'python-gobject>=3.32.1')
makedepends=('git')
provides=("$_srcname")

source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	 cd "${srcdir}/${_srcname}/i3_gnome_pomodoro"
	 printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_srcname}/i3_gnome_pomodoro"
	install -D -m755 pomodoro_client.py "$pkgdir/usr/bin/i3-gnome-pomodoro"
}
