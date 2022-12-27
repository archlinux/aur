# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=csbooks
pkgver=7.3.1
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
sha256sums=('f775891a492e8db4c16fd46a8fc76a982e1a562336f4d8864bf7fcb162101819'
            'c8d3a419a16631576fc8cc9d530311e4b9c4e1fb5331048cfe81a98b9c8b66fb')

package() {
  tar xvf "${pkgname}-${pkgver}.pacman" -C "${pkgdir}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  find "${pkgdir}" -type f -name ".*" -exec rm {} +
}
