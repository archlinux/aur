# Maintainer: Vrn <eversonsilva2087@proton.me>
pkgname=hytale-mod-manager
pkgver=1.0.4
pkgrel=1
pkgdesc="Gerenciador de Mods CLI moderno, automático e estiloso para Hytale"
arch=('any')
url="https://github.com/jdkeditor/hytale-mod-manager"
license=('MIT')
depends=('bash' 'gum' 'inotify-tools' 'unzip' 'libnotify')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5b58f083f872568ed8b220bf518d8142dc28129ec7606a7b84b1e9ddfa91e7f3')

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
