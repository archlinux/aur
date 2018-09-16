# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=cros-adapta-gtk-theme
pkgver=70
pkgrel=1
pkgdesc="Adapta crostini theme, the Chrome OS GTK+ theme"
url="https://chromium.googlesource.com/chromiumos/third_party/cros-adapta/"
arch=(any)
license=(GPL2)

conflicts=(cros-adapta-gtk-theme-git)
makedepends=("autoconf"
             "automake"
             "inkscape>=0.91"
             "gdk-pixbuf2>=2.32.2"
             "glib2>=2.48.0"
             "libsass>=3.3"
             "libxml2"
             "pkgconf"
             "sassc>=3.3")
depends=(gtk-engine-murrine
         gtk3)

source=("https://chromium.googlesource.com/chromiumos/third_party/cros-adapta/+archive/release-R70-11021.B.tar.gz")
sha256sums=(SKIP)

build() {
    yes | tools/extract_adapta.sh
}

package() {
    install -dm 755 "${pkgdir}"/usr/share/themes/cros-adapta
  
    cp -r gtk-2.0 "${pkgdir}"/usr/share/themes/cros-adapta/
    cp -r gtk-3.0 "${pkgdir}"/usr/share/themes/cros-adapta/
    cp -r gtk-3.22 "${pkgdir}"/usr/share/themes/cros-adapta/
    cp index.theme "${pkgdir}"/usr/share/themes/cros-adapta/
}
