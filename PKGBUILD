# Maintainer: Darian Alberto Camacho Salas <xonidu@gmail.com>

pkgname=xonimet
pkgver=2.1.0
pkgrel=8
pkgdesc="Extractor universal de metadatos para fotos, audio, video y documentos. Genera reportes PDF."
arch=('any')
url="https://github.com/XONIDU/xonimet"
license=('MIT')
depends=('python' 'python-pip' 'ffmpeg')
makedepends=()
optdepends=('ffmpeg: necesario para extraer metadatos de videos')
source=("$pkgname-$pkgver.tar.gz::https://github.com/XONIDU/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Instalar binario principal
    install -Dm755 start.py "$pkgdir/usr/bin/$pkgname"
    
    # Instalar modulo principal
    install -Dm755 xonimet.py "$pkgdir/usr/share/$pkgname/$pkgname.py"
    
    # Crear directorio de documentacion
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
}
