# Maintainer: niyanhhhhh <2093615664@qq.com>

pkgname=mvnd
pkgver=0.5.2
pkgrel=1
pkgdesc="Maven Deamon, which aims at providing faster Maven builds using techniques known from Gradle and Takari."
arch=(x86_64)
url=https://github.com/mvndaemon/mvnd
license=('Apache')
depends=('java-environment>=7' 'bash' 'maven')
source=("${pkgname}-${pkgver}.zip::https://github.com/mvndaemon/mvnd/releases/download/${pkgver}/${pkgname}-${pkgver}-linux-amd64.zip")
sha256sums=('55201c347a95a6df7600d988cc3ab71323f5eef627a1a3e9808ed2212c5a0987')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p"${pkgdir}/usr/share/java/${pkgname}/bin"
    mkdir -p"${pkgdir}/usr/share/java/${pkgname}/conf"
    mkdir -p"${pkgdir}/usr/share/java/${pkgname}/mvn/bin"
    mkdir -p"${pkgdir}/usr/share/java/${pkgname}/mvn/lib/ext"
    mkdir -p"${pkgdir}/usr/share/java/${pkgname}/mvn/conf/logging"

    cd "${srcdir}"

    install -dm755 bin/*.* "${pkgdir}/usr/share/java/${pkgname}/bin/"
    install -dm755 conf/*.* "${pkgdir}/usr/share/java/${pkgname}/conf/"
    install -dm755 conf/*.* "${pkgdir}/usr/share/java/${pkgname}/conf/"
    install -dm755 mvn/bin/*.* "${pkgdir}/usr/share/java/${pkgname}/mvn/bin/"
    install -dm755 mvn/conf/*.* "${pkgdir}/usr/share/java/${pkgname}/mvn/conf/"
    install -dm755 mvn/conf/logging/*.* "${pkgdir}/usr/share/java/${pkgname}/mvn/conf/logging/"
    install -dm755 mvn/lib/ext/*.* "${pkgdir}/usr/share/java/${pkgname}/mvn/lib/ext/"

    install -dm755 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    install -dm755 NOTICE.txt "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE.txt"
    install -dm755 mvn/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/mvn/LICENSE"
    install -dm755 mvn/NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/mvn/NOTICE"
    install -dm755 mvn/README.txt "${pkgdir}/usr/share/licenses/${pkgname}/mvn/README.txt"
    install -dm755 bin/mvnd-bash-completion.bash "${pkgdir}/usr/share/bash-completion/completions/mvnd"

    ln -s "${pkgdir}/usr/share/java/${pkgname}/bin/mvnd" "${pkgdir}/usr/bin/mvnd"
}
