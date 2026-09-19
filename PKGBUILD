# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

pkgname=ffmpeg-full
pkgver=9.0.2
pkgrel=1
_svt_hevc_ver='4181c9ee0611baefb40b4c0ed10023cfd837d522'
_whispercpp_ver='1.9.4'
pkgdesc='Complete solution to record, convert and stream audio and video (all possible features including libfdk-aac)'
arch=('x86_64')
url='https://ffmpeg.org/'
license=('LicenseRef-nonfree-and-unredistributable')
depends=(
    'alsa-lib'
    'aom'
    'aribb24'
    'avisynthplus' # loaded on-demand by dlopen()
    'bzip2'
    'cairo'
    'chromaprint-fftw'
    'codec2'
    'dav1d'
    'davs2'
    'flite1'
    'fontconfig'
    'freetype2'
    'frei0r-plugins' # loaded on-demand by dlopen()
    'fribidi'
    'glib2'
    'glibc'
    'gnutls'
    'gsm'
    'harfbuzz'
    'jack'
    'kvazaar'
    'ladspa' # loaded on-demand by dlopen()
    'lame'
    'lcevcdec'
    'lcms2'
    'libaribcaption'
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
    'libgcc'
    'libgcrypt'
    'libgme'
    'libgomp'
    'libiec61883'
    'libilbc'
    'libjxl'
    'libklvanc'
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
    'libstdc++'
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
    'mpeghdec'
    'ocl-icd'
    'openal'
    'openapv'
    'opencolorio'
    'opencore-amr'
    'opencv4'
    'openh264'
    'openjpeg2'
    'openvino'
    'opus'
    'qrencode'
    'quirc'
    'rav1e'
    'rockchip-mpp'
    'rtmpdump'
    'rubberband'
    'sdl2'
    'shine'
    'smbclient'
    'snappy'
    'sndio'
    'speex'
    'srt'
    'svt-av1'
    'svt-hevc'
    'svt-jpeg-xs-git'
    'svt-vp9'
    'tesseract'
    'twolame'
    'uavs3d'
    'v4l-utils'
    'vapoursynth' # loaded on-demand by dlopen()
    'vid.stab'
    'vmaf'
    'vo-amrwbenc'
    'vulkan-icd-loader' # loaded on-demand by dlopen()
    'vvenc'
    'x264'
    'x265'
    'xavs'
    'xavs2'
    'xevd'
    'xeve'
    'xvidcore'
    'xz'
    'zeromq'
    'zimg'
    'zlib'
    'zvbi')
optdepends=(
    'nvidia-utils: for NVIDIA CUVID/NVDEC/NVENC support'
    'vpl-runtime: for Intel Quick Sync Video')
makedepends=(
    'amf-headers'
    'clang'
    'cmake'
    'cuda'
    'decklink-sdk'
    'ffnvcodec-headers'
    'git'
    'glslang'
    'gmp'
    'libgl'
    'lv2'
    'nasm'
    'opencl-headers'
    'spirv-headers'
    'vulkan-headers')
provides=(
    'ffmpeg'
    'libavcodec.so'
    'libavdevice.so'
    'libavfilter.so'
    'libavformat.so'
    'libavutil.so'
    'libswscale.so'
    'libswresample.so')
conflicts=('ffmpeg')
source=("https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"{,.asc}
        'git+https://github.com/lensfun/lensfun.git'
        "https://github.com/ggml-org/whisper.cpp/archive/v${_whispercpp_ver}/whisper.cpp-${_whispercpp_ver}.tar.gz"
        '010-ffmpeg-add-svt-hevc.patch'
        "020-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/0002-doc-Add-libsvt_hevc-encoder-docs.patch"
        '030-ffmpeg-add-svt-vp9.patch'
        '040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch'
        '050-ffmpeg-fix-cuda-nvcc-with-gcc14.patch'
        '060-ffmpeg-lensfun-fix-pkgconfig.patch'
        '070-ffmpeg-whisper.cpp-fix-pkgconfig.patch'
        'LICENSE')
sha256sums=('8c3850283eb25fa026482078a04051e0be17347b09ef81a0849bec15a96e002e'
            'SKIP'
            'SKIP'
            '57e280cee375ab02425b806ad5146b99f6eb9357e3c2b31357c8a6af2e2e44ae'
            'e6fdcb8446b0a0c0967f125d2de5084a5bdb418a1a6608f808cff2c97fc9bd6a'
            'a164ebdc4d281352bf7ad1b179aae4aeb33f1191c444bed96cb8ab333c046f81'
            'cc80568f7dab2094f4f3bede6d0f068f217161f924915b067b0d287cf53b0849'
            'cd1aa93e78800247b4516a01ef391106acb362957bd1e56f85d64906343cddac'
            '4a9a672f67cc0e5dd63bd7659f5a5198cd981e60bbbc1b9a63277758be6a7fdf'
            'c39addf190d25d1182c5c5658677f77ee7c1ae542969b2004441c62a425d324b'
            '2c846c629ad129ae8ce50791de4f1d390714db6d6420a35406b83b9b44999d4a'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36')
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')

prepare() {
    rm -f "ffmpeg-${pkgver}/libavcodec"/libsvt_{hevc,vp9}.c
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/010-ffmpeg-add-svt-hevc.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/020-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/030-ffmpeg-add-svt-vp9.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/050-ffmpeg-fix-cuda-nvcc-with-gcc14.patch"
    patch -d lensfun -Np1 -i "${srcdir}/060-ffmpeg-lensfun-fix-pkgconfig.patch"
    patch -d "whisper.cpp-${_whispercpp_ver}" -Np1 -i "${srcdir}/070-ffmpeg-whisper.cpp-fix-pkgconfig.patch"
}

build() {
    local _stagingdir="${srcdir}/staging"
    local _pkgconfigdir="${_stagingdir}/lib/pkgconfig"
    export PKG_CONFIG_PATH="${_pkgconfigdir}${PKG_CONFIG_PATH:+":${PKG_CONFIG_PATH}"}"
    
    local -a _cmake_opts=(
        '-GUnix Makefiles'
        '-DBUILD_SHARED_LIBS:BOOL=OFF'
        '-DCMAKE_BUILD_TYPE:STRING=None'
        "-DCMAKE_INSTALL_PREFIX:PATH=${_stagingdir}"
        '-Wno-author')
    
    # ffmpeg requires lensfun git master, but lensfun-git package wrongly installs its files to non-standard locations:
    # https://aur.archlinux.org/cgit/aur.git/commit/?h=lensfun-git&id=7b7a2d4890df59cde62c7dbfde3cefd7868a2707
    # building it locally as a static library for the time being - this also have the benefit of avoid rebuilding packages
    # requiring lensfun, like gegl (required for gimp, a commonly used package), as lensfun git master have a soname bump
    cmake -B build/lensfun -S lensfun \
        "${_cmake_opts[@]}" \
        -DBUILD_STATIC:BOOL='ON' \
        -DINSTALL_PYTHON_MODULE:BOOL='OFF' \
        -DINSTALL_HELPER_SCRIPTS:BOOL='OFF'
    cmake --build build/lensfun --target install
    
    # using whisper-cpp package from the official repositories will cause a circular dependency with ffmpeg,
    # building it locally as a static library for the time being
    cmake -B build/whisper.cpp -S "whisper.cpp-${_whispercpp_ver}" \
        "${_cmake_opts[@]}" \
        -DGGML_CCACHE:BOOL='OFF' \
        -DWHISPER_BUILD_EXAMPLES:BOOL='OFF' \
        -DWHISPER_BUILD_TESTS:BOOL='OFF'
    cmake --build build/whisper.cpp --target install
    
    cd "ffmpeg-${pkgver}"
    printf '%s\n' '  -> Running ffmpeg configure script...'
    
    export CFLAGS+=' -isystem/opt/cuda/include'
    export LDFLAGS+=' -L/opt/cuda/lib64'
    
    # fix build of libavfilter/asrc_flite.c with gcc 14
    export CFLAGS+=' -Wno-error=incompatible-pointer-types'
    
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
        --enable-cairo \
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
        --enable-libgme \
        --enable-libgsm \
        --enable-libharfbuzz \
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
        --enable-libmpeghdec \
        --enable-libmysofa \
        --enable-liboapv \
        --enable-libopencolorio \
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
        --enable-libshine \
        --enable-libsmbclient \
        --enable-libsnappy \
        --enable-libsoxr \
        --enable-libspeex \
        --enable-libsrt \
        --enable-libssh \
        --enable-libsvtav1 \
        --enable-libsvthevc \
        --enable-libsvtjpegxs \
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
        --disable-mbedtls \
        --disable-openssl \
        --disable-pocketsphinx \
        --enable-vapoursynth \
        --enable-whisper \
        --enable-xlib \
        --enable-zlib \
        \
        --enable-decklink \
        --enable-openal \
        --enable-sndio \
        --enable-sdl2 \
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
        --disable-ohcodec \
        --enable-opencl \
        --enable-opengl \
        --enable-rkmpp \
        --enable-v4l2-m2m \
        --enable-vdpau \
        --enable-vaapi \
        --enable-vulkan
    make
    make tools/qt-faststart
}

package() {
    make -C "ffmpeg-${pkgver}" DESTDIR="$pkgdir" install
    install -D -m755 "ffmpeg-${pkgver}/tools/qt-faststart" -t "${pkgdir}/usr/bin"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    sed -i \
        -e 's|-llensfun ||' \
        -e 's|-lwhisper ||' \
        -e "s|-L${srcdir}/staging/lib ||g" \
        "${pkgdir}/usr/lib/pkgconfig/libavfilter.pc"
}
