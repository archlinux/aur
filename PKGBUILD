# Maintainer: Márk Sági-Kazár <mark.sagi-kazar@gmail.com>

pkgname=gnome-shell-extension-gravatar
pkgver=3
pkgrel=1
pkgdesc="A GNOME Shell extension to synchronize your user icon with Gravatar."
arch=('any')
url="https://github.com/jrouleau/gnome-shell-extension-gravatar"
license=('MIT')
depends=('gnome-shell')
optdepends=('dconf' 'gnome-tweak-tool')
conflicts=("${pkgname}-git")
install=gschemas.install
source=("https://github.com/jrouleau/gnome-shell-extension-gravatar/archive/v${pkgver}.tar.gz")
noextract=()
md5sums=('05ce8131c2b2c1bc38cdea204606714e')

_uuid='gravatar@jr.rlabs.io'

package() {
    cd "${srcdir}/gnome-shell-extension-gravatar-${pkgver}"

    _extension_path="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    _schema_path="${pkgdir}/usr/share/glib-2.0/schemas"

    install -d $_extension_path
    install -d $_schema_path

    install -Dm644 src/schemas/org.gnome.shell.extensions.gravatar.gschema.xml $_schema_path
    rm -rf src/schemas

    cp -r src/* $_extension_path
    cp -r lib/ $_extension_path
    cp LICENSE $_extension_path
}
