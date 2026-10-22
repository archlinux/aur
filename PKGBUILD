# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=azure-cognitiveservices-speech
pkgname=python-$_name
pkgver=1.53.0
pkgrel=1
pkgdesc='Microsoft Cognitive Services Speech SDK for Python.'
arch=('x86_64' 'aarch64')
url='https://pypi.org/project/azure-cognitiveservices-speech'
license=('LicenseRef-Microsoft')
depends=('python'
         'python-azure-core'
         'glibc'
         'libgcc'
         'libstdc++'
         'util-linux-libs'
         'alsa-lib'
         'gstreamer'
         'glib2'
         'libunwind'
         'libelf'
         'libffi'
         'pcre2'
         'xz'
         'zlib'
         'zstd'
         'bzip2')
makedepends=('python-installer')
source_x86_64=("https://files.pythonhosted.org/packages/py3/${_name:0:1}/$_name/${_name//-/_}-$pkgver-py3-none-manylinux1_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/py3/${_name:0:1}/$_name/${_name//-/_}-$pkgver-py3-none-manylinux2014_aarch64.whl")
noextract=("${_name//-/_}-$pkgver-py3-none-manylinux1_x86_64.whl"
           "${_name//-/_}-$pkgver-py3-none-manylinux2014_aarch64.whl")
sha256sums_x86_64=('e41a909b3480f6e12337c96f3f8cc6c8ea18cf263fee500158e49fd7b5eaa65c')
sha256sums_aarch64=('688badb3efbb7d424aba67996225adf8762be32bbeb1e27dda87fdbd26b192de')

package() {
  python -m installer --destdir="$pkgdir" *.whl
  install -Dm644 "$pkgdir"/usr/lib/python*/site-packages/${_name//-/_}-$pkgver.dist-info/licenses/licensefiles/speech/LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
