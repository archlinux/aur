# Maintainer: Michael Migliore <mcmigliore+aur@gmail.com>

pkgname=mdl-sdk
pkgver=2019.1.1
pkgrel=1
pkgdesc="A set of tools to integrate MDL support into rendering applications."
arch=('x86_64')
url="https://developer.nvidia.com/mdl-sdk"
license=('custom:NVIDIA')
depends=('cuda')
makedepends=('unzip')
options=(!strip)
_dirname="mdl-sdk-317500.2554"
_archive="$_dirname.zip"
source=("file://$_archive")
sha512sums=('5e957bc430870739a3a2e85a1081d8ab08b715cfdda679459f6fc20c244d60cbe927ea6cbea9abf1970e5c7dacc7a89684cb5549fc10f8580ed885a298fdc920')

if ! [ -f $_archive ]; then
    msg2 "Please manually download $_archive to $PWD from $url."
    exit 1
fi

package() {
    mkdir -p "$pkgdir/opt/mdl-sdk"
    unzip -o $_archive
    cd "$_dirname"
    cp -R include "$pkgdir/opt/mdl-sdk"
    cd "linux-x86-64"
    cp -R . "$pkgdir/opt/mdl-sdk"
}
