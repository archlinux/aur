# Maintainer: Stokes <jesusmanuelgonzalezmeneses18@gmail.com>

pkgname=conversor-dolphin
pkgver=1.3.1
pkgrel=2
pkgdesc="Dolphin (KF6) service menu to manage PDF and convert PDF, images, SVG, audio, video, e-books and office files"
arch=('any')
url="https://github.com/13Stokes31/conversor-dolphin"
license=('MIT')
depends=('poppler' 'kdialog')
optdepends=('ghostscript: comprimir PDF'
            'img2pdf: convertir imágenes a PDF (sin pérdida)'
            'imagemagick: convertir entre formatos de imagen (JPG/PNG/WebP/AVIF/TIFF, HEIC…)'
            'libheif: leer HEIC/HEIF y escribir AVIF en imagemagick'
            'ffmpeg: convertir audio y vídeo'
            'librsvg: convertir SVG a PNG/PDF'
            'calibre: convertir libros electrónicos (EPUB/MOBI/AZW…) a PDF'
            'libreoffice-still: convertir documentos de oficina a PDF (o libreoffice-fresh)'
            'ocrmypdf: OCR, añadir capa de texto buscable a un PDF (AUR)'
            'tesseract-data-spa: datos de OCR en español')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b30b0def6f4522be2aa7b02bc00ed92f04224e85dcd3c1ca77f4122c7fae8f18')

package() {
    make -C "$srcdir/$pkgname-$pkgver" DESTDIR="$pkgdir" PREFIX=/usr install
}
