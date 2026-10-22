# Maintainer:
# Contributor: mybluevan <mybluevan at gmail dot com>
# Contributor: blx32 <develop at srmoura dot com dot br>

pkgname=mementodb
pkgver=3.11.0
pkgrel=1
pkgdesc='A complex, easy-to-use and customizable solution for database management'
arch=('x86_64')
url='https://mementodatabase.com'
license=('LicenseRef-MementoDBInc')
depends=('alsa-lib' 'glibc' 'java-runtime' 'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst' 'zlib')
options=('!docs' '!strip')
source=("https://download.mementodb.com/${pkgname}-${pkgver}-linux.deb")
sha256sums=('e3389b5ac1257d0ec26ae0f519327d1c7c5848d5656a58ecf4ad787ff2e2bdbc')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/${pkgname}/lib/mementodb-mementodb.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${pkgdir}/opt/${pkgname}/lib/app/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
