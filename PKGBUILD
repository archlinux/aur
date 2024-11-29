# Maintainer: yznnyz <yzniu1@gmail.com>
# Maintainer: Chih-Hsuan Yen <base64_decode("eXUzYWN0eHQydHR0ZmlteEBjaHllbi5jYwo=")>
_module='onnx2pytorch'
pkgname=python-$_module
_src_folder='onnx2pytorch-0.5.1'
pkgver='0.5.1'
pkgrel=1
pkgdesc="Library to transform onnx model to pytorch."
url="https://github.com/ToriML/onnx2pytorch"
depends=('python' 'python-pytorch' 'python-onnx' 'python-torchvision')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
license=('custom:Apache Software License')
arch=('any')
source=("https://files.pythonhosted.org/packages/66/85/ff182f63c81419607182184d4dc7da3bbfc244dcdef3ac4aea2f1ab6b1a0/onnx2pytorch-0.5.1.tar.gz")
sha256sums=('5c3ddf004838e67793817751affb426d77955290e473b492a058fc6edcee8d14')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
