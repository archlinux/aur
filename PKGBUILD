# Contributor: Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=gsa
pkgver=26.16.3
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
sha512sums=('db30467db5817f3e16ac4478e9e01c9cb5110547ee86e4334c9dec66a55a39e22d2771d7ddc2b296cc42b3bf2a6d948c8ba7e9af40b7401e02f8b5025b72a1cb'
            'SKIP')
validpgpkeys=('8AE4BE429B60A59B311C2E739823FAA60ED1E580')


package() {
  install -d $pkgdir/usr/share/gvm/gsad/web
  for i in {assets/,img/,index.html,locales/,robots.txt}; do
    cp -dpr --no-preserve=ownership ${i} $pkgdir/usr/share/gvm/gsad/web/
  done
}
