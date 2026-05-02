# Maintainer: lalala <lalala_233@qq.com>
pkgname=comfyui-gguf
_commit=6ea2651e7df66d7585f6ffee804b20e92fb38b8a
_name="ComfyUI-GGUF"
pkgver=2.0.0
pkgrel=1
pkgdesc="GGUF Quantization support for native ComfyUI models"
arch=('any')
url="https://github.com/city96/ComfyUI-GGUF"
license=('Apache-2.0')
depends=('python' 'python-gguf' 'python-sentencepiece' 'python-protobuf' 'comfyui-system')
source=("${pkgname}-${pkgver}.zip::https://github.com/city96/ComfyUI-GGUF/archive/${_commit}.zip")
sha512sums=('cd9e8b56fa0c377e51f3994f973ff8c84fb60bc79191bf68306c96b4853d59019973a90e9e2f8b06442a12753b67ed5c1b125517860b510326ff8aa8f03b56b2')

package() {
  local install_dir="/opt/comfyui/custom_nodes/${_name}"
  install -dm755 "$pkgdir/$install_dir"

  cd "${_name}-${_commit}"
  cp -a . "$pkgdir/$install_dir"

  rm -rf "$pkgdir/$install_dir"/{.git,.github,.ci,tests,tests-unit,pytest.ini,.coderabbit.yaml,.gitattributes,.gitignore}
}
