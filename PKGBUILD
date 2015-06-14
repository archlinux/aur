# Maintainer: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>

pkgname=topcoder-arena
pkgver=1
pkgrel=5
pkgdesc='TopCoder Arena'
arch=('i686' 'x86_64')
url='http://community.topcoder.com/tc'
license=('custom:unknown')
depends=('java-runtime')
source=('http://www.topcoder.com/contest/arena/ContestAppletProd.jnlp'
  'http://community.topcoder.com/contest/classes/KawigiEdit/KawigiEdit.jar'
  'topcoder-arena'
)
md5sums=('fadd41b6db7722df8dbd59d07ed198a5'
         'eb26a5e1b7a72d79a5f1a10bd71bcad2'
         'dfea72c31a518992dc0b64338468dafa')
noextract=('KawigiEdit.jar')
install=topcoder.install

package() {
  cd "${srcdir}/"
  install -Dm755 topcoder-arena "${pkgdir}/usr/bin/topcoder-arena"
  install -Dm755 ContestAppletProd.jnlp "${pkgdir}/usr/share/java/${pkgname}/ContestAppletProd.jnlp"

  # plugins
  for file in *.jar
  do
    install -Dm755 "$file" "${pkgdir}/usr/share/java/${pkgname}/$file"
  done
}
