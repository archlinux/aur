# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

pkgname_=graal
pkgname=${pkgname_}-bin
pkgver_=19.2.0
pkgver=${pkgver_/-/_}
pkgrel=1
pkgdesc='Universal virtual machine for running applications written in a variety of languages (JVM-based, LLVM-based, or other)'
arch=('x86_64')
url='https://www.graalvm.org/'
license=('custom')
depends=('java-runtime-common'
         'java-environment-common')
makedepends=()
optdepends=('graal-native-image: plugin to generate native binary images (used to be bundled with this package before the 19.0.0 release)')
provides=('java-runtime=8'
          'java-environment=8'
          "$pkgname_")
conflicts=("$pkgname_")
install="$pkgname.install"
source=("https://github.com/oracle/$pkgname_/releases/download/vm-${pkgver_}/graalvm-ce-linux-amd64-${pkgver_}.tar.gz")
sha256sums=('9d8a82788c3aaede4a05366f79f8b0b328957d0bb7479c986f6f1354b1c7c4ea')

package() {
    cd "${pkgname_}vm-ce-${pkgver_}"
    mkdir -p "$pkgdir/usr/lib/jvm/java-8-graal/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-8-graal/" *
    install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
