# Maintainer: splatch

pkgname=mvnd
pkgver=1.0.2
pkgrel=2
pkgdesc="Maven Deamon, which aims at providing faster Maven builds using techniques known from Gradle and Takari."
arch=(x86_64 )
conflicts=(mvnd2)
provides=(mvnd)
url=https://github.com/apache/maven-mvnd
license=('Apache')
depends=('java-environment>=7' 'bash' 'maven')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/apache/maven-mvnd/releases/download/${pkgver}/maven-mvnd-${pkgver}-linux-amd64.tar.gz")
sha256sums=('a5990f4cfd4aa3307a4c5c86d6cfdd13a0bd394a6b07c6bb64efa7decb342205')
install=.install

package() {
    # mkdir -p "${pkgdir}/usr/bin"
    # mkdir -p "${pkgdir}/usr/share/java/${pkgname}"
    # mkdir -p "${pkgdir}/usr/share/java/${pkgname}/bin"
    # mkdir -p "${pkgdir}/usr/share/java/${pkgname}/mvn/bin"
    # mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/mvn"
    # mkdir -p "${pkgdir}/usr/share/bash-completion/completions"

    # cd "${srcdir}/maven-mvnd-${pkgver}-linux-amd64"

    # install -m755 bin/*.* "${pkgdir}/usr/share/java/${pkgname}/bin/"
    # install -m755 boot/*.* "${pkgdir}/usr/share/java/${pkgname}/boot/"
    # #install -m755 conf/*.* "${pkgdir}/usr/share/java/${pkgname}/conf/"
    # install -m755 lib/*.* "${pkgdir}/usr/share/java/${pkgname}/lib/"
    # #install -m755 bin/mvnd "${pkgdir}/usr/share/java/${pkgname}/bin/"
    # #install -m755 mvn/bin/*.* "${pkgdir}/usr/share/java/${pkgname}/mvn/bin/"
    # cp -r conf "${pkgdir}/usr/share/java/${pkgname}"
    # #cp -r mvn "${pkgdir}/usr/share/java/${pkgname}"

    # install LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    # install NOTICE.txt "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE.txt"
    # install mvn/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/mvn/LICENSE"
    # install mvn/NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/mvn/NOTICE"
    # install mvn/README.txt "${pkgdir}/usr/share/licenses/${pkgname}/mvn/README.txt"
    # install bin/mvnd-bash-completion.bash "${pkgdir}/usr/share/bash-completion/completions/mvnd"

    # ln -s "/usr/share/java/${pkgname}/bin/mvnd" "${pkgdir}/usr/bin/mvnd"
    # ln -s "/usr/share/java/${pkgname}/bin/mvn-sync" "${pkgdir}/usr/bin/mvn-sync"

  #install -Dm 755 ../maven.sh -t "${pkgdir}/etc/profile.d"

  install -d "${pkgdir}/opt/mvnd"
  bsdtar xf mvnd-${pkgver}.tar.gz \
    --strip-components=1 \
    -C "${pkgdir}/opt/mvnd"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/mvnd/bin/mvnd "${pkgdir}/usr/bin/mvnd"
}

