# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=csbooks
pkgver=5.8.1
pkgrel=1
pkgdesc='A smart solution to manage all your PDF, EPUB and MOBI files'
arch=('x86_64')
url='https://caesiumstudio.com/csbooks'
license=('custom')
depends=('gtk3'
         'nss'
         'libxss')
source=("${pkgname}-${pkgver}.pacman::https://github.com/caesiumstudio/csBooks-updates/releases/download/v${pkgver}/csBooks-${pkgver}.pacman"
        'LICENSE')
noextract=("${pkgname}-${pkgver}.pacman")
sha256sums=('fb23fdfcdf5348448ee20c816a56c66b33011c186216dbe440362db34e006db1'
            'c8d3a419a16631576fc8cc9d530311e4b9c4e1fb5331048cfe81a98b9c8b66fb')

package() {
  tar xvf "${pkgname}-${pkgver}.pacman" -C "${pkgdir}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  find "${pkgdir}" -type f -name ".*" -exec rm {} +
}
