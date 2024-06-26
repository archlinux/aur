# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-webmail"
pkgver="24.5.17"
pkgrel="1"
pkgdesc="Webmail notifications and actions for any desktop"
arch=("any")
url="https://tari.in/www/software/ayatana-webmail/"
license=("GPL-3.0-or-later")
depends=("python-dbus" "glib2" "python" "gtk3" "gdk-pixbuf2" "hicolor-icon-theme" "dconf" "libnotify" "libcanberra" "gnome-keyring" "python-babel" "python-gobject" "python-psutil" "python-secretstorage" "python-urllib3")
makedepends=("python-setuptools" "python-polib")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("5c202c540631443b8dead9c62cb49475")
replaces=("unity-mail")
conflicts=("unity-mail")

build()
{
    cd ${pkgname}-${pkgver}
    python setup.py build
}

package()
{
    cd ${pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
}
