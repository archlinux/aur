# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: jiribb <jiribb@gmail.com>
# Contributor: David Spicer <azleifel at googlemail dot com>
# Contributor: Andrew Brouwers
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=handbrake-full
pkgname=(handbrake-full handbrake-full-cli)
pkgver=1.7.2
pkgrel=1
pkgdesc="Multithreaded video transcoder. Enabled: x265, nvenc, fdk-aac, qsv, vce, numa, hardened"
arch=(x86_64 i686)
url="https://handbrake.fr/"
license=(GPL2)
source=("${pkgbase%-full}::git+https://github.com/HandBrake/HandBrake.git#tag=${pkgver}"
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/AMF-1.4.30-slim.tar.gz'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/dav1d-1.3.0.tar.bz2'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/libdovi-3.2.0.tar.gz'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/fdk-aac-2.0.2.tar.gz'
        'https://ffmpeg.org/releases/ffmpeg-6.1.tar.bz2'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/libbluray-1.3.4.tar.bz2'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/libdvdnav-6.1.1.tar.bz2'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/libdvdread-6.1.3.tar.bz2'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/libvpx-1.7.0.tar.gz'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/mfx_dispatch-1.35.tar.gz'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/nv-codec-headers-12.1.14.0.tar.gz'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/oneVPL-2023.3.1.tar.gz'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/SVT-AV1-v1.7.0.tar.gz'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/x265-snapshot-20230403-12776.tar.gz'
        'https://github.com/HandBrake/HandBrake-contribs/releases/download/contribs/zimg-3.0.5.tar.gz')
_commondeps=(libxml2 libass libvorbis opus speex libtheora lame libjpeg-turbo
             libx264.so jansson libvpx libva numactl)
_guideps=(gst-plugins-base gtk3 librsvg libgudev)
makedepends=(git intltool python nasm wget cmake meson
             x264
             "${_commondeps[@]}" "${_guideps[@]}")
optdepends=('libdvdcss: for decoding encrypted DVDs'
            'intel-media-sdk: for enabling Intel QSV'
            'nvidia-utils: for enabling Nvidia nvenc')
sha256sums=('SKIP'
            '665bd83dc7facb407e9e32168e38f9a1e0f37cd3802f4409d3889a3bcaec908f'
            'bde8db3d0583a4f3733bb5a4ac525556ffd03ab7dcd8a6e7c091bee28d9466b1'
            '23c339b08bf32b66144b8fe17bf9a39f2dc810a37f081e5bc50207af9ae99922'
            '7812b4f0cf66acda0d0fe4302545339517e702af7674dd04e5fe22a5ade16a90'
            'eb7da3de7dd3ce48a9946ab447a7346bd11a3a85e6efb8f2c2ce637e7f547611'
            '478ffd68a0f5dde8ef6ca989b7f035b5a0a22c599142e5cd3ff7b03bbebe5f2b'
            'c191a7475947d323ff7680cf92c0fb1be8237701885f37656c64d04e98d18d48'
            'ce35454997a208cbe50e91232f0e73fb1ac3471965813a13b8730a8f18a15369'
            '1fec931eb5c94279ad219a5b6e0202358e94a93a90cfb1603578c326abfc1238'
            '0790ff82158837124150ab4034db37433a92caac0f145f249d2f194d8ccba3ca'
            '62b30ab37e4e9be0d0c5b37b8fee4b094e38e570984d56e1135a6b6c2c164c9f'
            '4411543519486a2450f6f5af06a077596e7888a551768594e9dfa2a46b23b6f5'
            'ce0973584f1a187aa4abf63f509ff8464397120878e322a3153f87e9c161fc4f'
            '23898695c5520e9e971d12e88125d5ad03ad67f462fc8ecaa016b48adad7cb20'
            'a9a0226bf85e0d83c41a8ebe4e3e690e1348682f6a2a7838f1b8cbff1b799bcf')
options=(!lto)
noextract=(
    'AMF-1.4.30-slim.tar.gz'
    'dav1d-1.3.0.tar.bz2'
    'fdk-aac-2.0.2.tar.gz'
    'ffmpeg-6.1.tar.bz2'
    'libbluray-1.3.4.tar.bz2'
    'libdovi-3.2.0.tar.gz'
    'libdvdnav-6.1.1.tar.bz2'
    'libdvdread-6.1.3.tar.bz2'
    'libvpx-1.7.0.tar.gz'
    'mfx_dispatch-1.35.tar.gz'
    'nv-codec-headers-12.1.14.0.tar.gz'
    'oneVPL-2023.3.1.tar.gz'
    'SVT-AV1-v1.7.0.tar.gz'
    'x265-snapshot-20230403-12776.tar.gz'
    'zimg-3.0.5.tar.gz'
    )

prepare() {
  cd "${pkgbase%-full}"

  [ -d download ] || mkdir download
  for _tarball in ${noextract[@]}; do
    cp ../${_tarball} download/
  done
}

 build() {
  cd "${pkgbase%-full}"

  ./configure \
    --prefix=/usr \
    --harden \
    --enable-x265 \
    --enable-numa \
    --enable-fdk-aac \
    --enable-nvenc \
    --enable-qsv \
    --enable-vce

  make -C build
}

package_handbrake-full() {
  pkgdesc="Multithreaded video transcoder"
  depends=("${_commondeps[@]}" "${_guideps[@]}")
  optdepends+=('gst-plugins-good: for video previews'
              'gst-libav: for video previews')
  provides=(handbrake)
  conflicts=(handbrake)

  cd "$srcdir/handbrake/build"

  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/bin/HandBrakeCLI"
}

package_handbrake-full-cli() {
  pkgdesc="Multithreaded video transcoder (CLI)"
  depends=("${_commondeps[@]}")
  provides=(handbrake-cli)
  conflicts=(handbrake-cli)

  cd "$srcdir/handbrake/build"
  install -D HandBrakeCLI "$pkgdir/usr/bin/HandBrakeCLI"
}
