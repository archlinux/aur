# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="funzzy"
pkgname="${_pkgname}-bin"
pkgver=1.2.0
pkgrel=1
pkgdesc="A lightweight generic purpose file watcher"
arch=('x86_64')
url="https://github.com/cristianoliveira/${_pkgname}"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=("${_pkgname}" 'fzz')
conflicts=("${_pkgname}" 'fzz')
source=("${url}/raw/v${pkgver}/README.md"
        "${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('664a5dd2ab9d108f624355085b5620a76fd06d952d9439ba1e28db6ede5afcfe'
            '06d192e34ed1d62acb191604c71067f6b40bda375e44f92b953bdb0ad7c524db')
sha256sums_x86_64=('d4c72afdda14cfaedf08ba7df14a31a049338952ab33e32dc88c191e2e3260c0')

package() {
  cd "${srcdir}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "pkg"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "fzz" "${pkgdir}/usr/bin/fzz"
}
