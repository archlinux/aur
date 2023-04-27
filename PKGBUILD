# Maintainer: wiltsig <WTS012201@gmail.com>
pkgname=tfi-git
_pkgname=Text-From-Image
pkgver=1.0.0
pkgrel=1
pkgdesc="Text From Image allows user to extract and modify text from images"

makedepends=("git")
arch=('x86_64')
url="https://github.com/WTS012201/Text-From-Image.git"
license=('GPL-3.0')
depends=('cudnn' 'hdf5' 'hdf5-openmpi' 'highway' 'leptonica' 'libaec' 'libjxl' 'libmfx' 'openblas' 'pugixml' 'tesseract' 'vtk' 'acl' 'brotli' 'bzip2' 'curl' 'dbus' 'e2fsprogs' 'expat' 'gcc-libs' 'glib2' 'glibc' 'gmp' 'gnutls' 'icu' 'keyutils' 'krb5' 'libarchive' 'libcap' 'libelf' 'libffi' 'libgcrypt' 'libgpg-error' 'libidn2' 'libnghttp2' 'libp11-kit' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libusb' 'libxml2' 'lz4' 'nettle' 'openssl' 'pcre2' 'systemd-libs' 'util-linux-libs' 'xz' 'zlib' 'zstd' 'aom' 'blas' 'cairo' 'cblas' 'dav1d' 'double-conversion' 'ffmpeg' 'fmt' 'fontconfig' 'freetype2' 'fribidi' 'gdk-pixbuf2' 'giflib' 'glew' 'graphite' 'gsm' 'gst-plugins-base-libs' 'gstreamer' 'harfbuzz' 'imath' 'jsoncpp' 'lame' 'lapack' 'libbluray' 'libdatrie' 'libdc1394' 'libdrm' 'libglvnd' 'libjpeg-turbo' 'libmodplug' 'libogg' 'libopenmpt' 'libpng' 'libraw1394' 'librsvg' 'libsoxr' 'libssh' 'libthai' 'libtheora' 'libtiff' 'libunwind' 'libva' 'libvdpau' 'libvorbis' 'libvpx' 'libwebp' 'libx11' 'libxau' 'libxcb' 'libxcursor' 'libxdmcp' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrender' 'md4c' 'mpg123' 'onetbb' 'opencore-amr' 'opencv' 'opencv-cuda' 'openexr' 'openjpeg2' 'opus' 'orc' 'pango' 'pixman' 'protobuf' 'qt5-base' 'rav1e' 'speex' 'srt' 'svt-av1' 'x264' 'x265' 'xvidcore')
md5sums=('SKIP')
source=("git+$url")

build() {
    cd "${_pkgname}"
    qmake . && make -j8
}
package() {
    cd "${_pkgname}"
    qmake . && sudo make install -j8
    sudo ln -sf /opt/Text-From-Image/bin/Text-From-Image  /usr/bin/tfi
    # install -Dm644 LICENSE "${}"
    # install -Dm644 README.md "${}"
}
# template end;
