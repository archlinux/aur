# Maintainer: Vrn <seu@email.com>
pkgname=hytale-mod-manager
pkgver=2.1.1
pkgrel=1
pkgdesc="Gerenciador de Mods CLI moderno, automático e estiloso para Hytale"
arch=('any')
url="https://github.com/jdkeditor/hytale-mod-manager"
license=('MIT')
depends=('bash' 'gum' 'inotify-tools' 'unzip' 'libnotify' 'p7zip')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('80220de290eee8436985dfa8a5df356e35956a8bb38b80e9e6f13389d0ad59c1')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Instala scripts
    install -Dm755 setup.sh  "${pkgdir}/opt/${pkgname}/setup.sh"
    install -Dm755 daemon.sh "${pkgdir}/opt/${pkgname}/daemon.sh"
    install -Dm644 LICENSE   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Comando global hytalemm aponta pro setup.sh
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/setup.sh" "${pkgdir}/usr/bin/hytalemm"
}
