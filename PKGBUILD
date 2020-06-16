# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=caligator-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="An open source kickass cross platform Calculator with power of alligator"
arch=('x86_64')
url='https://caligator.now.sh/'
license=('MIT')
depends=('gtk3'
         'nss'
         'libxss')
makedepends=('go')
source=("${pkgname}-${pkgver}.deb::https://github.com/teamxenox/caligator/releases/download/v${pkgver}/caligator_${pkgver}-0_amd64.deb"
        'LICENSE::https://github.com/teamxenox/caligator/raw/master/license.md')
sha256sums=('585ff5a3bec7ee4d63deac5e92ce95c7510d249dadf7f3b0c56e35a37a572ce5'
            '6ba160ba903c25295828a3bf510b416b7bddb44d58a9b4b3abe6ec868ac58984')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  cd "${pkgdir}/usr/share/icons/hicolor"
  mv 0x0 1024x1024
  install -Dm644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}