# Maintainer: CristianCYAC <cristianyasprillac at gmail dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=csbooks
pkgver=8.2.2
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
sha256sums=('a6f544e1b9a6546701a304b651b9ab6f34b20866ad832f88378085bcc666a95e'
            'c8d3a419a16631576fc8cc9d530311e4b9c4e1fb5331048cfe81a98b9c8b66fb')

package() {
  tar xvf "${pkgname}-${pkgver}.pacman" -C "${pkgdir}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  find "${pkgdir}" -type f -name ".*" -exec rm {} +
}
