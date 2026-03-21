# Maintainer: Vrn <seu@email.com>
pkgname=hytale-mod-manager
pkgver=2.1.0
pkgrel=1
pkgdesc="Gerenciador de Mods CLI moderno, automático e estiloso para Hytale"
arch=('any')
url="https://github.com/jdkeditor/hytale-mod-manager"
license=('MIT')
depends=('bash' 'gum' 'inotify-tools' 'unzip' 'libnotify' 'p7zip')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('153791037c9e0a490d1f192deca485491170c3af1aa5d565d35e3476c1ad0e49')

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
