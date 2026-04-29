# Maintainer: Darian Alberto Camacho Salas <xonidu@gmail.com>
# Contributor: XONIDU <xonidu@gmail.com>

pkgname=xonimet
pkgver=2.1.0
pkgrel=1
pkgdesc="Extractor universal de metadatos para fotos, audio, video y documentos. Genera reportes PDF."
arch=('any')
url="https://github.com/XONIDU/xonimet"
license=('MIT')
depends=(
    'python'
    'python-pillow'
    'python-mutagen'
    'python-pypdf2'
    'python-docx'            # <--- CORRECTO
    'python-openpyxl'
    'python-pptx'            # <--- CORRECTO
    'python-exifread'
    'python-reportlab'
)
optdepends=('ffmpeg: necesario para extraer metadatos de videos')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/XONIDU/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    
    # Instalar binario principal
    install -Dm755 start.py "$pkgdir/usr/bin/${pkgname}"
    
    # Instalar programa principal
    install -Dm755 xonimet.py "$pkgdir/usr/share/${pkgname}/${pkgname}.py"
    
    # Instalar documentacion
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
