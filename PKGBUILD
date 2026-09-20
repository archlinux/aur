# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=bithuman
pkgname=python-$_name
_py=cp314
pkgver=2.11.6
pkgrel=1
epoch=1
pkgdesc='bitHuman Python SDK — libessence-backed avatar runtime.'
arch=('x86_64' 'aarch64')
url='https://github.com/bithuman-product/bithuman-sdk-public/tree/main/python'
license=('custom')
depends=('python' 'python-numpy' 'python-loguru' 'python-soundfile' 'python-pydantic' 'python-pydantic-settings' 'python-av' 'python-opencv' 'zlib' 'libstdc++' 'glibc' 'libgcc')
makedepends=('python-installer')
source_x86_64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/$_name-$pkgver-$_py-$_py-manylinux_2_28_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/$_name-$pkgver-$_py-$_py-manylinux_2_28_aarch64.whl")
noextract=("$_name-$pkgver-$_py-$_py-manylinux_2_28_x86_64.whl"
           "$_name-$pkgver-$_py-$_py-manylinux_2_28_aarch64.whl")
sha256sums_x86_64=('d54fef37839cd490cf27e7004c8d71f2144b05acd225162b2d145b2502dad3c3')
sha256sums_aarch64=('fb6c7517d050ab6b75ab9d1c9b4fb9e05d4f3f21257e2ea62fd945ca237f4d0c')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
