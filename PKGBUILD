# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=python-obspy-docs
pkgver=1.3.0
pkgrel=1
pkgdesc='Set of HTML documentation for Obspy seismological framework.'
arch=('any')
url='http://docs.obspy.org'
license=('LGPL')
options=('docs')
makedepends=('python-cartopy' 'python-obspy' 'python-m2r2' 'python-matplotlib' 'python-sphinx' 'python-sphinx_rtd_theme')
source=("${pkgname%-docs}-${pkgver}.tar.gz::https://github.com/obspy/obspy/archive/${pkgver}.tar.gz")
sha256sums=('12a5ba9cae3445c9f31bd0e0561e791bc755cc627d4412f851f6286fef82be34')

build() {
    cd "obspy-${pkgver}/misc/docs"
    mkdir _build
    sphinx-build -a -E -j auto -b html source _build
}

package() {
    cd "obspy-${pkgver}/misc/docs"
    install -d ${pkgdir}/usr/share/doc/python-obspy
    cp -a _build ${pkgdir}/usr/share/doc/python-obspy/html
}
# vim:set ts=4 sw=4 et:
