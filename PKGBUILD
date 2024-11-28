# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="kalc"
pkgname="${_pkgname}-bin"
pkgver=1.4.0
pkgrel=1
pkgdesc="A complex numbers, 2D/3D graphing, arbitrary precision, vector/matrix, CLI calculator with real-time output and support for units"
arch=('x86_64')
url="https://github.com/bgkillas/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
optdepends=('gnuplot: for plotting support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-gnu")
b2sums=('f54c836585a8a5ad62a823617504a04c17d25629f7df32f7457df9a10b2b6d320c809922a4b1a333b7b93a2f08e936aa547d41aaa886bf4dea0b4a43fa8ec84a'
        '74915e048cf8b5207abf603136e7d5fcf5b8ad512cce78a2ebe3c88fc3150155893bf9824e6ed6a86414bbe4511a6bd4a42e8ec643c63353dc8eea4a44a021cd')
b2sums_x86_64=('39a37311878fab1a88d0eaeb39f8bd41675e7cc63e6411e0ee4fba01bfda8b1280f5156496954bbe718c24f04306e326215e41d274a0b99909fde3822394ae68')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
