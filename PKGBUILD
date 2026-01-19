# Contributor: Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=gsa
pkgver=26.9.0
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
sha512sums=('7dc9883425af503e34ec073155ccf2a252f4ef25d0803dcac13a1b76c24af01f9a68b158f8c41ac58a42df4180d5e1cae557cf8e0d4938980012f5f9458b82fc'
            'SKIP')
validpgpkeys=('8AE4BE429B60A59B311C2E739823FAA60ED1E580')


package() {
  install -d $pkgdir/usr/share/gvm/gsad/web
  for i in {assets/,img/,index.html,locales/,robots.txt}; do
    cp -dpr --no-preserve=ownership ${i} $pkgdir/usr/share/gvm/gsad/web/
  done
}
