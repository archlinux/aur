# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="nanocl"
pkgname="${_pkgname}-bin"
pkgver=0.15.0
pkgrel=1
pkgdesc="Distributed System that simplifies the management of containers and virtual machines"
arch=('x86_64')
url="https://next-hat.com/${_pkgname}"
_url="https://github.com/next-hat/${_pkgname}"
license=('Apache-2.0' 'MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(${_url}/raw/${_pkgname}-${pkgver}/{README.md,LICENSE-{APACHE,MIT}})
source_x86_64=("${_url}/releases/download/${_pkgname}-${pkgver}/${_pkgname}_${pkgver}_amd64.tar.gz")
sha256sums=('7e5c33e292e315210eb5c9ed3502d6fad6082d39aef0b153170820db4032136e'
            'eb641414f479cd1268f880aecba2ef4e539ef7013a262d474a08d3197f385440'
            '3fba92360d6a716c68c72f0a0a0c696642170b324c4777663e18edf9c8b6aa6e')
sha256sums_x86_64=('8b16872825b1cf9ad9e02fdf5db55542ea404c6ffc06cd51887e9a880bf58951')

package() {
  cd "${srcdir}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE-2.0"
  install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"

  find "bin"   -type f -exec install -Dm755 "{}" "${pkgdir}/usr/{}" \;
  find "share" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/{}" \;
}
