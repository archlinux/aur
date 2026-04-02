# Maintainer: CloverGit <clovergit@hotmail.com>

pkgname=python-ida-pro-mcp
pkgver=1.4.0
pkgrel=1
pkgdesc='Simple MCP Server to allow vibe reversing in IDA Pro.'
arch=('any')
license=('MIT')
url='https://github.com/mrexodia/ida-pro-mcp'

depends=('python' 'python-mcp')

source=("https://github.com/mrexodia/ida-pro-mcp/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fabeb5ed78abb266e01d1d840580c1c021fba12ac2a3975d03395063535ba506')

build() {
  cd "ida-pro-mcp-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "ida-pro-mcp-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set sw=2 ts=2 et:
