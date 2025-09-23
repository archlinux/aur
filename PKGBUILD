# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

pkgname=ffmpeg-full
pkgver=7.1.1
pkgrel=7
_svt_hevc_ver='ed80959ebb5586aa7763c91a397d44be1798587c'
_svt_vp9_ver='3b9a3fa43da4cc5fe60c7d22afe2be15341392ea'
_obs_studio_ver='31.1.2'
pkgdesc='Complete solution to record, convert and stream audio and video (all possible features including libfdk-aac)'
arch=('x86_64')
url='https://www.ffmpeg.org/'
license=('LicenseRef-nonfree-and-unredistributable')
depends=(
    'alsa-lib'
    'aom'
    'aribb24'
    'avisynthplus' # loaded on-demand by dlopen()
    'bzip2'
    'cairo'
    'celt'
    'codec2'
    'dav1d'
    'flite1'
    'fontconfig'
    'freetype2'
    'frei0r-plugins' # loaded on-demand by dlopen()
    'fribidi'
    'gcc-libs'
    'glib2'
    'glibc'
    'glslang'
    'gnutls'
    'gsm'
    'harfbuzz'
    'jack'
    'kvazaar'
    'ladspa' # loaded on-demand by dlopen()
    'lame'
    'lcevcdec'
    'lcms2'
    'lensfun-git'
    'libass'
    'libavc1394'
    'libbluray'
    'libbs2b'
    'libcaca'
    'libcdio-paranoia'
    'libdc1394'
    'libdrm'
    'libdvdnav'
    'libdvdread'
    'libfdk-aac'
    'libgcrypt'
    'libgme'
    'libiec61883'
    'libilbc'
    'libjxl'
    'liblc3'
    'libmodplug'
    'libmysofa'
    'libopenmpt'
    'libplacebo'
    'libpulse'
    'librabbitmq-c'
    'libraw1394'
    'librist'
    'librsvg'
    'libsoxr'
    'libssh'
    'libtheora'
    'libva'
    'libvdpau'
    'libvorbis'
    'libvpl'
    'libvpx'
    'libx11'
    'libxcb'
    'libxext'
    'libxml2'
    'libxv'
    'libwebp'
    'lilv'
    'ocl-icd'
    'openal'
    'opencore-amr'
    'opencv2'
    'openh264'
    'openjpeg2'
    'openvino'
    'opus'
    'qrencode'
    'quirc'
    'rav1e'
    'rtmpdump'
    'rubberband'
    'sdl2'
    'smbclient'
    'snappy'
    'sndio'
    'speex'
    'spirv-tools'
    'srt'
    'svt-av1'
    'svt-hevc'
    'svt-vp9'
    'tesseract'
    'twolame'
    'v4l-utils'
    'vapoursynth' # loaded on-demand by dlopen()
    'vid.stab'
    'vmaf'
    'vulkan-icd-loader' # loaded on-demand by dlopen()
    'x264'
    'x265'
    'xvidcore'
    'xz'
    'zeromq'
    'zimg'
    'zlib'
    'zvbi'
    # aur:
    'chromaprint-fftw'
    'davs2'
    'libaribcaption'
    'libklvanc'
    'rockchip-mpp'
    'shine'
    'uavs3d-git'
    'vo-amrwbenc'
    'vvenc'
    'xavs'
    'xavs2'
    'xevd'
    'xeve'
)
optdepends=(
    'nvidia-utils: for NVIDIA NVDEC/NVENC support'
    'vpl-runtime: for Intel Quick Sync Video'
)
makedepends=(
    'amf-headers'
    'clang'
    'cuda'
    'ffnvcodec-headers'
    'gmp'
    'libgl'
    'libomxil-bellagio'
    'lv2'
    'nasm'
    'patchutils'
    'opencl-headers'
    'vulkan-headers'
)
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavutil.so' 'libpostproc.so' 'libswscale.so' 'libswresample.so'
          'ffmpeg')
conflicts=('ffmpeg')
source=("https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"{,.asc}
        "https://github.com/obsproject/obs-studio/archive/${_obs_studio_ver}/obs-studio-${_obs_studio_ver}.tar.gz"
        "010-ffmpeg-add-svt-hevc-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/master-0001-lavc-svt_hevc-add-libsvt-hevc-encoder-wrapper.patch"
        "020-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/0002-doc-Add-libsvt_hevc-encoder-docs.patch"
        "030-ffmpeg-add-svt-vp9-g${_svt_vp9_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-VP9/${_svt_vp9_ver}/ffmpeg_plugin/master-0001-Add-ability-for-ffmpeg-to-run-svt-vp9.patch"
        "031-ffmpeg-add-svt-vp9.patch"
        '040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch'
        '050-ffmpeg-fix-nvidia-vulkan-decoding-segfault.patch'
        '060-ffmpeg-svt-av1-3.0.0-fix.patch'::'https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/d1ed5c06e3edc5f2b5f3664c80121fa55b0baa95'
        '070-ffmpeg-fix-cuda-nvcc-with-gcc14.patch'
        '080-ffmpeg-lcevcdec4.0.0-fix.patch'
        '090-ffmpeg-cuda13-fix.patch'
        'LICENSE')
sha256sums=('733984395e0dbbe5c046abda2dc49a5544e7e0e1e2366bba849222ae9e3a03b1'
            'SKIP'
            '11d7b5fbb234e926b04b921203c152517a928032e757689d964c5f9a0a9a4157'
            '9047e18d34716812d4ea7eafc1d0fd8b376d922a4b6b4dc20237662fcaf0c996'
            'a164ebdc4d281352bf7ad1b179aae4aeb33f1191c444bed96cb8ab333c046f81'
            '59da61f2b2c556fbe0cdbf84bcc00977ee3d2447085decb21f6298226559f2aa'
            'aa0daffc4d234b6621b63c298dc165d29522c5087f8905a923d23ee2d164e9ad'
            '57697441b8f3ff3be883a2444b4cb89eed452764d24965e74e7b101e6af7f70a'
            '5a3731d1410747703948c87e46bb3aef820c6038f7101ab37f9d072cd1d15d15'
            'b83ba1efdfec19ac54d1b0395a98d02039fe9d45bec1e6473e57a6288a304884'
            'e670e6ed4e6e614a248cedd9de461ddce2321d2fef982861c86639eaa65dce23'
            '2ff4ba31e43d6d397542ec25df224cef01cf501409e202255e9414e482ba14cf'
            '24976a8d632e4540350fbe25d3debc0305b5d1116cc79b176144957c157dbcf8'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36')
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')

prepare() {
    rm -f "ffmpeg-${pkgver}/libavcodec/"libsvt_{hevc,vp9}.c
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/010-ffmpeg-add-svt-hevc-g${_svt_hevc_ver:0:7}.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/020-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/031-ffmpeg-add-svt-vp9.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i <(filterdiff -i b/libavcodec/libsvt_vp9.c "030-ffmpeg-add-svt-vp9-g${_svt_vp9_ver:0:7}.patch")
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/050-ffmpeg-fix-nvidia-vulkan-decoding-segfault.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/060-ffmpeg-svt-av1-3.0.0-fix.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/070-ffmpeg-fix-cuda-nvcc-with-gcc14.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/080-ffmpeg-lcevcdec4.0.0-fix.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/090-ffmpeg-cuda13-fix.patch"
}

build() {
    cd "ffmpeg-${pkgver}"
    printf '%s\n' '  -> Running ffmpeg configure script...'
    
    export CFLAGS+=' -isystem/opt/cuda/include'
    export CFLAGS+=" -isystem${srcdir}/obs-studio-${_obs_studio_ver}/plugins/decklink/linux/decklink-sdk"
    export LDFLAGS+=' -L/opt/cuda/lib64'
    
    # fix build of libavfilter/asrc_flite.c with gcc 14
    export CFLAGS+=' -Wno-incompatible-pointer-types'
    
    ./configure \
        --prefix='/usr' \
        --enable-lto \
        \
        --disable-rpath \
        --enable-gpl \
        --enable-version3 \
        --enable-nonfree \
        --enable-shared \
        --disable-static \
        --disable-stripping \
        --disable-htmlpages \
        --enable-gray \
        \
        --enable-alsa \
        --enable-avisynth \
        --enable-bzlib \
        --enable-chromaprint \
        --enable-frei0r \
        --enable-gcrypt \
        --enable-gmp \
        --enable-gnutls \
        --enable-iconv \
        --enable-ladspa \
        --enable-lcms2 \
        --enable-libaom \
        --enable-libaribb24 \
        --enable-libaribcaption \
        --enable-libass \
        --enable-libbluray \
        --enable-libbs2b \
        --enable-libcaca \
        --enable-libcelt \
        --enable-libcdio \
        --enable-libcodec2 \
        --enable-libdav1d \
        --enable-libdavs2 \
        --enable-libdc1394 \
        --enable-libdvdnav \
        --enable-libdvdread \
        --enable-libfdk-aac \
        --enable-libflite \
        --enable-libfontconfig \
        --enable-libfreetype \
        --enable-libfribidi \
        --enable-libharfbuzz \
        --enable-libglslang \
        --enable-libgme \
        --enable-libgsm \
        --enable-libiec61883 \
        --enable-libilbc \
        --enable-libjack \
        --enable-libjxl \
        --enable-libklvanc \
        --enable-libkvazaar \
        --enable-liblc3 \
        --enable-liblcevc-dec \
        --enable-liblensfun \
        --enable-libmodplug \
        --enable-libmp3lame \
        --enable-libopencore-amrnb \
        --enable-libopencore-amrwb \
        --enable-libopencv \
        --enable-libopenh264 \
        --enable-libopenjpeg \
        --enable-libopenmpt \
        --enable-libopenvino \
        --enable-libopus \
        --enable-libplacebo \
        --enable-libpulse \
        --enable-libqrencode \
        --enable-libquirc \
        --enable-librabbitmq \
        --enable-librav1e \
        --enable-librist \
        --enable-librsvg \
        --enable-librubberband \
        --enable-librtmp  \
        --disable-libshaderc \
        --enable-libshine \
        --enable-libsmbclient \
        --enable-libsnappy \
        --enable-libsoxr \
        --enable-libspeex \
        --enable-libsrt \
        --enable-libssh \
        --enable-libsvtav1 \
        --enable-libsvthevc \
        --enable-libsvtvp9 \
        --disable-libtensorflow \
        --enable-libtesseract \
        --enable-libtheora \
        --disable-libtls \
        --disable-libtorch \
        --enable-libtwolame \
        --enable-libuavs3d \
        --enable-libv4l2 \
        --enable-libvidstab \
        --enable-libvmaf \
        --enable-libvo-amrwbenc \
        --enable-libvorbis \
        --enable-libvpx \
        --enable-libvvenc \
        --enable-libwebp \
        --enable-libx264 \
        --enable-libx265 \
        --enable-libxevd \
        --enable-libxeve \
        --enable-libxavs \
        --enable-libxavs2 \
        --enable-libxcb \
        --enable-libxcb-shm \
        --enable-libxcb-xfixes \
        --enable-libxcb-shape \
        --enable-libxvid \
        --enable-libxml2 \
        --enable-libzimg \
        --enable-libzmq \
        --enable-libzvbi \
        --enable-lv2 \
        --enable-lzma \
        --enable-decklink \
        --disable-mbedtls \
        --enable-libmysofa \
        --enable-openal \
        --enable-opencl \
        --enable-opengl \
        --disable-openssl \
        --disable-pocketsphinx \
        --enable-sndio \
        --enable-sdl2 \
        --enable-vapoursynth \
        --enable-vulkan \
        --enable-xlib \
        --enable-zlib \
        \
        --enable-amf \
        --enable-cuda-nvcc \
        --enable-cuda-llvm \
        --enable-cuvid \
        --enable-ffnvcodec \
        --enable-libdrm \
        --enable-libvpl \
        --disable-libnpp \
        --enable-nvdec \
        --enable-nvenc \
        --enable-omx \
        --enable-rkmpp \
        --enable-v4l2-m2m \
        --enable-vaapi \
        --enable-vdpau
    make
    make tools/qt-faststart
}

package() {
    make -C "ffmpeg-${pkgver}" DESTDIR="$pkgdir" install
    install -D -m755 "ffmpeg-${pkgver}/tools/qt-faststart" -t "${pkgdir}/usr/bin"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
