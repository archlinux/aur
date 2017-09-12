# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Cedric Staub <cs+aur {at} cssx.cc>

pkgname=episoder
pkgver=0.8.2
pkgrel=1
pkgdesc="A simple TV show episode reminder"
arch=('any')
url="https://github.com/cockroach/episoder"
license=('GPL2')
depends=('python-sqlalchemy'
         'python-argparse'
         'python-requests')

source=(https://github.com/cockroach/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz)
sha256sums=('cdb7db92e18d430dc523813fc56c231518caa6123182a719804d2fed72f2fc9e')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  sed -i 's|files.append((path.join("doc", "episoder", "examples"), \["home.episoder"\]))|files.append("examples/home.episoder")|' setup.py
}

build() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
}
