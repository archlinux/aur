# Maintainer: Jorge Alejandro Jimenez Luna <jorgeajimenezl17@gmail.com>

_pkgname=gnome-extension-shell-nauta-connect
pkgname=$_pkgname-git
_uuid=nauta-connect@jorgeajimenezl.com
pkgver=1
pkgrel=1
pkgdesc="Utility to authenticate in ETECSA network"
arch=('any')
url='https://github.com/jorgeajimenezl/nauta-connect-gnome-extension'
license=('GPL2')
depends=('gnome-shell' 'gxml')
makedepends=('git' 'jq')
provides=("$pkgname")

source=("$pkgname::git+https://github.com/jorgeajimenezl/nauta-connect-gnome-extension.git")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname/src
    cat metadata.json | jq .version 
}

package() {
    cd "$srcdir/$pkgname"
    mkdir -p ~/.local/share/gnome-shell/extensions/$_uuid
    cp -r src/* ~/.local/share/gnome-shell/extensions/$_uuid
    glib-compile-schemas ~/.local/share/gnome-shell/extensions/$_uuid/schemas/ 
}

