# Maintainer: reallyimeric <reallyimeric@gmail.com>

pkgname=dont-starve-together-server
_dstuser=dstds
pkgver=lastest
pkgrel=1
pkgdesc="Dedicated server for Don't Starve Together"
arch=('x86_64')
depends=(
    'lib32-gcc-libs'
    'lib32-libcurl-gnutls'
    'lib32-glibc'
    'lib32-libidn2'
    'lib32-libssh2'
    'lib32-libpsl'
    'lib32-nettle'
    'lib32-gnutls'
    'lib32-zlib'
    'lib32-libunistring'
    'lib32-openssl'
    'lib32-p11-kit'
    'lib32-libtasn1'
    'lib32-gmp'
    'lib32-libffi'
)
source=(
    "dst-server-steamcmd.service"
    "dst-server.service"
    "dstds-sysusers.conf"
    "dstds-tmpfiles.conf"
)
sha256sums=(
    "f1d9bc8958a9dcb5c2c8ff4c60fa05d37e7ed042c7d5a37ec6dd431692f89c1a"
    "3d6f00b8a2c778b176305d24a179c325d92beca4c41d77e43e8e7701a7af8d40"
    "062da5f97de5eaac510be487f2aff0c308cf8f1da6f2f789c203ee5c72188445"
    "1c11b2bd3645be9e90a0beede8dd3dfbc320c4e2667ca6fbf90d5606c5e10c08"
)

# prepare() {
# }

# build() {
# }

package() {
    install -Dm644 ${_dstuser}-sysusers.conf    "${pkgdir}/usr/lib/sysusers.d/${_dstuser}.conf"
    install -Dm644 ${_dstuser}-tmpfiles.conf    "${pkgdir}/usr/lib/tmpfiles.d/${_dstuser}.conf"
    install -Dm644 dst-server.service           "${pkgdir}/usr/lib/systemd/system/dst-server.service"
    install -Dm644 dst-server-steamcmd.service  "${pkgdir}/usr/lib/systemd/system/dst-server-steamcmd.service"
}
