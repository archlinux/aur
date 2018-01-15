# Maintainer: mickael9 <mickael9 at gmail dot com>

pkgname=wapiti
pkgver=3.0.0
pkgrel=2
pkgdesc="A vulnerability scanner for web applications. It currently search vulnerabilities like XSS, SQL and XPath injections, file inclusions, command execution, LDAP injections, CRLF injections..."
url='http://wapiti.sourceforge.net/'
license=(GPL)
depends=(python python-setuptools python-requests python-beautifulsoup4 python-lxml python-tld python-yaswfp python-mako python-pysocks)
arch=(any)

source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4708fa1d8159b0a5e606bdb26e1454e8df1d8bf6e11d9ad63c84e12e8edc8daa')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
    chmod 644 "${pkgdir}/usr/share/man/man1/wapiti.1"
}
