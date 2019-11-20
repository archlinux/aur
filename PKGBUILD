# Maintainer: zoe <chp321 AT gmail DOT com>

pkgname=bookmark-djvu
pkgver=0.1
pkgrel=2
pkgdesc="bookmark-djvu and bookmark-djvu-extract are YAML -enabled wrappers around DjVuLibre’s djvused tool. They allow simple modification and extraction of DjVu outlines."
arch=(any)
url="https://github.com/amba/bookmark-djvu"
license=("GPLv3+")
depends=('djvulibre' 'perl-yaml-libyaml')
source=("${pkgname}.git::git+https://github.com/amba/bookmark-djvu.git")
md5sums=(SKIP)

package() {
   
  cd ${srcdir}/${pkgname}.git/
  install -D -m 0755 -t ${pkgdir}/usr/bin/vendor_perl/       ${pkgname}    ${pkgname}-extract		     
  install -D -m 0644 -t ${pkgdir}/usr/share/doc/$pkgname/    AUTHORS    COPYING

  install -D -m 0644 README.org   ${pkgdir}/usr/share/doc/${pkgname}/README
  sed -i "s|cd t\/|cd \/usr\/bin\/vendor_perl\/${pkgname}-test|" ${pkgdir}/usr/share/doc/${pkgname}/README
  
  install -D -m 0644 TODO.org     ${pkgdir}/usr/share/doc/${pkgname}/TODO
  
  cd ${srcdir}/${pkgname}.git/t/
  install -D -m 0644 -t ${pkgdir}/usr/bin/vendor_perl/${pkgname}-test/   expected1  input1  input1.yaml
  install -D -m 0755 -t ${pkgdir}/usr/bin/vendor_perl/${pkgname}-test/   test
 }
