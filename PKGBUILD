# Maintainer: skrewball <skrewball at joickle dot com>

pkgname=gnome-shell-extension-clipboard-history
pkgver=10
pkgrel=2
pkgdesc="Save items you've copied into an easily accessible, searchable history panel."
arch=(any)
url='https://github.com/SUPERCILEX/gnome-clipboard-history'
license=('MIT')
depends=('dconf' 'gnome-shell>=40')
source=("https://extensions.gnome.org/extension-data/clipboard-historyalexsaveau.dev.v${pkgver}.shell-extension.zip")
sha256sums=('eaed8b0c6e9f927ac00cf3b6b0b84e2d9b3e164350ba926d7943a279485dc34e')

package() {
    local _uuid="clipboard-history@alexsaveau.dev"
    local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

    install -Dm644 -t "$_destdir" metadata.json *.js *.css
    install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml

    cd locale
    for locale in */
      do
        install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
      done
}
