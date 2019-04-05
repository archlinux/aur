# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=scheduler
pkgver=1.1.1
pkgrel=1
pkgdesc="Alarms and reminders: tasks, events, calendar, pomodoro and timer widgets"
arch=('any')
url="https://github.com/j4321/Scheduler"
license=('GPL3')
makedepends=('python-setuptools')
depends=('tk' 'gettext' 'desktop-file-utils' 'python-matplotlib'
         'python-numpy' 'python-pillow' 'python-ewmh' 'python-babel'
         'python-tkcalendar' 'python-apscheduler' 'python-sqlalchemy'
         'python-dateutil' 'mpg123')
optdepends=('tktray: GUI toolkit for the system tray icon (at least one must be installed)'
            'pygtk: GUI toolkit for the system tray icon (at least one must be installed)'
            'python-pyqt5: GUI toolkit for the system tray icon (at least one must be installed)'
            'python-pyqt4: GUI toolkit for the system tray icon (at least one must be installed)'
            'python-pyside: GUI toolkit for the system tray icon (at least one must be installed)'
            'libnotify: desktop notifications'
            'zenity: nicer color chooser and file browser'
            'python-tkcolorpicker: nicer color chooser'
            'python-tkfilebrowser: nicer file browser')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/j4321/Scheduler/archive/v${pkgver}.tar.gz")
sha512sums=('ab7d37c0b60f5577f6308938ed733edcab765eef671a96fd1a6eff9556159c5b32815b649558af9cb80da60be10a6ebdecbb52f6e11999a4bab6ac1ce235d8b2')

build() {
	cd "$srcdir/Scheduler-${pkgver}"
	python setup.py build
}

package() {
	cd "$srcdir/Scheduler-${pkgver}"
	python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
