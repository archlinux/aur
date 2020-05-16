# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: tioguda <guda.flavio@gmail.com>
pkgname=slimbookbattery
pkgver=3.95beta
pkgrel=1
pkgdesc="A battery optimization application for portable devices"
arch=('any')
url="http://slimbook.es"
license=('CC BY-NC-ND 3.0')
depends=('python-gobject' 'python-cairo' 'python-pillow' 'python-dbus' 'libappindicator-gtk3'
         'gdk-pixbuf2' 'libnotify' 'tlp-rdw' 'cron' 'dmidecode' 'xorg-xdpyinfo')
optdepends=('arch-prime-git: for hybrid graphics switching'
            'gnome-shell-extension-appindicator: for tray icon on GNOME')
install="$pkgname.install"
source=("https://launchpad.net/~slimbook/+archive/ubuntu/slimbook/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('f4afdff142178ab997f6edc4a074c54c186769cef7527fe7093e8d1ef63d72d6')

package() {
    tar xf data.tar.xz -C "$pkgdir"

    install -d "$pkgdir/usr/lib/systemd/system"
    mv "$pkgdir/etc/systemd/system/suspend-sedation.service" "$pkgdir/usr/lib/systemd/system"
    rm -rf "$pkgdir/etc/systemd"

    install -dm644 "$pkgdir/usr/share/licenses/$pkgname"
    mv "$pkgdir/usr/share/doc/$pkgname/copyright" "$pkgdir/usr/share/licenses/$pkgname/copyright"
}
