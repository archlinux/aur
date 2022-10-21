# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-diffusers
pkgver=0.6.0
pkgrel=1
pkgdesc='Pretrained diffusion models'
arch=(x86_64)
url='https://github.com/huggingface/diffusers'
license=('Apache License 2.0')
source=("$pkgname-$pkgver::https://github.com/huggingface/diffusers/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('415ef2cfa6c6ba2654064910e068f4546e2f975e53441232d642c56e599e3a2cee1ffbe0dff96b7e5d788178e3cb4703ce8694987c47e4b67e579e796bb38c54')
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
