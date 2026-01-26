# Maintainer: Vrn <eversonsilva2087@proton.me>
pkgname=hytale-mod-manager
pkgver=1.0.2
pkgrel=1
pkgdesc="Gerenciador de Mods CLI moderno, automático e estiloso para Hytale"
arch=('any')
url="https://github.com/jdkeditor/hytale-mod-manager"
license=('MIT')
depends=('bash' 'gum' 'inotify-tools' 'unzip' 'libnotify')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1953ea97fbc3f773d8a27f05b7a7f05d883e4dad5c4685b15165e109f35ba789')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    # Cria pastas
    install -d "${pkgdir}/opt/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    
    # Instala scripts e permissões
    install -Dm755 setup.sh "${pkgdir}/opt/${pkgname}/setup.sh"
    install -Dm755 daemon.sh "${pkgdir}/opt/${pkgname}/daemon.sh"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Cria o link simbólico
    ln -s "/opt/${pkgname}/setup.sh" "${pkgdir}/usr/bin/hytalemm"
}
