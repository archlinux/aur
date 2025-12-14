# Maintainer: Robert Greener <dev@r0bert.dev>
pkgname=microsoft-openjdk-25-bin
pkgver=25.0.1
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
    cp -a "jdk-$pkgver"* "$pkgdir/usr/lib/jvm/java-25-microsoft-openjdk"
}

sha256sums=('1186ada3f51f6517f46edfbca06ab21c692f3d95f7abe403691f85267eb0c3aa'
            'SKIP')
