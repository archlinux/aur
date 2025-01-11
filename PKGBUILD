pkgname=redondo
pkgver=1.0
pkgrel=1
pkgdesc="Programa que muestra una frase aleatoria de Los Redondos"
arch=('any')
url="https://github.com/arokzZz/redondo.git"
license=('GPL')
depends=()
source=("redondo" "frases.pr")
sha256sums=('SKIP' 'SKIP')  # Se puede calcular el hash si es necesario

prepare() {
  # Aquí podrías agregar algún paso de preparación si es necesario
  return 0
}

build() {
  # No necesitamos compilar nada, solo instalar
  return 0
}

package() {
  # Instala el archivo redondo en /usr/bin/
  install -Dm755 "$srcdir/redondo" "$pkgdir/usr/bin/redondo"
  
  # Asegúrate de que el archivo redondo tenga permisos de ejecución
  chmod +x "$pkgdir/usr/bin/redondo"
  
  # Instala el archivo frases.pr
  install -Dm644 "$srcdir/frases.pr" "$pkgdir/usr/share/redondo/frases.pr"
}
