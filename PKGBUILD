# Maintainer: Vrn <seu@email.com>
pkgname=hytale-mod-manager
pkgver=2.0.0
pkgrel=1
pkgdesc="Gerenciador de Mods CLI moderno, automático e estiloso para Hytale"
arch=('any')
url="https://github.com/jdkeditor/hytale-mod-manager"
license=('MIT')
depends=('bash' 'gum' 'inotify-tools' 'unzip' 'libnotify' 'p7zip')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5bb3e7e4b6a246631971e425dd3d1f0519f0fdfcbc9a2ef941f4bbd6e2369757')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Instala scripts
    install -Dm755 setup.sh  "${pkgdir}/opt/${pkgname}/setup.sh"
    install -Dm755 daemon.sh "${pkgdir}/opt/${pkgname}/daemon.sh"
    install -Dm644 LICENSE   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Comando global hytalemm aponta pro setup.sh
    ln -s "/opt/${pkgname}/setup.sh" "${pkgdir}/usr/bin/hytalemm"
}
