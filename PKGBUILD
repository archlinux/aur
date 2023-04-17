# Maintainer: Ivy Huang <imyxh@imyxh.net>

_name="srt-py"
pkgbase="$_name"-git
pkgname="$pkgbase"
pkgver=v0.9.0.r59.g5f82397
pkgrel=1
pkgdesc="Small Radio Telescope Control Code for Python"
url="https://github.com/MITHaystack/srt-py"
license=('BSD')
arch=('any')
depends=('python-numpy' 'python-scipy' 'soapysdr' 'soapyrtlsdr-git' 'gnuradio'
         'gnuradio-osmosdr' 'digital_rf-git' 'python-pyzmq' 'python-pyserial'
         'python-astropy' 'python-yamale' 'python-dash'
         'python-dash-bootstrap-components' 'python-plotly' 'python-pandas'
         'python-waitress')
makedepends=('git' 'python-setuptools')
source=('git+https://github.com/MITHaystack/srt-py.git')
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_name"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_name"
    python setup.py build
}

package() {
    cd "$_name"
    python setup.py install --root="$pkgdir" --optimize=1
}

