# Maintainer: Robert Greener <dev@greener.sh>
pkgname=microsoft-openjdk-11-bin
pkgver=11.0.28
pkgrel=1
pkgdesc='Microsoft build of OpenJDK'
arch=('x86_64')
url='https://www.microsoft.com/openjdk'
license=('GPL-2.0-only')
depends=('java-runtime-common' 'java-environment-common')
provides=(
    'java-runtime-headless=11'
    'java-runtime=11'
    'java-environment=11'
)
source=("https://aka.ms/download-jdk/microsoft-jdk-$pkgver-linux-x64.tar.gz"{,.sig})
validpgpkeys=('B602433384B8991302924D8235531D315B21C189')

package() {
    mkdir -p "$pkgdir/usr/lib/jvm"
    cp -a "jdk-$pkgver"* "$pkgdir/usr/lib/jvm/java-11-microsoft-openjdk"
}

sha256sums=(
    '281cc487016d4c4adda22fbba4a34c01bc0994a25facf2879175cd1ca002c6c1'
    'SKIP'
)
