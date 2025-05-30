# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Contributer: Jonathan Arnold <jdarnold@archlinux.us>
# Contributor: Zhang Hai <dreaming.in.code.zh@gmail.com>

pkgname=python-mechanicalsoup
pkgver=1.4.0 # renovate: datasource=github-tags depName=hickford/MechanicalSoup
pkgrel=1
pkgdesc="A Python library for automating interaction with websites"
arch=('any')
url="https://github.com/hickford/MechanicalSoup"
license=('MIT')
depends=(python python-beautifulsoup4 python-requests python-six python-lxml)
makedepends=(python-build python-installer python-wheel)
source=("https://github.com/hickford/MechanicalSoup/archive/v${pkgver}.tar.gz")

check() {
  cd $srcdir/MechanicalSoup-$pkgver
  python3 -m build --wheel --no-isolation
}

package() {
  cd $srcdir/MechanicalSoup-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl
}

sha512sums=('ea5f4c0ea9ccc4437503172d573a3e5353a666c6b85c9f0b7b7cdb4bc47d3da9af4345bc0299d26ae1027b795bc61a9e045c0a70241f0b0596725b370ebe35e3')
