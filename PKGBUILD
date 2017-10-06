# Maintainer : Sebastian Lau <lauseb644 _at_ gmail .dot. com>

pkgname=('python-opencv')
_module='opencv_python'
pkgver='3.3.0.10'
pkgrel=2
pkgdesc="Wrapper package for OpenCV python bindings."
url="https://github.com/skvark/opencv-python"
license=('MIT' 'LGPL2')
arch=('x86_64' 'i686')
depends=('python' 'python-numpy')
makedepends=('python-pip')
source_x86_64=("https://pypi.python.org/packages/47/da/d7cc32630062e75cac5df51fcb2fef0786c7037aa76eb500ee5ec6fc881a/${_module}-${pkgver}-cp36-cp36m-manylinux1_x86_64.whl")
md5sums_x86_64=('43a0e261c74e68d0b80df5bc7c3aa06a')
md5sums_i686=('8efba6083e38ccd58123d0472a02cd00')
source_i686=("https://pypi.python.org/packages/a7/ae/7b631633120159827389ffd9e3f81c384d892d18b5d12501e78f68426e4c/${_module}-${pkgver}-cp36-cp36m-manylinux1_i686.whl")
options=(!strip)

package() {
    cd "${srcdir}"

    PIP_CONFIG_FILE=/dev/null pip3 install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl

    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install ${pkgdir}/usr/lib/python3.6/site-packages/cv2/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
    install ${pkgdir}/usr/lib/python3.6/site-packages/cv2/LICENSE-3RD-PARTY.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt

    rm ${pkgdir}/usr/lib/python3.6/site-packages/cv2/LICENSE*.txt
}
