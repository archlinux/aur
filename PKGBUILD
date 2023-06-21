# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-diffusers
pkgver=0.17.1
pkgrel=1
pkgdesc='Pretrained diffusion models'
arch=(x86_64)
url='https://github.com/huggingface/diffusers'
license=('Apache License 2.0')
source=("$pkgname-$pkgver::https://github.com/huggingface/diffusers/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('d5ba1881849c78e39d604774ea16ddf7cb3c32735ae4ec567e561a8fd0b295e6653118db5f0952932465f13cc0f27b457a860c6b272124798cc8958a7c6a12d5')
depends=(
    'python-pillow'
    'python-requests'
    'python-regex'
    'python-numpy'
    'python-huggingface-hub'
    'python-filelock'
    'python-importlib-metadata'
    'python-setuptools'
)

build() {
    cd diffusers-$pkgver
    python setup.py build
}

package() {
    cd diffusers-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
