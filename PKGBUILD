# Maintainer: Abhinav Adhikari (abhinavadhikari481@gmail.com)

pkgname=python-vcdvcd
pkgver=2.6.0
_name=vcdvcd
pkgrel=1
pkgdesc="Python Verilog value change dump (VCD) parser library + the nifty vcdcat VCD command line viewer"
arch=('x86_64')
url="https://github.com/cirosantilli/vcdvcd"

source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('96d8ce491729e8c8ad7034a5093601409d8a3f4a34023d0be3db28650ecbb128')

depends=('python')
license=("Artistic-1.0-Perl AND MIT")
makedepends=('python-setuptools')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    install -Dm644 LICENCE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    python setup.py install --root="$pkgdir" --optimize=1
}
