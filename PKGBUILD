# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=rfc-pdf
pkgver=20160613
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
md5sums=('bd2331f5ecc92730f78782786ed21b86'
         'bf859b9bfdde0dd9d561e54f827a47ba'
         '3209ad4c9ff3e7adde7980264cd964a9'
         'ea520b2fa945f97e0916989eb1a47365'
         '3dd963b103067752c0dff4ba1f1791c4'
         '5a0b6e1f8730f6d6f8b15399b398f8fb'
         '3bd2e3aaedddadcfeeea753445b44319'
         '3a8ca407483d2ebb2a5ee70e48c4e966'
         'b5803ae8b775823719944b54926bccbb'
         '61431de31ef6cdeaed440030a3d0e24b'
         '8b0a3e3900e707b35e18abb5eacc4b5c'
         'd09d7fafde699872cb31adb2fdb90fa7'
         '90da90a74a1adff54cd43aaf93263f57'
         'bc69b9b6945140f34170e138b885cd47'
         'e3e7181703bfe1ecaee9bb0a09d75b0f'
         '69052af45bf07a3ab944f8d93b9577d5'
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
