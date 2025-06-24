#Maintainer: Popolon <popolon aL popolon.org>
# generated with  pip2pkgbuild
# modified by hand

pkgname='python-vcd'
_module='vcd'
_src_folder='vcd-6.0.3'
pkgver='6.0.3'
pkgrel=2
pkgdesc="Video Content Description (VCD) library"
url="http://vcd.vicomtech.org/"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:MIT License')
arch=('any')
source=("https://files.pythonhosted.org/packages/18/83/9cd15580e079fc9e5be4064ab92609628b9eed6c3661206c724145876183/vcd-6.0.3.tar.gz")
sha256sums=('da0b2a43efae813fb13c024bf64e65de89517cd5dfde9ebb9f10e21fca96d306')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
