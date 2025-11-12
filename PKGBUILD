# Original Author: Yamakaky <yamakaky@yamaworld_fr>
# Edited by: Thomas <tpxp@live.fr> for the git version
# Edited by: Archisman Panigrahi <apandada1ATgmail.com>
pkgname=safeeyes-git
pkgver=3.2.0b3.r15.gde504da
pkgrel=2
pkgdesc="A Free and Open Source tool for Linux users to reduce and prevent repetitive strain injury (RSI). Latest version from the git repository"
arch=("any")
url="https://github.com/slgobinath/SafeEyes"
license=("GPL3")
depends=("libnotify"
         "gtk4"
         "python-babel"
         "python-gobject"
         "python-packaging"
         "python-psutil"
         "python-xlib")
makedepends=("python-setuptools" "python-packaging" "python-pip")
optdepends=("python-pywayland: for Smart Pause plugin in Wayland" "xprintidle: for Smart Pause plugin in X11" "ffmpeg: For playing the audible bell" "python-croniter: for Health Stats plugin" "snixembed: For tray icon support in LXDE/MATE/WMs")
source=("git+https://github.com/slgobinath/SafeEyes.git")
sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/SafeEyes"
	git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/SafeEyes"
	PYTHONUSERBASE="/usr" python setup.py install --root="$pkgdir/" --optimize=1
}
