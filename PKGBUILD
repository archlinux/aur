# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>
# Maintainer: Ingo Meyer <IJ_M@gmx.de>

pkgname="ayatana-webmail-no-indicator-messages"
pkgver="21.11.17"
pkgrel="1"
pkgdesc="Webmail notifications and actions for any desktop without ayatana-indicator-messages dependency"
arch=("any")
url="https://tari.in/www/software/ayatana-webmail/"
license=("GPL3")
depends=("hicolor-icon-theme" "dconf" "gobject-introspection" "desktop-file-utils" "libnotify" "libcanberra" "gnome-keyring" "python-babel" "python-gobject" "python-psutil" "python-secretstorage" "python-urllib3")
makedepends=("python-setuptools" "python-polib")
install="ayatana-webmail.install"
source=("ayatana-webmail-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/ayatana-webmail/archive/${pkgver}.tar.gz")
md5sums=("62696ef144dfdae00abe3cdc730da341")
provides=("ayatana-webmail=${pkgver}")
replaces=("unity-mail")
conflicts=("ayatana-webmail" "unity-mail")

build()
{
    cd ayatana-webmail-${pkgver}
    python setup.py build
}

package()
{
    cd ayatana-webmail-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
}
