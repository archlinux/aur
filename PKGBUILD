# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

java_=11
pkgname="jdk${java_}-graalvm-bin"
pkgver=19.3.1
pkgrel=2
pkgdesc="Universal virtual machine for running applications written in a variety of languages (JVM-based, LLVM-based, or other), Java ${java_} version"
arch=('x86_64'
      'aarch64')
url='https://www.graalvm.org/'
license=('custom')
depends=('java-runtime-common'
         'java-environment-common')
makedepends=()
provides=("java-runtime=${java_}"
          "java-environment=${java_}")
options=('staticlibs')
install="$pkgname.install"
source_x86_64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${pkgver}/graalvm-ce-java${java_}-linux-amd64-${pkgver}.tar.gz")
source_aarch64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${pkgver}/graalvm-ce-java${java_}-linux-aarch64-${pkgver}.tar.gz")
sha256sums_x86_64=('691f0577c75c4ba0fb50916087925e6eb8a5a73de51994a37eee022d1e2c9e7d')
sha256sums_aarch64=('5c774ec6158ddf3c66488e6b6c6fe6db4e244f0eac08d2b48804cc2ec74845e0')

package() {
    cd "graalvm-ce-java${java_}-${pkgver}"
    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/" *
    install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
