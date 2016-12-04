# Maintainer: Dennis Fink <metalgamer@c3l.lu>
# Maintainer: Peter A. Shevtsov <pshevtsov at severusweb dot ru>

pkgname=htmlcompressor
pkgver=1.5.3
pkgrel=3
pkgdesc="HTML compressor and minifier."
arch=(any)
url="http://code.google.com/p/htmlcompressor/"
license=('APACHE')
depends=(java-runtime)
optdepends=('yuicompressor: inline css and javascript compression'
'closure-compiler: inline javascript compression')
source=(
    "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${pkgname}/${pkgname}-${pkgver}.jar"
    "htmlcompressor.sh"
    )
sha256sums=('88894e330cdb0e418e805136d424f4c262236b1aa3683e51037cdb66310cb0f9'
            'a6fbcddb13f317332a5d063a233a2cc3d3dbb3e8e32077434f256a70593476e4')

package() {
    cd $srcdir

    install -m644 -D ${pkgname}-${pkgver}.jar \
        $pkgdir/usr/share/java/$pkgname/${pkgname}.jar
    install -m755 -D htmlcompressor.sh $pkgdir/usr/bin/htmlcompressor
    ln -s ../closure-compiler/closure-compiler.jar \
        $pkgdir/usr/share/java/$pkgname/compiler.jar
    ln -s ../yuicompressor.jar \
        $pkgdir/usr/share/java/$pkgname/yuicompressor.jar
}
