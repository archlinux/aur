# Maintainer: Robert Greener <dev@greener.sh>
pkgname=microsoft-openjdk-21-bin
pkgver=21.0.3
pkgrel=1
pkgdesc='Microsoft build of OpenJDK'
arch=('x86_64')
url='https://www.microsoft.com/openjdk'
license=('GPL-2.0-only')
depends=('java-runtime-common' 'java-environment-common')
provides=(
    'java-runtime-headless=21'
    'java-runtime=21'
    'java-environment=21'
)
source=("https://aka.ms/download-jdk/microsoft-jdk-$pkgver-linux-x64.tar.gz"{,.sig})
validpgpkeys=('B602433384B8991302924D8235531D315B21C189')

package() {
    mkdir -p "$pkgdir/usr/lib/jvm"
    cp -a "jdk-$pkgver"* "$pkgdir/usr/lib/jvm/java-21-microsoft-openjdk"
}

sha256sums=(
    'b535a58db80aeb5cc0d5e85ae6cb3f621d7f269ca1b36832f1aed3842cede4f4'
    'SKIP'
)
