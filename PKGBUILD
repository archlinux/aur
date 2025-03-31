pkgname=gnome-shell-extension-media-controls
pkgver=2.1.0
pkgrel=0
pkgdesc="A media indicator for the GNOME shell"
arch=('any')
url="https://github.com/sakithb/media-controls"
license=('MIT')
makedepends=()
depends=('gnome-shell' 'glib2')
provides=("${pkgname}")
options=(!strip !emptydirs)
source=("https://github.com/sakithb/media-controls/releases/download/v${pkgver}/mediacontrols@cliffniff.github.com.shell-extension.zip")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir"
    grep "version-name" metadata.json | cut -d '"' -f 4
}

package() {
    glib-compile-schemas $srcdir/schemas/
    rm $srcdir/mediacontrols@cliffniff.github.com.shell-extension.zip

    destdir="$pkgdir/usr/share/gnome-shell/extensions/mediacontrols@cliffniff.github.com/"
    mkdir -p "$destdir"
    install -dm755 "$destdir"

    cp -r $srcdir/* "$destdir/"
}
