pkgname=boot-repair-andres
pkgver=0.1.2
pkgrel=1
pkgdesc="Swiss-army live rescue tool: GRUB repair, display reset, initramfs, kernel, system update, boot freedom, diagnostics."
arch=('any')
license=('MIT')
depends=('bash' 'git')
makedepends=('git')
# **AÑADIR:** Incluimos el archivo .desktop en la lista de fuentes
source=("git+https://github.com/AndresDev859674/boot-repair.git"
        "boot-repair-andres.desktop")
url="https://github.com/AndresDev859674/boot-repair"
sha256sums=('SKIP'
            'SKIP') # Añade un 'SKIP' extra para el nuevo archivo source
optdepends=('git: For Update and Others Things')

package() {
    # 1. Instalación del binario (sin cambios)
    install -Dm755 "$srcdir/boot-repair/boot-repair.sh" \
        "$pkgdir/usr/bin/boot-repair"

    # 2. Instalación del archivo Desktop Entry **(NUEVO)**
    # El archivo .desktop debe ir a /usr/share/applications/
    install -Dm644 "$srcdir/boot-repair-andres.desktop" \
        "$pkgdir/usr/share/applications/boot-repair-andres.desktop"
}
