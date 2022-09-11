# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-diffusers
pkgver=0.3.0
pkgrel=1
pkgdesc='Pretrained diffusion models'
arch=(x86_64)
url='https://pypi.org/project/diffusers'
license=('Apache License 2.0')
source=("$pkgname-$pkgver::https://github.com/huggingface/diffusers/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('5e44f2c9527caad11919c001757179e8dce31b8244c9bdda12b88b332e20371e88cd863e587a6c8ab7e60e95340ceec1fdbcb0e4dc50a61715c28cc90343ff96')

build() {
    cd diffusers-$pkgver
    python setup.py build
}

package() {
    cd diffusers-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
