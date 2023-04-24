pkgname=kio-s3
pkgver=r221.2c06aed
pkgrel=1
pkgdesc="A kio slave for Amazon Simple Storage Service (Amazon S3)"
arch=('x86_64')
url="https://github.com/KDE/kio-s3"
licenses=(' BSD-3-Clause' 'CC0-1.0' 'GPL-2.0-or-later')
depends=('freetype2' 'double-conversion' 'libnghttp2' 'qt5-base' 'aws-checksums' 'kcoreaddons' 'libpng' 'libgpg-error' 'bzip2' 'graphite' 'acl' 'glibc' 'e2fsprogs' 'libunistring' 'kcrash' 'kwindowsystem' 'pcre2' 'icu' 'ki18n' 'kio' 'zlib' 'aws-c-common' 'kservice' 'libx11' 'lz4' 'kauth' 'md4c' 'libgcrypt' 'harfbuzz' 'aws-c-cal' 'openssl' 'libxdmcp' 's2n-tls' 'systemd-libs' 'xcb-util-keysyms' 'libcap' 'keyutils' 'libidn2' 'xz' 'libglvnd' 'aws-c-event-stream' 'pcre' 'dbus' 'aws-sdk-cpp' 'gcc-libs' 'zstd' 'aws-c-io' 'kconfig' 'libpsl' 'krb5' 'curl' 'qt5-x11extras' 'glib2' 'kdbusaddons' 'libxcb' 'libxau' 'libssh2' 'kdoctools')
makedepends=('extra-cmake-modules' 'git')
source=("git+https://github.com/KDE/kio-s3.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd "$srcdir/${pkgname}"
  cmake .
  make
}

package() {
  make -C "$srcdir/${pkgname}" DESTDIR=$pkgdir install
}
