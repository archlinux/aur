# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Cedric Staub <cs+aur {at} cssx.cc>

pkgname=episoder
pkgver=0.8.1
pkgrel=1
pkgdesc="A simple TV show episode reminder"
arch=('any')
url="https://github.com/cockroach/episoder"
license=('GPL2')
depends=('python-sqlalchemy'
         'python-argparse'
         'python-requests')

source=(https://github.com/cockroach/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz)
sha256sums=('c93069147fc5dce708f20d43aacb89b0b3174fe34a11b16b19ea626b2164303d')

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
