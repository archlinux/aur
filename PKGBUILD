# Maintainer: Pravin Ramana <pravinramana25 at protonmail dot ch

pkgname=python-tinygrad
_name=${pkgname#python-}
pkgver=0.7.0
pkgrel=1
pkgdesc="You like pytorch? You like micrograd? You love tinygrad! <3"
arch=('any')
url="https://github.com/geohot/tinygrad"
license=('MIT')
depends=('python>=3.8' 'python-numpy' 'python-requests' 'python-pillow' 'python-tqdm' 'python-networkx' 'python-pyopencl' 'python-pyyaml')
optdepends=('python-llvmlite: for LLVM support'
            'python-pycuda: for CUDA support'
            'python-unicorn: for ARM support'
            'python-triton: for Triton support'
            'python-wgpu: for WebGPU support'
            'flake8: for linting support'
            'python-pylint: for linting support'
            'mypy: for linting support'
            'python-pre-commit: for linting support'
            'python-pytorch: for testing support'
            'python-pytest: for testing support'
            'python-pytest-xdist: for testing support'
            'python-onnx: for testing support'
            'python-onnx2pytorch: for testing support'
            'python-opencv: for testing support'
            'python-tabulate: for testing support'
            'python-safetensors: for testing support'
            'python-types-pyyaml: for testing support'
            'python-cloudpickle: for testing support'
            'python-transformers: for testing support')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9a81ee46be716b021006146b2482ae6734e3e35eccfb0c41e334f08da3f31a5a')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
