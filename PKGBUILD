# Maintainer: Nathaniel Chin <thegamingorangutans+aur at gmail.com>
# Original: Daniel Bermond <dbermond@archlinux.org> > https://aur.archlinux.org/packages/ffmpeg-full-git
# Contributor: Marko Korhonen <reekymarko at reekynet.com>
# Contributor: Bruno Filipe < gmail-com: bmilreu >

pkgname=ffmpeg-amd-full-git
pkgver=8.1.r121549.gc7a2b31f84
pkgrel=1
_svt_hevc_ver='ed80959ebb5586aa7763c91a397d44be1798587c'
_obs_studio_ver='32.0.1'
_whispercpp_ver='1.8.2'
pkgdesc='Complete solution to record, convert and stream audio and video (all possible features for AMD, including libfdk-aac; git version)'
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
    'celt'
    'chromaprint-fftw'
    'codec2'
    'dav1d'
    'davs2'
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
    'libgcrypt'
    'libgme'
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
    'libtheora'
    'libva'
    'libvdpau'
    'libvorbis'
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
    'opencore-amr'
    'opencv2'
    'openh264'
    'openjpeg2'
    'opus'
    'qrencode'
    'quirc'
    'rav1e'
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
    'svt-vp9'
    'tesseract'
    'twolame'
    'uavs3d-git'
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
makedepends=(
    'amf-headers'
    'clang'
    'cmake'
    'git'
    'gmp'
    'libgl'
    'lv2'
    'nasm'
    'opencl-headers'
    'vulkan-headers')
provides=(
    'ffmpeg'
    'ffmpeg-full'
    'ffmpeg-full-git'
    'ffmpeg-git'
    'libavcodec.so'
    'libavdevice.so'
    'libavfilter.so'
    'libavformat.so'
    'libavutil.so'
    'libswscale.so'
    'libswresample.so')
conflicts=('ffmpeg')
source=('git+https://git.ffmpeg.org/ffmpeg.git'
        "https://github.com/obsproject/obs-studio/archive/${_obs_studio_ver}/obs-studio-${_obs_studio_ver}.tar.gz"
        "https://github.com/ggml-org/whisper.cpp/archive/v${_whispercpp_ver}/whisper.cpp-${_whispercpp_ver}.tar.gz"
        '010-ffmpeg-add-svt-hevc.patch'
        "020-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/0002-doc-Add-libsvt_hevc-encoder-docs.patch"
        '030-ffmpeg-add-svt-vp9.patch'
        '040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch'
        '060-ffmpeg-whisper.cpp-fix-pkgconfig.patch'
        'LICENSE')
sha256sums=('SKIP'
            '906278ccedb5ed919e586697467eb7fa4205fceeda127386ce5b74026113ba96'
            'bcee25589bb8052d9e155369f6759a05729a2022d2a8085c1aa4345108523077'
            '7eb13635e5eec4f14b54780f9baa2086675a41c9ebd0030ab82c1c5813f6f7bd'
            'a164ebdc4d281352bf7ad1b179aae4aeb33f1191c444bed96cb8ab333c046f81'
            'f3780fe85da064c09feb61e77a9c1d872063414c6351a289659e3913c5efef57'
            '1c4f328bfb0dfedf4478f7b3659bcd08c591823a389b9e9e4eb8c35b0b3e0356'
            '98b3d28cbd13bb575c602785f6b8cb0b66ea3128ab5a3a82fc1645822320c136'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36')

prepare() {
    rm -f ffmpeg/libavcodec/libsvt_{hevc,vp9}.c
    patch -d ffmpeg -Np1 -i "${srcdir}/010-ffmpeg-add-svt-hevc.patch"
    patch -d ffmpeg -Np1 -i "${srcdir}/020-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"
    patch -d ffmpeg -Np1 -i "${srcdir}/030-ffmpeg-add-svt-vp9.patch"
    patch -d ffmpeg -Np1 -i "${srcdir}/040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch"
    patch -d "whisper.cpp-${_whispercpp_ver}" -Np1 -i "${srcdir}/060-ffmpeg-whisper.cpp-fix-pkgconfig.patch"
}

pkgver() {
    printf '%s.r%s.g%s' "$(git -C ffmpeg describe --tags --long | awk -F'-' '{ sub(/^n/, "", $1); print $1 }')" \
                        "$(git -C ffmpeg describe --tags --match 'N' | awk -F'-' '{ print $2 }')" \
                        "$(git -C ffmpeg rev-parse --short HEAD)"
}

build() {
    # whisper.cpp AUR package conflicts with imagemagick at the time of writing
    # building it locally as a static library for the time being, as imagemagick is a commonly used package (high usage in pkgstats)
    cmake -B build/whisper.cpp -S "whisper.cpp-${_whispercpp_ver}" \
        -G 'Unix Makefiles' \
        -DBUILD_SHARED_LIBS:BOOL='OFF' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH="${srcdir}/staging" \
        -DWHISPER_BUILD_EXAMPLES:BOOL='OFF' \
        -DWHISPER_BUILD_TESTS:BOOL='OFF' \
        -Wno-dev
    cmake --build build/whisper.cpp --target install
    
    cd ffmpeg
    printf '%s\n' '  -> Running ffmpeg configure script...'
    
    local _decklink_include="-isystem${srcdir}/obs-studio-${_obs_studio_ver}/plugins/decklink/linux/decklink-sdk"
    export CFLAGS+=" ${_decklink_include}"
    export CXXFLAGS+=" ${_decklink_include}"
    export PKG_CONFIG_PATH="${srcdir}/staging/lib/pkgconfig${PKG_CONFIG_PATH:+":${PKG_CONFIG_PATH}"}"
    
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
        --enable-libmpeghdec \
        --enable-liboapv \
        --enable-libopencore-amrnb \
        --enable-libopencore-amrwb \
        --enable-libopencv \
        --enable-libopenh264 \
        --enable-libopenjpeg \
        --enable-libopenmpt \
        --disable-libopenvino \
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
        --enable-whisper \
        --enable-xlib \
        --enable-zlib \
        \
        --enable-amf \
        --disable-cuda-nvcc \
        --disable-cuda-llvm \
        --disable-cuvid \
        --disable-ffnvcodec \
        --enable-libdrm \
        --disable-libvpl \
        --disable-libnpp \
        --disable-nvdec \
        --disable-nvenc \
        --disable-ohcodec \
        --disable-omx \
        --disable-rkmpp \
        --enable-v4l2-m2m \
        --enable-vaapi \
        --enable-vdpau
    make
    make tools/qt-faststart
}

package() {
    make -C ffmpeg DESTDIR="$pkgdir" install
    install -D -m755 ffmpeg/tools/qt-faststart -t "${pkgdir}/usr/bin"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
