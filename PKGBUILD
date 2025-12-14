# Maintainer: Robert Greener <dev@greener.sh>
pkgname=microsoft-openjdk-21-bin
pkgver=21.0.9
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
options=('!strip')

package() {
    mkdir -p "$pkgdir/usr/lib/jvm"
    cp -a "jdk-$pkgver"* "$pkgdir/usr/lib/jvm/java-21-microsoft-openjdk"
}

sha256sums=('753711b08bc9f404021f292c76d16ffdace1958878b4b911e4fc7c02a537a94f'
            'SKIP')
