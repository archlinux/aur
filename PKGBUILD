# Maintainer: Maik Broemme <mbroemme@libmpq.org>
pkgname="parsec-sdk-bin"
pkgver="5.0"
pkgrel="1"
arch=("x86_64")
url="https://parsec.app/"
license=("custom")
options=("!strip")
optdepends=(
  "sdl2: for compiling the example client"
)
source=(
  "https://github.com/parsec-cloud/parsec-sdk/archive/${pkgver}.tar.gz"
)
sha256sums=(
  "d0b3f46f5b67830f6e38d7417e92ed8bf34d2e8d7508fa796454a0214cdb7452"
)

package() {
  cd "${srcdir}/parsec-sdk-${pkgver}"
  install -D -m 0755 "sdk/linux/libparsec.so" "${pkgdir}/usr/lib/parsec/sdk/linux/libparsec.so"
  install -D -m 0755 "sdk/macos/libparsec.dylib" "${pkgdir}/usr/lib/parsec/sdk/macos/libparsec.dylib"
  install -D -m 0755 "sdk/windows/parsec.dll" "${pkgdir}/usr/lib/parsec/sdk/windows/parsec.dll"
  install -D -m 0755 "sdk/windows/parsec.lib" "${pkgdir}/usr/lib/parsec/sdk/windows/parsec.lib"
  install -D -m 0755 "sdk/windows/parsec32.dll" "${pkgdir}/usr/lib/parsec/sdk/windows/parsec32.dll"
  install -D -m 0755 "sdk/windows/parsec32.lib" "${pkgdir}/usr/lib/parsec/sdk/windows/parsec32.lib"
  install -D -m 0644 "sdk/parsec-dso.h" "${pkgdir}/usr/include/parsec/sdk/parsec-dso.h"
  install -D -m 0644 "sdk/parsec.h" "${pkgdir}/usr/include/parsec/sdk/parsec.h"
  install -D -m 0644 "examples/client/GNUmakefile" "${pkgdir}/usr/share/doc/parsec/examples/client/GNUmakefile"
  install -D -m 0644 "examples/client/README.md" "${pkgdir}/usr/share/doc/parsec/examples/client/README.md"
  install -D -m 0644 "examples/client/main.c" "${pkgdir}/usr/share/doc/parsec/examples/client/main.c"
  install -D -m 0644 "examples/client/makefile" "${pkgdir}/usr/share/doc/parsec/examples/client/makefile"
  install -D -m 0644 "examples/host/README.md" "${pkgdir}/usr/share/doc/parsec/examples/host/README.md"
  install -D -m 0644 "examples/host/main.c" "${pkgdir}/usr/share/doc/parsec/examples/host/main.c"
  install -D -m 0644 "examples/host/makefile" "${pkgdir}/usr/share/doc/parsec/examples/host/makefile"
  install -D -m 0644 "api/enterprise/README.md" "${pkgdir}/usr/share/doc/parsec/api/enterprise/README.md"
  install -D -m 0644 "api/personal/README.md" "${pkgdir}/usr/share/doc/parsec/api/personal/README.md"
  install -D -m 0644 "api/personal/hosts.py" "${pkgdir}/usr/share/doc/parsec/api/personal/hosts.py"
  install -D -m 0644 "api/personal/login.py" "${pkgdir}/usr/share/doc/parsec/api/personal/login.py"
  install -D -m 0644 "api/third-party/README.md" "${pkgdir}/usr/share/doc/parsec/api/third-party/README.md"
  install -D -m 0644 "api/third-party/auth-codes.py" "${pkgdir}/usr/share/doc/parsec/api/third-party/auth-codes.py"
  install -D -m 0644 "api/third-party/auth-sessions.py" "${pkgdir}/usr/share/doc/parsec/api/third-party/auth-sessions.py"
  install -D -m 0644 "LICENSE.md" "${pkgdir}/usr/share/doc/parsec/LICENSE.md"
}
