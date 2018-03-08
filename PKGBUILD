# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: dibblethewrecker <dibblethewrecker.at.jiwe.dot.org>
# Contributor: Sergey Pupykin

pkgname=mime-editor
pkgver=0.6
pkgrel=6
pkgdesc='Shared-mime info database editor, useful for changing MIME-type info in rox applications'
arch=('any')
url='http://rox.sourceforge.net/desktop/MIME-Editor.html'
license=('GPL2')
depends=('pygtk' 'rox-lib' 'shared-mime-info')
source=("http://downloads.sourceforge.net/rox/${pkgname}-${pkgver}.tar.bz2"
        'mime-editor')
md5sums=('bfa250d074b6a712c1fce936a5fcaae4'
         '9438b0a8d591abd03099ac5961540d4a')

prepare() {
  cd ${pkgname}-${pkgver}
  # python2 fix
  sed -i "s|\(env python\).*|\12|" $(grep -rl "env python" .)
}

package() {
  cd ${pkgname}-${pkgver}
  install -d "${pkgdir}"/usr/share
  cp -rp MIME-Editor "${pkgdir}"/usr/share
 # create a shellscript which is known in the PATH
  install -Dm755 "${srcdir}"/$pkgname "${pkgdir}"/usr/bin/$pkgname
}
