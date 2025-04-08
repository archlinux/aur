# Contributor: Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=gsa
pkgver=24.6.1
pkgrel=1
pkgdesc='Greenbone Security Assistant - OpenVAS web frontend'
arch=('any')
url="https://github.com/greenbone/gsa"
license=('AGPL-3.0-only')
install=gsa.install
depends=('gsad' 'openvas-scanner')
groups=('greenbone-vulnerability-manager')
source=("${pkgname}-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/${pkgname}-dist-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::$url/releases/download/v${pkgver}/${pkgname}-dist-${pkgver}.tar.gz.asc")
sha512sums=('5066998c65bb367670a25e9cbfd11b44fa294fc474ee1fb71e0f485774592e3d612e94292b6efbf80a650709e2e33fca35f93f4a108527ae0ce7967c7d2f0958'
            'SKIP')
validpgpkeys=('8AE4BE429B60A59B311C2E739823FAA60ED1E580')


package() {
  install -d $pkgdir/usr/share/gvm/gsad/web
  for i in {assets/,img/,index.html,locales/,robots.txt}; do
    cp -dpr --no-preserve=ownership ${i} $pkgdir/usr/share/gvm/gsad/web/
  done
}
