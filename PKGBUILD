# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync-nemo
pkgver=1.3.12.36116
pkgrel=2
pkgdesc="Nemo integration for insync"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
arch=('any')
depends=("insync" "nemo-python")
source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/${pkgname}_${pkgver}-precise_all.deb"
        'python3.patch')
sha256sums=('e3b9ac6be0a2f0488aea05753c37b271763cc2f145ff860f5615a79bf2dc2113'
            'b67da8737af3b32ff392aa365ef6f1ce318c3a5c64d81819eac54f5a7ad6682e')

package() {
  cd "${srcdir}"
  tar -zxf data.tar.gz
  patch -Np1 -i ../python3.patch
  cp -r usr "${pkgdir}"
}
