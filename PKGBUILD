# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=rfc-pdf
pkgver=20161027
pkgrel=1
pkgdesc="RFCs from rfc-editor.org in pdf format."
arch=('any')
url="http://www.rfc-editor.org/"
license=("custom")
options=('docs')
source=('http://www.rfc-editor.org/rfc/tar/pdfrfc0001-0500.tar.gz'
        'http://www.rfc-editor.org/rfc/tar/pdfrfc0501-1000.tar.gz'
        'http://www.rfc-editor.org/rfc/tar/pdfrfc1001-1500.tar.gz'
        'http://www.rfc-editor.org/rfc/tar/pdfrfc1501-2000.tar.gz'
        'http://www.rfc-editor.org/rfc/tar/pdfrfc2001-2500.tar.gz'
        'http://www.rfc-editor.org/rfc/tar/pdfrfc2501-3000.tar.gz'
        'http://www.rfc-editor.org/rfc/tar/pdfrfc3001-3500.tar.gz'
        'http://www.rfc-editor.org/rfc/tar/pdfrfc3501-4000.tar.gz'
        'http://www.rfc-editor.org/rfc/tar/pdfrfc4001-4500.tar.gz'
        'http://www.rfc-editor.org/rfc/tar/pdfrfc4501-5000.tar.gz'
        'http://www.rfc-editor.org/rfc/tar/pdfrfc5001-5500.tar.gz'
        'http://www.rfc-editor.org/rfc/tar/pdfrfc5501-6000.tar.gz'
        'http://www.rfc-editor.org/rfc/tar/pdfrfc6001-6500.tar.gz'
        'http://www.rfc-editor.org/rfc/tar/pdfrfc6501-7000.tar.gz'
        'http://www.rfc-editor.org/rfc/tar/pdfrfc7001-7500.tar.gz'
        'http://www.rfc-editor.org/rfc/tar/pdfrfc7501-latest.tar.gz'
        'license')
md5sums=('a1d40429a3c912adf02408de86987937'
         '3e750b67f3f73af8b88b22160811ec0c'
         '3dcf40258b6577755d3019b25b546000'
         '7e047b46154f001eed528a97ea4a7de7'
         'c0cd31190f2d6040e20ff8c887684fbe'
         '4cd2d50d5158cfcfc973faecc9a01d72'
         'c3c00fe0231a4a0d02f9c29631ba2069'
         'd86e4d96e9e5c9fccd94d3310f3ecc1e'
         '46dd2b68341ebb4c39f15f7aa3b0a7de'
         'f4faa8e0a53d686ac5ea4ef5ca5ec630'
         'fc0ccf359e8353093b24632be85d162a'
         'c4fd803dfad863262ec13fbcc365c867'
         'b717ef6788d248dcc08de7982b0add8b'
         '94cb9e2695027c5a1e5204af98f1b2bf'
         '322832971f0daec7c2f8b45b7d7d9b36'
         '58dce6f2e3c4f2f4982403317e2b2ac8'
         '06a779406b45edddbd19fda96696ab4a')

package() {
    mkdir -p "$pkgdir/usr/share/doc/rfc/pdf"
    cp ${srcdir}/pdfrfc/*.pdf ${pkgdir}/usr/share/doc/rfc/pdf/

    cd "${pkgdir}/usr/share/doc/rfc"
    find . -type f -exec chmod 444 {} \;
    find . -type d -exec chmod 555 {} \;
    chown -R root:root . 
    install -D -m0644 $srcdir/license $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
