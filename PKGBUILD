# Maintainer: AnabasaSoft <anabasasoft@gmail.com>
pkgname=cloudmount-wizard-bin
_pkgname=cloudmount-wizard
pkgver=1.0.1
pkgrel=1
pkgdesc="Asistente para montar unidades de nube (Mega, Drive, etc) en Linux (Binario)"
arch=('x86_64')
url="https://github.com/AnabasaSoft/CloudMount-Wizard"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('rclone' 'fuse3' 'libglvnd' 'libx11' 'libxcursor' 'libxrandr' 'libxinerama' 'libxi' 'libxkbcommon' 'wayland')
# Usamos el tar.gz que genera tu GitHub Action
source=("$url/releases/download/v$pkgver/cloudmount-linux-amd64.tar.gz")
# IMPORTANTE: Aquí debes poner el hash SHA256 real del archivo. Pon 'SKIP' para probar localmente,
# pero para subirlo a AUR necesitas el hash real.
sha256sums=('ada97b89882794bb2d207011de02ced6f942486fb4150f766363f1450f6c552c')

package() {
    # Instalar el binario en /usr/bin
    # Nota: Tu GitHub Action empaqueta el binario con el nombre "CloudMount-Wizard" dentro del tar
    install -Dm755 "${srcdir}/CloudMount-Wizard" "${pkgdir}/usr/bin/${_pkgname}"

    # (Opcional) Si en el futuro incluyes el icono y el .desktop en el tar.gz,
    # deberías instalarlos aquí también en /usr/share/...
}
