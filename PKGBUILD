# Maintainer: Antoine Poinsot <My first name at wizardsardine.com>

pkgname=liana-bin
pkgver=2.0
pkgrel=1
pkgdesc="A Bitcoin wallet focused on recovery options (includes headless daemon and GUI)."
arch=('x86_64')
url=https://github.com/wizardsardine/liana
license=('BSD')
depends=('glibc>=2.33' 'fontconfig>=2.12.6' 'freetype2>=2.8' 'systemd-libs') # systemd-libs for libudev

source=("https://github.com/wizardsardine/liana/releases/download/v$pkgver/liana-$pkgver-x86_64-linux-gnu.tar.gz")
sha256sums=("fddd57b59dc4f09cd36d31734a8cfc9d037e0f205895b16ff0ffb20ac1bfd470")

package() {
    _bin_folder="$srcdir/liana-$pkgver-x86_64-linux-gnu"

    install -D "$_bin_folder/lianad" "$pkgdir/usr/bin/lianad"
    install -D "$_bin_folder/liana-cli" "$pkgdir/usr/bin/liana-cli"
    install -D "$_bin_folder/liana-gui" "$pkgdir/usr/bin/liana-gui"
}
