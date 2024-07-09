# Maintainer: coderkun <olli@suruatoel.xyz>
pkgname=sonarlint-ls-bin
arch=('x86_64')
url=https://github.com/SonarSource/sonarlint-vscode
pkgver=3.7.0
pkgrel=1
_vscodeVersion=4.7.0
_vscodeBuild=76532
pkgdesc="SonarLint language server (used by SonarLint VSCode)"
license=('LGPLv3')
depends=('java-runtime>=17')
conflicts=('sonarlint-ls')
source=("https://github.com/SonarSource/sonarlint-vscode/releases/download/${_vscodeVersion}%2B${_vscodeBuild}/sonarlint-vscode-${_vscodeVersion}.vsix" 'sonarlint-ls')
sha256sums=('f6d4a4cc148d2b8050b6560f08cfca0e9c77304666debab3a167e7f7c090a64a' 'b951d9b6f1e1f9f70430776d958487b385cc8290c0a48335d938b3128e1a80c4')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install "sonarlint-ls" "${pkgdir}/usr/bin/sonarlint-ls"
    mkdir -p "${pkgdir}/usr/share/java/sonarlint-ls"
    install "extension/server/sonarlint-ls.jar" "${pkgdir}/usr/share/java/sonarlint-ls/sonarlint-ls.jar"

    mkdir -p "${pkgdir}/usr/share/java/sonarlint-ls/analyzers"
    install "extension/analyzers/sonarcfamily.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "extension/analyzers/sonargo.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "extension/analyzers/sonarhtml.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "extension/analyzers/sonariac.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "extension/analyzers/sonarjava.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "extension/analyzers/sonarjs.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "extension/analyzers/sonarlintomnisharp.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "extension/analyzers/sonarphp.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "extension/analyzers/sonarpython.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "extension/analyzers/sonartext.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "extension/analyzers/sonarxml.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
}
