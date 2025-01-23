# Contributor: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-berliner
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=2020.1221.0
pkgrel=1
pkgdesc="Tools for stellar tracks & isochrones"
arch=('any')
url="https://github.com/hypergravity/berliner"
license=('MIT')
depends=('python-scipy' 'python-regli' 'python-joblib' 'python-astropy' 'python-numpy' 'python-emcee' 'python-tqdm' 'python-matplotlib' 'python')
source=("https://github.com/hypergravity/berliner/archive/refs/tags/2020.1221.0.tar.gz")
md5sums=('429ab5e09adc9bad2cf461fb34e37d64')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    python setup.py test
#}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname%-git}" README.md
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
