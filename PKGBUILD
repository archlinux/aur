# Contributor: Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=gsa
pkgver=24.1.0
pkgrel=1
pkgdesc='Greenbone Security Assistant'
arch=('any')
url="https://github.com/greenbone/gsa"
license=('GPL')
depends=('gsad' 'openvas-scanner')
groups=('greenbone-vulnerability-manager')
source=("${pkgname}-${pkgver}.tar.gz::$url/releases/download/v${pkgver}/${pkgname}-dist-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::$url/releases/download/v${pkgver}/${pkgname}-dist-${pkgver}.tar.gz.asc")
sha512sums=('2e13b09d212a1cb814e1d616b7c976271697d4900c8aba0bb8d1861adcd352986441bcb28ace26b0e07e5d0c4ecb90f287f9f808038eab6d95bb545654eafd49'
            'SKIP')
validpgpkeys=('8AE4BE429B60A59B311C2E739823FAA60ED1E580')


package() {
  install -d $pkgdir/usr/share/gvm/gsad/web
  for i in {assets/,img/,index.html,locales/,robots.txt}; do
    cp -dpr --no-preserve=ownership ${i} $pkgdir/usr/share/gvm/gsad/web/
  done
}
