# $Id$
# Maintainer: Ido Rosen <ido@kernel.org>
# Co-Maintainer: Matthias Bodenbinder <matthias@bodenbinder.de>
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
pkgver=6.19.04
pkgrel=1
arch=('any')
url='http://getmail6.org/'
license=('GPL2')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-keyring: secure password store'
            'python-keyrings-alt: alternative backends')
source=("${pkgname}-${pkgver}.tgz::https://github.com/getmail6/getmail6/archive/v${pkgver}.tar.gz")
sha512sums=('b8cb8849867037ae207f3d37776c7aec2d0282308034e4cb55171596f40460cb2d08f8d915c48dfada49ad47a690b881de2142d994e9d139c3c1c0841b9d0471')

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
