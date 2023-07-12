# Original Author: Yamakaky <yamakaky@yamaworld_fr>
# Edited by: Thomas <tpxp@live.fr> for the git version
pkgname=safeeyes-git
pkgver=2.1.6.r3.ge6112a8
pkgrel=1
pkgdesc="A Free and Open Source tool for Linux users to reduce and prevent repetitive strain injury (RSI). Latest version from the git repository"
arch=("any")
url="https://github.com/slgobinath/SafeEyes"
license=("GPL3")
depends=("alsa-utils"
         "hicolor-icon-theme"
         "libappindicator-gtk3"
         "python"
         "python-babel"
         "python-dbus"
         "python-gobject"
         "python-psutil"
         "python-xlib"
         "xorg-xprop")
conflicts=("safeeyes")
makedepends=("python-setuptools" "git")
optdepends=("xprintidle: better idle timer"
            "python-croniter: health stats plugin"
            "swayidle: for smart pause")
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
