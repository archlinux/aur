# Maintainer: Vladislav Petrov <ejiek@mail.ru>
pkgname=freerdp-1.1.0
_pkgname=freerdp
pkgver=1.1.0
pkgrel=2
pkgdesc="Free RDP client version 1.1.0 with patches applied by Canonical for Ubuntu bionic version of package"
arch=('i686' 'x86_64')
url="http://freerdp.sourceforge.net"
license=('GPL')
depends=('openssl-1.0' 'libxcursor' 'libcups' 'alsa-lib' 'libxext' 'libxdamage'
         'ffmpeg' 'libxkbfile' 'libxinerama' 'libxv' 'libpulse')
makedepends=('git' 'krb5' 'cmake' 'xorgproto' 'xmlto' 'docbook-xsl')
conflicts=('freerdp' 'freerdp-git')
provides=('freerdp')
source=(git+https://github.com/FreeRDP/FreeRDP.git#commit=440916eae2e07463912d5fe507677e67096eb083
	0001_fix-cmdline-parser.patch
	0002_handle-old-style-cmdline-options.patch
	0003_copy-data-when-adding-glyph-to-cache.patch
	0004_build-cmake-3.1-compatibility.patch
	0005_release-keys-when-xfreerdp-is-unfocused-to-prevent-s.patch
	0006_fix-null-cert-that-is-not-an-error.patch
	0007_Fix-build-failure-on-x32.patch
	0008-Fix-multiple-security-issues.patch
	0009-enable-TLS-12.patch
	1001_hide-internal-symbols.patch
	1002_update-pkg-config-file.patch
	1003_multi-arch-include-path.patch
	1004_64-bit-architectures.patch
	1005_parse-buffer-endianess.patch
	1006_test-unicode-endianess.patch
	1007_detect-arm-arch-correctly.patch
	1008_gcc-fPIC-on-arm64.patch
	1009_libusb-debug.patch
	1010_libudev-link.patch
	1011_ffmpeg-2.9.patch
	1012_typo-fix.patch
	1013_aligned_meminfo_alignment.patch
	2001_detect-ffmpeg-on-Debian.patch
	CVE-2014-0791.patch
	CVE-2018-8786.patch
	CVE-2018-8787.patch
	CVE-2018-8788.patch
	CVE-2018-8789.patch
	tsmf_ffmpeg.patch)
md5sums=('SKIP'
	'fac4007e3e7c23b97f93c705d3f2b318'
	'b07a139fb9fe6bb58fce28cb6652ad5b'
	'685b9b4ec76e05e21c4c0139ff799424'
	'7ad9df81edee2b0f50b31c632ed3115e'
	'ef594eee59363853c344ec264127dffe'
	'68be4cb0387223439304dbb8260c8f10'
	'7355210711d6b31eef62cca6dcfb47b3'
	'e6f05798bcd88dedc4088c33ce0550e8'
	'a2b13ddd61b21457493321d6cb2fdea3'
	'4b234f9fd511784b5afc8b509f2a55ca'
	'e2e046945d90738180a0a74ed1f5716e'
	'f8ffb6e5892a9f4779035a643c28a69b'
	'f45f4ccbb75bc375b66c1f26516638e4'
	'4d806b51c39fb31d151dd1ad2d0d7bef'
	'b00de13c7d72b7140fc7979636446aac'
	'c6e549c8ab2db539daf780e999d5defa'
	'081bef0c3443f2abb4509e8827f18404'
	'b189033a55f32fe940f1643b5a848480'
	'50ce07e227a119cc14f68b1e9da6e502'
	'2849fc753e757b3e28242327c6e592db'
	'7c373a53c8506fd14c836c45bbeefddd'
	'9d1d6b827a0d6b3f8fa308b85e6917bc'
	'1fcc55173b3921698b711cccc9b6594a'
	'30ce3d4083ac14ca1e2d77980a0f1af7'
	'd698f5e4e65363c8a0afc6f8c3375c09'
	'eb5c448d229d5e7825e2cfc6a6bea8e5'
	'5d3b8f0eb6f7c14cadc8006fd2f396ee'
	'39e69a6d8932a45769f24a0c5c99e1ec'
	'ce69a20d193e9aec0a2dedd55253405f')

prepare() {
  cd $srcdir/FreeRDP
  patch -Np1 -i ../0001_fix-cmdline-parser.patch
  patch -Np1 -i ../0002_handle-old-style-cmdline-options.patch
  patch -Np1 -i ../0003_copy-data-when-adding-glyph-to-cache.patch
  patch -Np1 -i ../0004_build-cmake-3.1-compatibility.patch
  patch -Np1 -i ../0005_release-keys-when-xfreerdp-is-unfocused-to-prevent-s.patch
  patch -Np1 -i ../0006_fix-null-cert-that-is-not-an-error.patch
  patch -Np1 -i ../0007_Fix-build-failure-on-x32.patch
  patch -Np1 -i ../0008-Fix-multiple-security-issues.patch
  patch -Np1 -i ../0009-enable-TLS-12.patch
  patch -Np1 -i ../1001_hide-internal-symbols.patch
  patch -Np1 -i ../1002_update-pkg-config-file.patch
  patch -Np1 -i ../1003_multi-arch-include-path.patch
  patch -Np1 -i ../1004_64-bit-architectures.patch
  patch -Np1 -i ../1005_parse-buffer-endianess.patch
  patch -Np1 -i ../1006_test-unicode-endianess.patch
  patch -Np1 -i ../1007_detect-arm-arch-correctly.patch
  patch -Np1 -i ../1008_gcc-fPIC-on-arm64.patch
  patch -Np1 -i ../1009_libusb-debug.patch
  patch -Np1 -i ../1010_libudev-link.patch
  patch -Np1 -i ../1011_ffmpeg-2.9.patch
  patch -Np1 -i ../1012_typo-fix.patch
  patch -Np1 -i ../1013_aligned_meminfo_alignment.patch
  patch -Np1 -i ../2001_detect-ffmpeg-on-Debian.patch
  patch -Np1 -i ../CVE-2014-0791.patch
  patch -Np1 -i ../CVE-2018-8786.patch
  patch -Np1 -i ../CVE-2018-8787.patch
  patch -Np1 -i ../CVE-2018-8788.patch
  patch -Np1 -i ../CVE-2018-8789.patch
  patch -Np1 -i ../tsmf_ffmpeg.patch
}

build() {
  cd $srcdir/FreeRDP
  cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DWITH_PULSEAUDIO=ON \
        -DOPENSSL_ROOT_DIR=/usr/lib/openssl-1.0 \
        -DOPENSSL_SSL_LIBRARY=/usr/lib/openssl-1.0/libssl.so \
        -DOPENSSL_CRYPTO_LIBRARY=/usr/lib/openssl-1.0/libcrypto.so \
        -DOPENSSL_INCLUDE_DIR=/usr/include/openssl-1.0 \
        .
  make
}

package() {
  cd $srcdir/FreeRDP
  make DESTDIR="${pkgdir}" install
}
