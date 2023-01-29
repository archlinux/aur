# Maintainer: Nixuge

pkgname=gtkpickeradder-hook
pkgver=1.0.0
pkgrel=1
pkgdesc='A pacman hook to make numerous apps use the GTK file picker by changing their .desktop file'
url=https://github.com/Nixuge/GTKPickerAdder
arch=(any)
license=(WTFPL)
depends=('python')
source=("https://github.com/Nixuge/GTKPickerAdder/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('92418ce77da0a1a04147b2be9b74a9fa49958de9deca6d1d178a5aaf6ed184bc')


package() {
    cd "GTKPickerAdder-${pkgver}"

    # License
    install -Dm644 \
        "LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Hook
    install -Dm644 \
        "gtkpicker-adder.hook" \
        "${pkgdir}/etc/pacman.d/hooks/gtkpicker-adder.hook"
    
    # Py file going w the hook
    install -Dm644 \
	     "gtkpicker-adder.py" \
	     "${pkgdir}/etc/pacman.d/hooks/gtkpicker-adder.py"
}
