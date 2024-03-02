# Maintainer: goetzc
# Contributor: AsGreyWolf
# Generated: debtap
pkgname=libdicomscope-jni-bin
_pkgname=libdicomscope-jni
pkgver=3.6.0
pkgrel=27
_debrel=${pkgrel}
pkgdesc="OFFIS DICOM viewer (JNI files)."
arch=('i686' 'x86_64')
url="https://dicom.offis.de/dscope.php.en"
_url="https://packages.ubuntu.com/focal/libdicomscope-jni" # LTS
license=('OFFIS')
groups=('')
depends=('libdcmtk17')
replaces=("${_pkgname}" 'dicomscope<3.6.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!emptydirs')

source_x86_64=("https://mirrors.kernel.org/ubuntu/pool/universe/d/dicomscope/${_pkgname}_${pkgver}-${_debrel}_amd64.deb")

package() {
  tar xf data.tar.zst -C "${pkgdir}"
  mv "${pkgdir}/usr/lib/x86_64-linux-gnu/jni" "${pkgdir}/usr/lib/"
  rmdir "${pkgdir}/usr/lib/x86_64-linux-gnu/"

  install -D -m644 "${pkgdir}/usr/share/doc/${_pkgname}/copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

sha256sums_x86_64=('662ab5f2d421c726902f9d2c1c52fa20f8601f672841d62d88a8162d1457b41d')
