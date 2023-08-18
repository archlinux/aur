# Maintainer: Antoine Poinsot <My first name at wizardsardine.com>

pkgname=liana-bin
pkgver=1.1
pkgrel=1
pkgdesc="A Bitcoin wallet focused on recovery options (includes headless daemon and GUI)."
arch=('x86_64')
url=https://github.com/wizardsardine/liana
license=('BSD')
depends=('glibc>=2.33' 'fontconfig>=2.12.6' 'freetype2>=2.8' 'systemd-libs') # systemd-libs for libudev

source=("https://github.com/wizardsardine/liana/releases/download/v$pkgver/liana-$pkgver-x86_64-linux-gnu.tar.gz")
sha256sums=("8f473771362cf6e8c64ccd680485d4d97fb03b1aaad83d90a2708665b4f793b5")

package() {
    _bin_folder="$srcdir/liana-$pkgver-x86_64-linux-gnu"

    install -D "$_bin_folder/lianad" "$pkgdir/usr/bin/lianad"
    install -D "$_bin_folder/liana-cli" "$pkgdir/usr/bin/liana-cli"
    install -D "$_bin_folder/liana-gui" "$pkgdir/usr/bin/liana-gui"
}
