# Maintainer: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=gnome-shell-extension-gmail-notify
pkgver=0.3.6
pkgrel=1
pkgdesc="Utilizes Gnome Online Accounts to login to gmail and check your incomig mails."
arch=('any')
url="http://gn.makrodata.org/"
license=('GPL2')
depends=('gnome-shell>=3.10')
makedepends=('gnome-common' 'unzip')
install='gschemas.install'
source=("$pkgname.zip::http://gn.makrodata.org/index.php?option=com_weblinks&task=weblink.go&id=31&Itemid=103")
sha512sums=('68accb81f13271b7969741828dfe27c120757b0422471bd7e840b81389e6f540602e7a7f251101792a3156d59d4c0d91a8d5a7eb615ae9bc645b4668b77805f8')

build() {
    rm *.zip
    chmod 644 metadata.json
    rm schemas/gschemas.compiled
}

package() {
    destdir="$pkgdir/usr/share/gnome-shell/extensions/gmail_notify@jablona123.pl"
    schemadir="$pkgdir/usr/share/glib-2.0"
    install -d "$destdir" "$schemadir"
    cp -r ${srcdir}/schemas "$schemadir"
    cp -r ${srcdir}/* "$destdir"
}
