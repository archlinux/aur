# Maintainer: tioguda <guda.flavio@gmail.com>

pkgname=slimbookbattery
pkgver=3.8beta
pkgrel=1
pkgdesc="Slimbook Battery. Is a battery optimization application for portable devices that can increase the battery life by 50%. For this purpose, the third-party software (TLP and others) is used to manage and configure the system resources."
arch=('any')
url="http://slimbook.es"
license=('Creative Commons BY-NC-ND 3.0')
groups=()
depends=('bash-completion' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gobject-introspection-runtime' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libappindicator-gtk3' 'libnotify' 'python' 'python-dbus' 'python-gobject' 'python-pillow' 'tlp' 'tlp-rdw')
optdepends=('gnome-shell-extension-appindicator:    Integrates AppIndicators into GNOME Shell')
backup=('etc/systemd/system/suspend-sedation.service')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://launchpad.net/~slimbook/+archive/ubuntu/slimbook/+files/${pkgname}_${pkgver}_all.deb")
sha512sums=('fc469e6fcff5fbcc5e960612ef2ff2caedb15b4ec8ffe105cb19709093cb2c694583e30f6a64d3edf06c026416bf242922e6971918884db0a5293972596d1f70')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"

    install -D -m644 "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
