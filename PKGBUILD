# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="tncattach"
pkgname="${_pkgname}-bin"
pkgver=0.1.9
pkgrel=1
pkgdesc="Attach TNC devices as network interfaces"
arch=('armv7h' 'x86_64')
url="https://unsigned.io/software/tncattach.html"
_url="https://github.com/markqvist/${_pkgname}"
license=('MIT')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_url##*/}-${pkgver}"
source_armv7h=("${_pkgsrc}-armv7h.tar.xz::${_url}/releases/download/${pkgver}/${_pkgsrc//-/_}_armhf.tar.xz")
source_x86_64=("${_pkgsrc}-x86_64.tar.xz::${_url}/releases/download/${pkgver}/${_pkgsrc//-/_}_amd64.tar.xz")
sha256sums_armv7h=('1def39aa99b44ed1f039a35d8f2f65221a25f369273dff785b17358537bc37d9')
sha256sums_x86_64=('1a375cb6f68a9ffae0e7ce5cc98c187d9ad4a3b3566e5dca0c0a169f3662045c')

if   [ "${CARCH}" = 'armv7h' ]; then _arch=armhf;
elif [ "${CARCH}" = 'x86_64' ]; then _arch=amd64; fi

package() {
  cd "${srcdir}/${_pkgname}_${_arch}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
