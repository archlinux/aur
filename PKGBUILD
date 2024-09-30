# Maintainer: Gregorio Aranda <tw.emmmm@gmail.com>

pkgname=mobirise
pkgver=5.9.18
pkgrel=1
pkgdesc="Mobirise Website Builder - Offline Website Builder"
arch=('x86_64')
url="https://mobirise.com/"
license=('custom')
depends=('libnotify' 'nss' 'gtk3')
source=("MobiriseSetup.deb::https://download.mobirise.com/MobiriseSetup.deb")
sha256sums=('68c49c9a6ecc0eafe16732bbc34a2c7f78e9c0a8bb46bf1079cfd3cbaba859e8')

package() {
    # Extraer el archivo .deb
    bsdtar -xf data.tar.xz -C "$pkgdir/"
    
    # Establecer permisos para los archivos de ejecución
    chmod +x "$pkgdir/opt/Mobirise/mobirise"
    
    # Crear symlink en /usr/bin para que sea ejecutable desde cualquier lugar
    install -d "$pkgdir/usr/bin"
    ln -s /opt/Mobirise/mobirise "$pkgdir/usr/bin/mobirise"
}
