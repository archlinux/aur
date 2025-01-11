pkgname=redondo
pkgver=1.0
pkgrel=1
pkgdesc="Programa que muestra una frase aleatoria de Los Redondos"
arch=('any')
url="https://github.com/arokzZz/redondo.git"
license=('GPL')
depends=()
source=("redondo" "frases.pr")
sha256sums=('SKIP' 'SKIP')  # Puedes calcular el hash si es necesario

prepare() {
  # Si no necesitas ninguna preparación especial, puedes omitir esta sección
  return 0
}

build() {
  # No necesitamos compilar nada, solo instalar los archivos
  return 0
}

package() {
  # Verifica el contenido del directorio de trabajo antes de proceder con la instalación
  echo "Archivos en \$srcdir: $(ls -l $srcdir)"
  
  # Asegúrate de que el archivo 'redondo' tiene permisos de ejecución
  chmod +x "$srcdir/redondo"

  # Instala el archivo 'redondo' en /usr/bin/
  install -Dm755 "$srcdir/redondo" "$pkgdir/usr/bin/redondo"

  # Instala el archivo 'frases.pr' en /usr/share/redondo/
  install -Dm644 "$srcdir/frases.pr" "$pkgdir/usr/share/redondo/frases.pr"

  # Verifica los archivos instalados en el directorio de destino
  echo "Archivos en \$pkgdir/usr/bin: $(ls -l $pkgdir/usr/bin)"
  echo "Archivos en \$pkgdir/usr/share/redondo: $(ls -l $pkgdir/usr/share/redondo)"
}
