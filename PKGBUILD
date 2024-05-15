# Maintainer: Ankit Bhatia <ankbhatia19@gmail.com>

pkgbase='python-ultralytics'
pkgname=('python-ultralytics')
_module='ultralytics'
pkgver='8.2.16'
_src_folder=${_module}-${pkgver}
pkgrel=1
pkgdesc="Ultralytics YOLOv8 for SOTA object detection, multi-object tracking, instance segmentation, pose estimation and image classification."
url="https://github.com/ultralytics/ultralytics"
depends=('python-matplotlib' 'python-opencv' 'python-pillow' 'python-requests' 'python-scipy' 'python-pytorch' 'python-torchvision' 'python-tqdm' 'python-psutil' 'python-py-cpuinfo' 'python-thop' 'python-pandas' 'python-seaborn' 'python-lapx')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('AGPL-3.0-or-later')
arch=('any')
source=("https://files.pythonhosted.org/packages/69/44/f06f47ed8a5e6a79dfb5ee2acafd9a98b306269654f41466e50b4905dfe9/${_src_folder}.tar.gz")
sha256sums=('0484461dbd614309dd8ef6d0e13bc22a2e706e34e3ff275e8f631111158d082f')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
