# Maintainer: pedrodev2025 <pedrolucasinvestidor.github@gmail.com>

pkgname=navegadorpytech
pkgver=0.3
pkgrel=1
pkgdesc="Um navegador web simples e leve baseado em PyQt5 e QtWebEngine."
arch=('x86_64')
url="https://github.com/pedrodev2025/Navegador-B-sico-E-Leve-Com-Python-"
license=('GPL')
depends=(
    'qt5-webengine'
    'glibc'
)

# APONTANDO PARA OS ARQUIVOS INDIVIDUAIS NO GITHUB RELEASES
# Formato: https://github.com/USUARIO/REPOSITORIO/releases/download/TAG/NOME_DO_ARQUIVO_ANEXADO
# Certifique-se de que a TAG no GitHub é exatamente '0.3' (sem 'v') para a sua pkgver
source=(
    "https://github.com/pedrodev2025/Navegador-B-sico-E-Leve-Com-Python-/releases/download/${pkgver}/navegadorpytech"
    "https://github.com/pedrodev2025/Navegador-B-sico-E-Leve-Com-Python-/releases/download/${pkgver}/navegador.desktop"
    "https://github.com/pedrodev2025/Navegador-B-sico-E-Leve-Com-Python-/releases/download/${pkgver}/browser-icon.png"
)

# Gerar estes checksums um por um.
# Exemplo: `sha256sum navegadorpytech` no diretório onde os arquivos são baixados.
sha256sums=('b99d1cb41499879bd205e645177984fe8b4aebd51a20b79b3d380a0921042977'
            'a421db782d3e30460e3e15ddb6dece919ab26676ef2f577146458ca4da03b825'
            '1b5ce199f8ac63d238cc40418d0337edf355fa75ae1eb3f0c7d0d2b216edceb2')

build() {
    # Não há nada para compilar, estamos usando binários pré-compilados.
    :
}

package() {
    # Os arquivos baixados estarão diretamente em ${srcdir} (seu diretório de build temporário)

    # Crie os diretórios de instalação
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/pixmaps"

    # Copie o executável do PyInstaller
    install -m755 "${srcdir}/navegadorpytech" "${pkgdir}/usr/bin/"

    # Copie o arquivo .desktop
    install -m644 "${srcdir}/navegador.desktop" "${pkgdir}/usr/share/applications/"

    # Copie o ícone
    install -m644 "${srcdir}/browser-icon.png" "${pkgdir}/usr/share/pixmaps/browser-icon.png"
}
