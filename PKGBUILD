# Contributor: Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=gsa
pkgver=25.3.0
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
sha512sums=('d6b325c39be1e44c379b98f671cc05899118c60e96dce979b6c135e4a7953382e03deb5adedaf5e8bdd03a110838100291a14ff18e295f7e9716591a8287c678'
            'SKIP')
validpgpkeys=('8AE4BE429B60A59B311C2E739823FAA60ED1E580')


package() {
  install -d $pkgdir/usr/share/gvm/gsad/web
  for i in {assets/,img/,index.html,locales/,robots.txt}; do
    cp -dpr --no-preserve=ownership ${i} $pkgdir/usr/share/gvm/gsad/web/
  done
}
