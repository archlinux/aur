# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-webmail"
pkgver="22.12.15"
pkgrel="1"
pkgdesc="Webmail notifications and actions for any desktop"
arch=("any")
url="https://tari.in/www/software/ayatana-webmail/"
license=("GPL3")
depends=("ayatana-indicator-messages" "hicolor-icon-theme" "dconf" "gobject-introspection" "desktop-file-utils" "libnotify" "libcanberra" "gnome-keyring" "python-babel" "python-gobject" "python-psutil" "python-secretstorage" "python-urllib3")
makedepends=("python-setuptools" "python-polib")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("2703acd3381d466e042eee64d109ad51")
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
