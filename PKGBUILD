# Maintainer: Darian Alberto Camacho Salas <xonidu@gmail.com>
pkgname=xonitube
pkgver=6.4.1
pkgrel=1
pkgdesc="Reproductor de YouTube desde terminal para equipos de bajos recursos (1GB RAM). Streaming directo o descarga."
arch=('any')
url="https://github.com/XONIDU/xonitube"
license=('MIT')
depends=('python' 'mpv' 'yt-dlp')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/XONIDU/xonitube/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # Instalar start.py como ejecutable principal
  install -Dm755 start.py "$pkgdir/usr/bin/$pkgname"
  
  # Instalar xonitube.py en /usr/share/xonitube/
  install -Dm755 xonitube.py "$pkgdir/usr/share/$pkgname/xonitube.py"
  
  # Crear enlace simbólico para compatibilidad
  ln -sf "/usr/share/$pkgname/xonitube.py" "$pkgdir/usr/bin/xonitube.py"
  
  # Documentación
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 requirements.txt "$pkgdir/usr/share/doc/$pkgname/requirements.txt"
}
