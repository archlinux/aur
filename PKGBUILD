# $Id$
# Maintainer: Ido Rosen <ido@kernel.org>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
#
# getmail6 is a mail retriever with support for POP3, POP3-over-SSL, IMAP4,
# IMAP4-over-SSL, and SDPS mail accounts. It is a fork of getmail 5.14 with
# adaptations to work with Python 3 and newer.

pkgname='getmail6'
pkgdesc="mail retriever with support for POP3, IMAP4, SDPS; fork of getmail 5.14 modified to support python3"
pkgver=6.18.13
pkgrel=1
arch=('any')
url='http://getmail6.org/'
license=('GPL2')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-keyring: secure password store'
            'python-keyrings-alt: alternative backends')
source=("${pkgname}-${pkgver}.tgz::https://github.com/getmail6/getmail6/archive/v${pkgver}.tar.gz")
sha512sums=('437c057d6e3d499a2e11be82d4e69aafc24d74d42fb1fa51de06fccd33d6e9e1ef7bba20ae5fc070a80dd656f184386083d462f65b05dafcf516d7dc0b2138a0')

#prepare() {
#  cd "${srcdir}/${pkgname}-${pkgver}"
#
#}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

#check() {
#  cd "${srcdir}/${pkgname}-${pkgver}"
#  
#}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
}
