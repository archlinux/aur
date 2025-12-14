# Maintainer: Robert Greener <dev@greener.sh>
pkgname=microsoft-openjdk-11-bin
pkgver=11.0.29
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
options=('!strip')

package() {
    mkdir -p "$pkgdir/usr/lib/jvm"
    cp -a "jdk-$pkgver"* "$pkgdir/usr/lib/jvm/java-11-microsoft-openjdk"
}

sha256sums=('013703e991080434979c60c649b1639aa1e08e7937f612545e7d7c3d87cc31e4'
            'SKIP')
