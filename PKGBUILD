# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=scheduler
pkgver=1.1.0
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
            'zenity: nicer color chooser'
            'python-tkcolorpicker: nicer color chooser')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/j4321/Scheduler/archive/v${pkgver}.tar.gz")
sha512sums=('a6cc5a64e483cd6a36c7fc4373f260da34183f42ca8b17f0770b767bbd761082a557c7c4b741f71520eaec1a9052554e37ce055e8b3afcc82eaee3ab0bc94320')

build() {
	cd "$srcdir/Scheduler-${pkgver}"
	python setup.py build
}

package() {
	cd "$srcdir/Scheduler-${pkgver}"
	python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
}
