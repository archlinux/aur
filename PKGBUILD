# Contributor: Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=gsa
pkgver=24.0.1
pkgrel=1
pkgdesc='Greenbone Security Assistant'
arch=('any')
url="https://github.com/greenbone/gsa"
license=('GPL')
depends=('gsad' 'openvas-scanner')
groups=('greenbone-vulnerability-manager')
source=("${pkgname}-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/${pkgname}-dist-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::$url/releases/download/v${pkgver}/${pkgname}-dist-${pkgver}.tar.gz.asc")
sha512sums=('6b3527d574e0e4379cba1054ab6fffd33cfdb992520c2da88ed31e7ba1f09e5e3b6081aa41a8acbc01d36123b1ef6358108be7d3733a22525a88f7eff568bed3'
            'SKIP')
validpgpkeys=('8AE4BE429B60A59B311C2E739823FAA60ED1E580')


package() {
  install -d $pkgdir/usr/share/gvm/gsad/web
  for i in {assets/,img/,index.html,locales/,robots.txt}; do
    cp -dpr --no-preserve=ownership ${i} $pkgdir/usr/share/gvm/gsad/web/
  done
}
