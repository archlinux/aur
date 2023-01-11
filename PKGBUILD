# Maintainer: humanbeing27 <electronneutrino27@proton.me>

pkgname='waydroid-settings'
pkgver=22.1217
pkgrel=9
makedepends=('blueprint-compiler' 'meson')
depends=('vte4' 'waydroid' 'webkit2gtk-5.0' 'libadwaita' 'polkit' 'python-gobject')
arch=('any')
pkgdesc="A GTK4 app to control Waydroid settings"
url="https://github.com/axel358/Waydroid-Settings"
source=(${url}/archive/refs/heads/gtk4-port.zip)
sha512sums=('6840190cbf04eceb8a6b222900e6b4803103ac057f5271d25c8d0b01e6258c39eef18027de122a3db5c7cd98e48d821ce6b925cc14bc7eabe9e603d95231d960')
build(){
        cd $srcdir/Waydroid-Settings-gtk4-port
	arch-meson build --prefix=$pkgdir/usr
}
package(){
	mkdir -p $pkgdir/usr
	cd $srcdir/Waydroid-Settings-gtk4-port/build 
	ninja install
	rm $pkgdir/usr/share/{icons/hicolor/icon-theme.cache,glib-2.0/schemas/gschemas.compiled,applications/mimeinfo.cache}
}
