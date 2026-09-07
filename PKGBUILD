# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=bithuman
pkgname=python-$_name
_py=cp314
pkgver=3.0.1
pkgrel=1
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
sha256sums_x86_64=('44195ed52adab49aa92fcf278c7306768dae0e7932d10e751cf14124371d11c4')
sha256sums_aarch64=('17dfd7188c40ea7b972941d6632b78e84d14903b6efb30f997f6ffb7e471afb5')

package() {
  python -m installer --destdir="$pkgdir" *.whl
}
