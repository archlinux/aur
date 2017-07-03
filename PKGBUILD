# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: K1412 <swaelens.jonathan@openmailbox.org>
pkgname=smarty3-gettext
pkgver=1.1.0
pkgrel=1
pkgdesc="smarty3-gettext provides gettext support for Smarty,
the popular PHP templating engine (http://smarty.php.net/)." 
arch=('any')
url='https://github.com/smarty-gettext/smarty-gettext'
depends=('smarty3') 
conflicts=('smarty3-i18n')
licence='LGPL'

source=("https://github.com/smarty-gettext/smarty-gettext/archive/${pkgver}.tar.gz")
md5sums=('ea0728f159d2c3cf42f62156fd9c4ef7')

prepare() {
  cd smarty-gettext-${pkgver}/

  # Right for executables 
  chmod 750 ./tsmarty2c.php
}


package() {
  cd smarty-gettext-${pkgver}/
  
  mkdir -p ${pkgdir}/usr/share/php/smarty3/plugins/
  cp ./block.t.php ${pkgdir}/usr/share/php/smarty3/plugins/

  mkdir -p ${pkgdir}/usr/bin/
  cp ./tsmarty2c.php ${pkgdir}/usr/bin/

  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}/
  cp -a ./tests/ ${pkgdir}/usr/share/doc/${pkgname}/
  cp ./COPYING ${pkgdir}/usr/share/doc/${pkgname}/
  cp ./ChangeLog.md ${pkgdir}/usr/share/doc/${pkgname}/
  cp ./README.md ${pkgdir}/usr/share/doc/${pkgname}/
}

