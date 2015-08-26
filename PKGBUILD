
pkgname=html2pdf
pkgver=1.0
pkgrel=1
pkgdesc="An gui HTML to PDF Converter 1.0 "
url="https://code.google.com/p/foxoman"
license=('GPL3')
depends=('wkhtmltopdf' 'python2' 'python2-gobject' 'python2-notify' )
arch=('any')
source=("http://foxoman.googlecode.com/files/${pkgname}_${pkgver}-${pkgrel}_all.deb")
md5sums=('f1e1ab6a2887192741591fd1b0152dc0')
#noextract=("${pkgname}-${pkgver}-common.deb")

package() {
   cd $srcdir
      #mkdir ${pkgname}-${pkgver}
      ar x "${pkgname}_${pkgver}-${pkgrel}_all.deb"
      tar xvf data.tar.gz
      sed -i "s/^python /python2 /" $srcdir/usr/bin/html2pdf
      cp -rp usr $pkgdir
}

