# Maintainer: zoe < chp321 at gmail >

pkgname=ff4d
pkgver=0.01
pkgrel=1
pkgdesc='FUSE Filesystem 4 Dropbox (ff4d) is a FUSE plugin whichs allows a local mount of your global Dropbox or jailed application folder'
arch=('any')
url="https://github.com/realriot/${pkgname}"
license=('BSD')
depends=('fuse' 'python2-fusepy')
source=("${pkgname}.git::git+https://github.com/realriot/${pkgname}.git"
        "${pkgname}")
md5sums=('SKIP'
         'cde81f1e817daaa6c9decdeaf98ae137')

package() {
  mkdir -p ${pkgdir}/usr/lib/python2.7/site-packages/${pkgname}/
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
  install -D -m 644 ${srcdir}/${pkgname}.git/${pkgname}.py ${pkgdir}/usr/lib/python2.7/site-packages/${pkgname}/
  install -D -m 644 ${srcdir}/${pkgname}.git/getDropboxAccessToken.py ${pkgdir}/usr/lib/python2.7/site-packages/${pkgname}/  
  install -D -m 644 ${srcdir}/${pkgname}.git/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
  install -D -m 755 ${startdir}/$pkgname ${pkgdir}/usr/bin/
}
