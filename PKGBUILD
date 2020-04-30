# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

# You need to manually download the .deb file and place it where this 
#  PKGBUILD is located, since FossHub does not allow static linking.
# `https://www.fosshub.com/CudaText.html?dwl=cudatext_1.98.0.0-1_gtk2_amd64.deb`

pkgname=cudatext-gtk2-bin
pkgver=1.98.0
pkgrel=1
pkgdesc="Cross-platform text editor, written in Lazarus"
arch=('x86_64')
url="http://uvviewsoft.com/cudatext/"
license=('MPL-2.0')
depends=('python')
provides=('cudatext')
options=('!strip')
source=("local://${pkgname%-gtk2-bin}_${pkgver}.0-1_gtk2_amd64.deb")
sha256sums=('4cd2ae951a60d49147d104a7ad8938d5514d06c26af5942bdd9c5dd72d515bdc')

package() {
  tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /usr/share/licenses/common/MPL2/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}