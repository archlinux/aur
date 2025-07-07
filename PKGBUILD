# Maintainer: Robert Greener <dev@greener.sh>
pkgname=microsoft-openjdk-17-bin
pkgver=17.0.15
pkgrel=1
pkgdesc='Microsoft build of OpenJDK'
arch=('x86_64')
url='https://www.microsoft.com/openjdk'
license=('GPL-2.0-only')
depends=('java-runtime-common' 'java-environment-common')
provides=(
    'java-runtime-headless=17'
    'java-runtime=17'
    'java-environment=17'
)
source=("https://aka.ms/download-jdk/microsoft-jdk-$pkgver-linux-x64.tar.gz"{,.sig})
validpgpkeys=('B602433384B8991302924D8235531D315B21C189')

package() {
    mkdir -p "$pkgdir/usr/lib/jvm"
    cp -a "jdk-$pkgver"* "$pkgdir/usr/lib/jvm/java-17-microsoft-openjdk"
}

sha256sums=(
    'e7029853d3e9d3dde090aa65dc2386c6e9cb0a41028fea41e48c866a958eba03'
    'SKIP'
)
