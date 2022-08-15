# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=csbooks
pkgver=6.6.0
pkgrel=1
pkgdesc='A smart solution to manage all your PDF, EPUB and MOBI files'
arch=('x86_64')
url='https://caesiumstudio.com/csbooks'
license=('custom')
depends=('gtk3'
         'nss'
         'alsa-lib')
source=("${pkgname}-${pkgver}.pacman::https://github.com/caesiumstudio/csBooks-updates/releases/download/latest/csBooks-${pkgver}.pacman"
        'LICENSE')
noextract=("${pkgname}-${pkgver}.pacman")
sha256sums=('48817ef9d18a166f6601f5d1eb08d3b5f741d60b2e0d0b7ceae471f27d534dff'
            'c8d3a419a16631576fc8cc9d530311e4b9c4e1fb5331048cfe81a98b9c8b66fb')

package() {
  tar xvf "${pkgname}-${pkgver}.pacman" -C "${pkgdir}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  find "${pkgdir}" -type f -name ".*" -exec rm {} +
}
