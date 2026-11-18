# Maintainer: Stokes <jesusmanuelgonzalezmeneses18@gmail.com>

pkgname=conversor-dolphin
pkgver=1.4.0
pkgrel=1
pkgdesc="Dolphin (KF6) service menu to manage PDF and convert PDF, images, SVG, audio, video, e-books and office files"
arch=('any')
url="https://github.com/13Stokes31/conversor-dolphin"
license=('MIT')
depends=('poppler' 'qpdf' 'kdialog')
optdepends=('ghostscript: comprimir PDF'
            'img2pdf: convertir imágenes a PDF'
            'imagemagick: convertir imágenes y admitir HEIC/HEIF a PDF'
            'libheif: leer HEIC/HEIF y escribir AVIF en imagemagick'
            'ffmpeg: convertir audio y vídeo'
            'librsvg: convertir SVG a PNG/PDF'
            'calibre: convertir libros electrónicos (EPUB/MOBI/AZW…) a PDF'
            'libreoffice-still: convertir documentos de oficina a PDF (o libreoffice-fresh)'
            'ocrmypdf: OCR, añadir capa de texto buscable a un PDF (AUR)'
            'tesseract-data-spa: datos de OCR en español')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c0f2444657a3bfaf6c1c58acf749540c56c2450077c8d15604c1aea8804f21ea')

package() {
    make -C "$srcdir/$pkgname-$pkgver" DESTDIR="$pkgdir" PREFIX=/usr install
}
