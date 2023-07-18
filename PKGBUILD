# Maintainer: Billy Yang <handsomexdd1024@gmail.com>
_name=mcdreforged
pkgname=python-${_name}
pkgver=2.10.0
pkgrel=1
pkgdesc="A rewritten version of MCDaemon, a python script to control your Minecraft server"
arch=(any)
url="https://github.com/Fallen-Breath/MCDReforged"
license=('LGPL3')
depends=('python' 'python-colorama' 'python-colorlog' 'python-parse' 'python-prompt_toolkit' 'python-psutil' 'python-requests' 'python-ruamel-yaml' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('java-runtime: start Minecraft server')
backup=()
options=()
install=
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('8c66a31057c7a0713d326d613e8ae4c889039ff0a92ecc10c662228f52638ded')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
}
