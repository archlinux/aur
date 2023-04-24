# Maintainer: koonix <ehsan at disroot dot org>
_pkgname='lfutils'
pkgname="${_pkgname}-git"
pkgver=r96.8149768
pkgrel=3
pkgdesc='Scripts and utilities for the lf file manager.'
url='https://github.com/koonix/lfutils'
source=("git+${url}.git")
arch=('x86_64')
license=('GPL')
makedepends=('git')
depends=('lf')
optdepends=(
    'archivemount: mounting and opening archives via lfmount'
    'ueberzug: image previews'
    'chafa: previewing images outside graphical environments'
    'imagemagick: previewing svg files'
    'gnome-epub-thumbnailer: previewing epub ebooks'
    'ffmpegthumbnailer: previewing video thumbnails'
    'poppler: previewing PDF files'
    'atool: previewing archive contents'
    'bat: previewing plain text and code'
    'mediainfo: previewing info about music/media files'
    'binutils: previewing object files'
    'libcdio: previewing ISO files'
    'catdoc: previewing Microsoft document files'
    'docx2txt: previewing docx files'
    'odt2txt: previewing OpenDocument files'
    'transmission-cli: previewing .torrent files'
)
md5sums=('SKIP')
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
