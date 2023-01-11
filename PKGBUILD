# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-diffusers
pkgver=0.11.1
pkgrel=1
pkgdesc='Pretrained diffusion models'
arch=(x86_64)
url='https://github.com/huggingface/diffusers'
license=('Apache License 2.0')
source=("$pkgname-$pkgver::https://github.com/huggingface/diffusers/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('8b5450a2a902625ff890b3d2a3756ecd961e58010bbfd4f8adc406c51c35596e324d120df257287cf9339938786a0ade2d405f4541e6a19c66beb5a4d36adcd7')
depends=(
    'python-pillow'
    'python-requests'
    'python-regex'
    'python-numpy'
    'python-huggingface-hub'
    'python-filelock'
    'python-importlib-metadata'
)

build() {
    cd diffusers-$pkgver
    python setup.py build
}

package() {
    cd diffusers-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
