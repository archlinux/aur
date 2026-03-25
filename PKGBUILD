# Maintainer: lautaro <tu-email>
pkgname=mi-paquete-especial
pkgver=6.14
pkgrel=1
pkgdesc="Archivo de configuración para el kernel Silvermont (txt)"
arch=('any') # 'any' porque un .txt funciona en cualquier arquitectura
url="https://github.com/Lauta-dev/linux-tkg"
license=('GPL')
source=("kernelconfig.arch.txt::https://github.com/Lauta-dev/linux-tkg/releases/download/kernel-6.14-silvermont-3/kernelconfig.arch.txt")

# Para obtener este hash, corre 'makepkg -g'

package() {
  # 1. Creamos la carpeta de destino en el "falso root"
  # Usamos /usr/share/doc/nombre-paquete que es el estándar para textos
  install -d "$pkgdir/usr/share/doc/$pkgname"

  # 2. Instalamos el archivo con permisos de lectura (644)
  install -m644 "$srcdir/kernelconfig.arch.txt" "$pkgdir/usr/share/doc/$pkgname/kernelconfig.txt"
}
sha256sums=('a2f99d333e74b43ba5b52debfbfa4f1ce1f5aff02db28ded527cbf75d4b27f2b')
