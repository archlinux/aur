# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
_github_url=https://github.com/lopsided98/dnsupdate
pkgname=dnsupdate
pkgver=0.1
pkgrel=1
pkgdesc="A modern and flexible dynamic DNS client"
arch=('any')
url="${_github_url}"
license=('GPL3')
depends=('python-requests' 'python-yaml')
makedepends=('python-setuptools')
optdepends=(
     'python-beautifulsoup4: router address scraping'
     'python-netifaces: local interface address support'
)
source=(${pkgname}::git+${_github_url}.git#tag=$pkgver)
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"

    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

# vim:set ts=4 sw=4 et:
