# Maintainer: Michal Sotolar <michal at sotolar dot com>

pkgname=mailnagger
pkgver=2.3.1
pkgrel=1

pkgdesc='Extensible mail notification daemon (forked from Mailnag)'
url='https://github.com/tikank/mailnagger'

arch=('any')
license=('GPL')

provides=('mailnag')
conflicts=('mailnag' 'mailnag-git')
depends=('python-gobject' 'python-httplib2' 'python-xdg' 'python-dbus' 'python-zombie-imp' 'libnotify' 'gst-plugins-base' 'gtk3' 'gdk-pixbuf2')
makedepends=('gettext' 'git')
optdepends=(
  'mailnag-goa-plugin-git: GNOME Online Accounts integration'
  'libgnome-keyring: save password storage in GNOME 3'
  'gnome-keyring: save password storage in GNOME 3'
  'networkmanager: network connectivity detection'
)

source=("https://github.com/tikank/mailnagger/archive/refs/tags/${pkgname}_${pkgver}.tar.gz")
sha256sums=('b8ea6e651700a4c10e6b6d50b13fe304b72a69e01b1aa33ffa451a4f15a4fdd2')

package() {
  cd "${pkgname}-${pkgname}_${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
