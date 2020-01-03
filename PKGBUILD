# Maintainer: Andrea Scarpino <andrea at archlinux.org>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Todd Maynard <arch@toddmaynard.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=python2-cheetah
pkgver=2.4.4
pkgrel=8
pkgdesc="A Python-powered template engine and code generator"
arch=(x86_64)
url="http://www.cheetahtemplate.org"
license=(custom)
depends=(python2 python2-markdown)
makedepends=(python2-distribute)
optdepends=('python2-pygments: for the CodeHighlighter filter')
source=(https://pypi.python.org/packages/source/C/Cheetah/Cheetah-${pkgver}.tar.gz)
sha512sums=('11b8cbf7d71789d6ae83596b133ddbe0bf1ccf2bca4c59562e7cd1d9bb75fa9d3208c0021d7d77edafdb03fd399cf1a26c003267fbffb94f27bf4457b0f9234c')

build() {
  cd "${srcdir}/Cheetah-${pkgver}"
  python2 setup.py build
}

package() {
  msg "Install..."
  cd "${srcdir}/Cheetah-${pkgver}"
  python2 setup.py install --root="${pkgdir}" || return 1

  msg2 "Install copyright resources in /usr/share/licenses/${pkgname}..."
  install -Dm644 "${srcdir}/Cheetah-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

