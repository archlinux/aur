pkgname=pam-parallel-fprint
pkgver=1.0.0
pkgrel=1
pkgdesc="PAM module that allows for fingerprint and password auth at the same time"
arch=('x86_64')
url="https://github.com/SelimCifci/PAM-Parallel-Fprint"
license=('GPL3')
depends=('pam' 'fprintd')
makedepends=('git' 'cmake')
source=("git+https://github.com/SelimCifci/PAM-Parallel-Fprint.git")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/PAM-Parallel-Fprint"
  cmake -S . -B build
  cmake --build build
}

package() {
  mkdir -p "${pkgdir}/usr/lib/security/"
  cp "${srcdir}/PAM-Parallel-Fprint/build/pam_parallel_fprint.so" "${pkgdir}/usr/lib/security/"
}
