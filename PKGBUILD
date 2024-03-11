pkgbase='python-ultralytics'
pkgname=('python-ultralytics')
_module='ultralytics'
pkgver='8.1.26'
_src_folder=${_module}-${pkgver}
pkgrel=1
pkgdesc="Ultralytics YOLOv8 for SOTA object detection, multi-object tracking, instance segmentation, pose estimation and image classification."
url=""
depends=('python-matplotlib' 'python-opencv' 'python-pillow' 'python-requests' 'python-scipy' 'python-pytorch' 'python-torchvision' 'python-tqdm' 'python-psutil' 'python-py-cpuinfo' 'python-thop' 'python-pandas' 'python-seaborn' 'python-lap')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('AGPL-3.0-or-later')
arch=('any')
source=("https://files.pythonhosted.org/packages/db/23/32dca36723349d98eaf59768f4f72ac996ffb5b9616bc9e7977d0ee990ed/${_src_folder}.tar.gz")
sha256sums=('88048ce58a682e8196b757d22f9eb1491cab4e6e5440351476bc53e25f26dd0e')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
