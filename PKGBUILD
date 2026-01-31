# Maintainer: Robert Greener <dev@greener.sh>
pkgname=microsoft-openjdk-17-bin
pkgver=17.0.18
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
options=('!strip')

package() {
    mkdir -p "$pkgdir/usr/lib/jvm"
    cp -a "jdk-$pkgver"* "$pkgdir/usr/lib/jvm/java-17-microsoft-openjdk"
}

sha256sums=('0b0bc896d89a1741bbf3e7525addf9280b1aa3e13abb3183d19d98c0f2fbd1cc'
            'SKIP')
