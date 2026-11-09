pkgname="way-ocr-git"
_gitname=way-ocr
pkgver=0.1.0.r8.7622c4a
pkgrel=1
pkgdesc="Lightning-fast, zero-dependency Screen OCR and text extractor for Wayland"
arch=('x86_64')
url="https://github.com/apravint/way-ocr"
license=('MIT')
depends=('slurp' 'grim' 'tesseract' 'wl-clipboard' 'libnotify')
makedepends=('git')
provides=('way-ocr')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$_gitname"
    echo 0.1.0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd "$_gitname"
    install -D -m755 ./bin/way-ocr "$pkgdir/usr/bin/way-ocr"
}
