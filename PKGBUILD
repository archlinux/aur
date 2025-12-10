pkgname=iscsi-util
pkgver=1.0.1
pkgrel=1
arch=('x86_64')
license=('MIT')
depends=('open-iscsi')
source=("https://github.com/mijocecr/Iniciador-iSCSI-GUI-Manjaro/releases/download/${pkgver}/ISCSI-Util.tar.gz"
        "iscsi-util.desktop")
sha256sums=('SKIP'
            'SKIP')

package() {
  # Crear directorio para librerías
  install -d "$pkgdir/usr/lib/iscsi-util"

  # Copiar binario único self-contained
  install -Dm755 "$srcdir/ISCSI-Util" "$pkgdir/usr/lib/iscsi-util/ISCSI-Util"

  # Crear directorio para binarios y enlace simbólico
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/iscsi-util/ISCSI-Util "$pkgdir/usr/bin/iscsi-util"

  # Integración con el sistema
  install -Dm644 "$srcdir/iscsi-util.desktop" "$pkgdir/usr/share/applications/iscsi-util.desktop"
  install -Dm644 "$srcdir/iscsi-util.png" "$pkgdir/usr/share/pixmaps/iscsi-util.png"
}
