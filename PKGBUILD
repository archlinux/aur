# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=skm-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="A simple and powerful SSH keys manager"
arch=('x86_64')
url='https://timothyye.github.io/skm'
license=('MIT')
provides=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TimothyYe/skm/releases/download/V${pkgver}/skm-linux64-${pkgver}.tar.gz"
        'LICENSE::https://github.com/TimothyYe/skm/raw/master/LICENSE')
sha256sums=('622f9eb231573c40d2f44106dd345f59281551c6dd0a80b3d575c6ff03156d09'
            '9135a22d94f05de75cba7a299488e9155bb15634660e992138d2eb263e657004')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}/LICENSE" -t \
   "${pkgdir}/usr/share/licenses/${pkgname}"
}
