pkgname=python-clean-fid-git
pkgver=r224.f156627
pkgrel=1
pkgdesc='PyTorch - FID calculation with proper image resizing and quantization steps [CVPR 2022] '
arch=(x86_64)
url='https://github.com/GaParmar/clean-fid'
license=('custom')
source=("git+https://github.com/GaParmar/clean-fid.git")
sha512sums=('SKIP')
depends=('python'
'python-pytorch'
'python-torchvision'
'python-numpy'
'python-scipy'
'python-tqdm'
'python-pillow'
'python-requests'
)
makedepends=('python-setuptools')
provides=('python-clean-fid')
conflicts=('python-clean-fid')

pkgver() {
    cd $srcdir/clean-fid
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/clean-fid
    python setup.py build
}

package() {
    cd $srcdir/clean-fid
    python setup.py install --root="$pkgdir" --optimize=1
}
