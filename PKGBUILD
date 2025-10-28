# Maintainer: coderkun <olli@suruatoel.xyz>
pkgname=sonarlint-ls-bin
arch=('x86_64')
url=https://github.com/SonarSource/sonarlint-language-server
pkgver=4.4.0
pkgrel=1
_vscodeVersion=4.34.0
_vscodeBuild=78640
pkgdesc="SonarLint language server (used by SonarLint VSCode)"
license=('LGPLv3')
depends=('java-runtime>=17')
conflicts=('sonarlint-ls')
source=("https://github.com/SonarSource/sonarlint-vscode/releases/download/${_vscodeVersion}%2B${_vscodeBuild}/sonarlint-vscode-${_vscodeVersion}.vsix" 'sonarlint-ls')
sha256sums=('bc8f3d7f1dd706ed49cec0316f106d1d5cb37399b400d2b3f9e4a6221eab4c27' 'b951d9b6f1e1f9f70430776d958487b385cc8290c0a48335d938b3128e1a80c4')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install "sonarlint-ls" "${pkgdir}/usr/bin/sonarlint-ls"
    mkdir -p "${pkgdir}/usr/share/java/sonarlint-ls"
    install "extension/server/sonarlint-ls.jar" "${pkgdir}/usr/share/java/sonarlint-ls/sonarlint-ls.jar"

    mkdir -p "${pkgdir}/usr/share/java/sonarlint-ls/analyzers"
    install "extension/analyzers/csharpenterprise.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "extension/analyzers/sonarcsharp.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "extension/analyzers/sonargo.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "extension/analyzers/sonarhtml.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "extension/analyzers/sonariac.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "extension/analyzers/sonarjava.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "extension/analyzers/sonarjavasymbolicexecution.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "extension/analyzers/sonarjs.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "extension/analyzers/sonarlintomnisharp.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "extension/analyzers/sonarphp.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "extension/analyzers/sonarpython.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "extension/analyzers/sonartext.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "extension/analyzers/sonarxml.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
}
