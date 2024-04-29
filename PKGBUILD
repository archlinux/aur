pkgname=llamafile
pkgver=0.8.1
pkgrel=1
pkgdesc="Distribute and run LLMs with a single file."
arch=('x86_64')
url="https://github.com/Mozilla-Ocho/llamafile"
license=('Apache-2.0')
depends=('wine')
optdepends=(
	'hip-runtime-amd: AMD GPU-Offloading Support'
	'cuda: Nvidia GPU-Offloading Support'
	)
source=("${pkgname}::https://github.com/Mozilla-Ocho/llamafile/releases/download/${pkgver}/llamafile-${pkgver}")
sha256sums=('02be1bb313324e5f5d198acec61a68059f1694d4d13189ef52e9a3b427087ccb')
provides=('llamafile')
conflicts=('llamafile-git')
options=(!strip)



package() {
  cd "${srcdir}"
  install -Dm755 "${pkgname}" "/usr/bin/${pkgname}"
}