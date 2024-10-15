# Maintainer: Kimlulz (kimlulz@naver.com)

pkgname=whale-browser
pkgver=stable
pkgrel=Rolling_3.27
pkgdesc='A web browser that possess a lot of similar features as Vivaldi, being a customized pushed browser, multi-tasking browsing called 'Omnitasking', as well as other features such as cloud saves & quick translation'
arch=('x86_64')
url='https://whale.naver.com/en'
license=("custom:${pkgname}")
depends=('nss'
         'gtk3'
         'libxss')
makedepends=('tar')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.deb::https://installer-whale.pstatic.net/downloads/installers/naver-whale-stable_amd64.deb"
        'LICENSE')
sha256sums=('SKIP'
            'SKIP')
            
package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  rm -rf "${pkgdir}/etc"
}
# vim:set ts=2 sw=2 et:
