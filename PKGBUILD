# Maintainer: Antoine Poinsot <My first name at wizardsardine.com>

pkgname=liana-bin
pkgver=1.0
pkgrel=1
pkgdesc="A Bitcoin wallet focused on recovery options (includes headless daemon and GUI)."
arch=('x86_64')
url=https://github.com/wizardsardine/liana
license=('BSD')
depends=('glibc>=2.33' 'fontconfig>=2.12.6' 'freetype2>=2.8' 'systemd-libs') # systemd-libs for libudev

source=("https://github.com/wizardsardine/liana/releases/download/v$pkgver/liana-$pkgver-x86_64-linux-gnu.tar.gz")
sha256sums=("bd425e3e08fcb74b6d2d641c7f6bd553062d49dbd42898823082990f862de43b")

package() {
    _bin_folder="$srcdir/liana-$pkgver-x86_64-linux-gnu"

    install -D "$_bin_folder/lianad" "$pkgdir/usr/bin/lianad"
    install -D "$_bin_folder/liana-cli" "$pkgdir/usr/bin/liana-cli"
    install -D "$_bin_folder/liana-gui" "$pkgdir/usr/bin/liana-gui"
}
