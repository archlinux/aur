# Maintainer: tioguda <guda.flavio@gmail.com>

pkgname=slimbookbattery
pkgver=3.7beta
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
sha512sums=('fa7f0b0ccc0de9fb7667b173f33be468cd38cd9f885028eb46a3b782a1fe7594c887fe8d60bb216144000b9fe87311debe2f713e51fc1a49f6eca2a0c4cdb005')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"

    install -D -m644 "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
