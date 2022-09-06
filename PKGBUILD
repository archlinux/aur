# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-diffusers
pkgver=0.2.4
pkgrel=1
pkgdesc='Pretrained diffusion models'
arch=(x86_64)
url='https://pypi.org/project/diffusers'
license=('Apache License 2.0')
source=("$pkgname-$pkgver::https://github.com/huggingface/diffusers/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('348a75f20ef36c44784d2235bc70ce35033d331dd384c382a3edbfadeac9ac3a6a24fc383421be32834eb81dc00feb035d2998dc511c4591580d10752c956261')

build() {
    cd diffusers-$pkgver
    python setup.py build
}

package() {
    cd diffusers-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
