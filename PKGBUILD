# Maintainer: agony <27015 at riseup dot net>

pkgname=roughenough-bin
pkgver=2.2.0
pkgrel=1
pkgdesc='Roughtime (RFC 10049) server and client (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/int08h/roughenough'
license=('Apache-2.0 OR MIT')
depends=('glibc' 'libgcc')
provides=("roughenough=${pkgver}")
conflicts=('roughenough')
_release="${url}/releases/download/${pkgver}"
source_x86_64=("roughenough-client-${pkgver}-x86_64.tar.gz::${_release}/roughenough-client-x86_64-unknown-linux-gnu.tar.gz"
               "roughenough-server-${pkgver}-x86_64.tar.gz::${_release}/roughenough-server-x86_64-unknown-linux-gnu.tar.gz"
               "roughenough-keys-${pkgver}-x86_64.tar.gz::${_release}/roughenough-keys-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("roughenough-client-${pkgver}-aarch64.tar.gz::${_release}/roughenough-client-aarch64-unknown-linux-gnu.tar.gz"
                "roughenough-server-${pkgver}-aarch64.tar.gz::${_release}/roughenough-server-aarch64-unknown-linux-gnu.tar.gz"
                "roughenough-keys-${pkgver}-aarch64.tar.gz::${_release}/roughenough-keys-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('cfd805205e891c556ebf3d6ab510a5a72b9b8018e549390d9deddcdf64ff3d0d'
                   'd4bb29bac6c89363f3f64c2091ecdeb8140665e9ae298385636d706762beecee'
                   'd0847f0a7ae1575191b8abb0cff7eee0e86f0658ad8ccd5fbd182118f4d56358')
sha256sums_aarch64=('2f3d7aed1a70528caa1f01edfa273bb1a5634e7a88e2bdf2119721976ed1dfd1'
                    '0dfa8e268a7be0c78220a79a78ff084cf824720501cf3b1e9e6763369ddc3115'
                    'c65eb3551dcf70e3aab3463a36591f7a493b195fa5c81682447159f9cf5be7a0')

package() {
  local _target="${CARCH}-unknown-linux-gnu"
  install -Dm755 "roughenough-client-${_target}/roughenough_client" \
    "roughenough-server-${_target}/roughenough_server" \
    "roughenough-keys-${_target}/roughenough_keys" -t "${pkgdir}/usr/bin"
  install -Dm644 "roughenough-client-${_target}/LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
