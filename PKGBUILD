# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

pkgname_=graal
pkgname=${pkgname_}-bin
pkgver_=1.0.0-rc13
pkgver=${pkgver_/-/_}
pkgrel=1
pkgdesc='Universal virtual machine for running applications written in a variety of languages (JVM-based, LLVM-based, or other)'
arch=('x86_64')
url='https://www.graalvm.org/'
license=('custom')
depends=('java-runtime-common'
         'java-environment-common')
makedepends=()
optdepends=()
provides=('java-runtime=8'
          'java-environment=8'
          "$pkgname_")
conflicts=("$pkgname_")
install="$pkgname.install"
source=("https://github.com/oracle/$pkgname_/releases/download/vm-${pkgver_}/graalvm-ce-${pkgver_}-linux-amd64.tar.gz")
sha256sums=('968eafac0224f8f9fee20b2c2cef526e80326122ba271ff82117efc41fa5fa79')

package() {
    cd "${pkgname_}vm-ce-${pkgver_}"
    mkdir -p "$pkgdir/usr/lib/jvm/java-8-graal/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-8-graal/" *
    install -DTm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
