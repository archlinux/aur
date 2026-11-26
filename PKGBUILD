# Maintainer:
# Contributor: mybluevan <mybluevan at gmail dot com>
# Contributor: blx32 <develop at srmoura dot com dot br>

pkgname=mementodb
pkgver=3.12.0
pkgrel=1
pkgdesc='A complex, easy-to-use and customizable solution for database management'
arch=('x86_64')
url='https://mementodatabase.com'
license=('LicenseRef-MementoDBInc')
depends=('alsa-lib' 'glibc' 'java-runtime' 'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst' 'zlib')
options=('!docs' '!strip')
source=("https://download.mementodb.com/${pkgname}-${pkgver}-linux.deb")
sha256sums=('69221c1b82b3757f4fe399a93ebe55cb678f418cd1a9bd08326e5ba0de0ca3fd')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/${pkgname}/lib/mementodb-mementodb.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${pkgdir}/opt/${pkgname}/lib/app/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
