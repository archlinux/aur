# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=blogly-bin
pkgver=1.0.0.beta.1
_pkgver=1.0.0-beta.1
pkgrel=1
pkgdesc='An open-source desktop application for bloggers and content writers'
arch=('x86_64')
url='https://github.com/aswinrajeev/blogly'
license=('BSD')
provides=('blogly')
depends=('nss'
         'gtk3'
         'libxss')
makedepends=('tar')
source=("${pkgname%-bin}-${_pkgver}.deb::https://github.com/aswinrajeev/blogly/releases/download/v${_pkgver}/blogly_${_pkgver}_amd64.deb"
        'LICENSE::https://github.com/aswinrajeev/blogly/raw/master/LICENSE')
sha256sums=('7ef32073f6d620a90f9629942343d88499ea907a9743660126f06f50ac66a605'
            'cf689ee9f0d656283bb561ca8925c5607c9fde2cc9ef363e385cff0dcb599ac4')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
# vim:set ts=2 sw=2 et: