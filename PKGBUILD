# Contributor: Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=gsa
pkgver=27.3.0
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
sha512sums=('eb6dd99bcb4486b5ada8d887e373bc39e75ea11f8bc61e4b30fffdf7461eb5350345969d676a54e7585a3393bce033f1879961245a72d17301aa0123796568d4'
            'SKIP')
validpgpkeys=('8AE4BE429B60A59B311C2E739823FAA60ED1E580')


package() {
  install -d $pkgdir/usr/share/gvm/gsad/web
  for i in {assets/,img/,index.html,locales/,robots.txt}; do
    cp -dpr --no-preserve=ownership ${i} $pkgdir/usr/share/gvm/gsad/web/
  done
}
