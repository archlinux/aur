# Maintainer: Harsh Narayan Jha <harshnj at proton dot me>
# Contributor: Shira Nguyen <sn3446409@gmail.com>
# Contributor: Nathan Doyle <natetronn <at> Gmail-DOT-Com>
# Contributor: American_Jesus <american.jesus.pt AT gmail DOT com>
pkgname=grub2-theme-preview
pkgver=2.10.2
pkgrel=2
pkgdesc="Preview a full GRUB 2.x theme (or just a background image) using KVM/QEMU"
arch=('any')
url="https://github.com/hartwork/grub2-theme-preview"
license=('GPL')
depends=('grub' 'qemu' 'mtools' 'python' 'libisoburn' 'edk2-ovmf')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/hartwork/grub2-theme-preview.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/$pkgname"
    python setup.py build
}

package() {
  cd "${srcdir}/$pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
}
