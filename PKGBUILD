pkgbase='python-realesrgan'
pkgname=('python-realesrgan' 'python-realesrgan-model')
pkgver=0.2.2.4
pkgrel=1
pkgdesc="Real-ESRGAN aims at developing Practical Algorithms for General Image Restoration. "
arch=('x86_64')
url="https://github.com/xinntao/Real-ESRGAN"
license=('BSD 3-Clause')
depends=('python-basicsr' 'python-facexlib' 'python-gfpgan' 'python-numpy' 'python-opencv'
'python-pillow' 'python-pytorch' 'python-torchvision' 'python-tqdm')
makedepends=('python-setuptools')

source=("https://github.com/xinntao/Real-ESRGAN/archive/refs/tags/v$pkgver.tar.gz"
'https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.0/RealESRGAN_x4plus.pth'
'https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.2.4/RealESRGAN_x4plus_anime_6B.pth')
sha256sums=('d0d0e10ab398ee53bf385a23dfb13d88fc67999454008360801bcf6a97efd235'
            '4fa0d38905f75ac06eb49a7951b426670021be3018265fd191d2125df9d682f1'
            'f872d837d3c90ed2e05227bed711af5671a6fd1c9f7d7e91c911a61f155e99da')

package_python-realesrgan() {
    optdepends=('python-realesrgan-model: pre-trained model and inference script')
    cd Real-ESRGAN-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python-realesrgan-model() {
    pkgdesc="Pre-trained model and interference script for python-realesrgan."
    depends=('python-realesrgan')
    mkdir -p ${pkgdir}/usr/share/python-realesrgan-model
    cp Real-ESRGAN-${pkgver}/inference_realesrgan.py ${pkgdir}/usr/share/python-realesrgan-model/
    cp *.pth ${pkgdir}/usr/share/python-realesrgan-model/
}
