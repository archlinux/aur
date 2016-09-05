# Maintainer: Joost Bremmer <toost dot b at gmail dot com>

pkgname=mackup
pkgver=0.8.14
pkgrel=4
pkgdesc="a small Python utitlity to keep your application settings in sync."
arch=('any')
url="https://github.com/lra/mackup"
license=('GPL3')
depends=('python')

makedepends=(
			'python'
			'python-docopt'
			'python-setuptools')

source=("https://github.com/lra/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.patch")
sha256sums=('d8b7c2f2d1650b132ca31035e625ee436a7b4ff9a9948119cf3f370fc3b17d22'
            '63c8066854f138a73eef8b2e43b13d83f729b5f6428bdf3c9d19c98206c0676c')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 -i "${srcdir}/${pkgname}.patch"
}

package() {
   cd "${srcdir}/${pkgname}-${pkgver}"
   python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
