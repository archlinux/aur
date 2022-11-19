# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Hao Long <imlonghao@archlinuxcn.org>

pkgname=python38-rich
pkgver=12.6.0
pkgrel=2
pkgdesc='Render rich text, tables, progress bars, syntax highlighting, markdown and more to the terminal'
arch=(any)
url='https://github.com/willmcgugan/rich'
license=('MIT')
depends=(python38-{colorama,commonmark,pygments})
makedepends=(python38-{build,installer,poetry-core,wheel})
source=("https://github.com/willmcgugan/rich/archive/v${pkgver}/rich-${pkgver}.tar.gz")
b2sums=('58367ef0acb61d68931ea0394ea458e29b3bb59726c6b95d4b179553183c5cef2766484e0d040203181aad927add70198fb3483bfe6113e20851db141de3a867')

build() {
  cd rich-${pkgver}
  python3.8 -m build --wheel --no-isolation
}

package() {
  cd rich-${pkgver}
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
