# Maintainer: Jacob Ledbetter <jledbetter460@gmail.com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

pkgname=ffmpeg-full-llvm
pkgver=9.0
pkgrel=2
_svt_hevc_ver='4181c9ee0611baefb40b4c0ed10023cfd837d522'
_whispercpp_ver='1.9.1'
pkgdesc='Complete solution to record, convert and stream audio and video (all possible features including libfdk-aac) — built with Clang and LLVM lld'
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
    'chromaprint-fftw-llvm'
    'codec2'
    'dav1d'
    'davs2-llvm'
    'flite1-llvm'
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
    'lcevcdec-llvm'
    'lcms2'
    'libaribcaption-llvm'
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
    'libklvanc-llvm'
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
    'mpeghdec-llvm'
    'ocl-icd'
    'openal'
    'openapv-llvm'
    'opencolorio'
    'opencore-amr'
    'opencv4-llvm'
    'openh264'
    'openjpeg2'
    'openvino-llvm'
    'opus'
    'qrencode'
    'quirc-llvm'
    'rav1e'
    'rockchip-mpp-llvm'
    'rtmpdump'
    'rubberband'
    'sdl2'
    'shine-llvm'
    'smbclient'
    'snappy'
    'sndio'
    'speex'
    'srt'
    'svt-av1'
    'svt-hevc'
    'svt-jpeg-xs-llvm-git'
    'svt-vp9'
    'tesseract'
    'twolame'
    'uavs3d-llvm-git'
    'v4l-utils'
    'vapoursynth' # loaded on-demand by dlopen()
    'vid.stab'
    'vmaf'
    'vo-amrwbenc-llvm'
    'vulkan-icd-loader' # loaded on-demand by dlopen()
    'vvenc-llvm'
    'x264'
    'x265'
    'xavs-llvm'
    'xavs2-llvm'
    'xevd-llvm'
    'xeve-llvm'
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
    'glslang'
    'lld'
    'llvm'
    'cuda'
    'decklink-sdk'
    'ffnvcodec-headers'
    'git'
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
conflicts=('ffmpeg' 'ffmpeg-full')
source=("https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"{,.asc}
        'git+https://github.com/lensfun/lensfun.git'
        "https://github.com/ggml-org/whisper.cpp/archive/v${_whispercpp_ver}/whisper.cpp-${_whispercpp_ver}.tar.gz"
        '010-ffmpeg-add-svt-hevc.patch'
        "020-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/0002-doc-Add-libsvt_hevc-encoder-docs.patch"
        '030-ffmpeg-add-svt-vp9.patch'
        '040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch'
        '050-ffmpeg-fix-cuda-nvcc-with-gcc14.patch'
        '060-ffmpeg-whisper.cpp-fix-pkgconfig.patch'
        '070-ffmpeg9-svt-codec-pixfmts.patch'
        'LICENSE')
sha256sums=('7f607a00dd0d28a729d5a4811205812eef01cf6ef6155025febb6f36a9062d52'
            'SKIP'
            'SKIP'
            '147267177eef7b22ec3d2476dd514d1b12e160e176230b740e3d1bd600118447'
            'ff6dabc3cbef98d22cc8f081343d5c66b2564b3a898c2dbcc88baa5017d80232'
            'a164ebdc4d281352bf7ad1b179aae4aeb33f1191c444bed96cb8ab333c046f81'
            '73e516bd771024f100983d0b7a5d43b49fd1e992c83e6caec445b7338e79e8c2'
            '95223dda645c15b3daf79cd4d55df5d4ac46207f749973396bb761b743586ed6'
            '1bbd783da8483e2cffe99715125dddbd88c81ae36f28eee5ae7df5705c448077'
            '98b3d28cbd13bb575c602785f6b8cb0b66ea3128ab5a3a82fc1645822320c136'
            '28003f6aabb89fcd262ae09e5e5a0679e8755b5e265bc1afa0079ed450eb7d91'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36')
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')

prepare() {
    rm -f "ffmpeg-${pkgver}/libavcodec"/libsvt_{hevc,vp9}.c
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/010-ffmpeg-add-svt-hevc.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/020-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/030-ffmpeg-add-svt-vp9.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/050-ffmpeg-fix-cuda-nvcc-with-gcc14.patch"
    patch -d "whisper.cpp-${_whispercpp_ver}" -Np1 -i "${srcdir}/060-ffmpeg-whisper.cpp-fix-pkgconfig.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/070-ffmpeg9-svt-codec-pixfmts.patch"

    # lld prunes these indirect flite1 dependencies under --as-needed, leaving
    # the voice libraries with unresolved symbols such as usenglish_init.
    sed -i \
        's|^flite_extralibs=.*|flite_extralibs="-Wl,--push-state,--no-as-needed -lflite_cmu_time_awb -lflite_cmu_us_awb -lflite_cmu_us_kal -lflite_cmu_us_kal16 -lflite_cmu_us_rms -lflite_cmu_us_slt -lflite_usenglish -lflite_cmulex -lflite -Wl,--pop-state"|' \
        "ffmpeg-${pkgver}/configure"
}

build() {
    export CC=clang
    export CXX=clang++
    export AR=/usr/bin/llvm-ar
    export RANLIB=/usr/bin/llvm-ranlib
    export LD=/usr/bin/ld.lld
    export NM=/usr/bin/llvm-nm
    export OBJCOPY=/usr/bin/llvm-objcopy
    export OBJDUMP=/usr/bin/llvm-objdump
    export READELF=/usr/bin/llvm-readelf
    export STRIP=/usr/bin/llvm-strip
    export LDFLAGS="${LDFLAGS:-} -fuse-ld=lld"
    export CFLAGS="${CFLAGS:-} -O3 -march=native"
    export CXXFLAGS="${CXXFLAGS:-} -O3 -march=native"

    local _stagingdir="${srcdir}/staging"
    local _pkgconfigdir="${_stagingdir}/lib/pkgconfig"
    export PKG_CONFIG_PATH="${_pkgconfigdir}${PKG_CONFIG_PATH:+":${PKG_CONFIG_PATH}"}"
    
    local -a _cmake_opts=(
        '-GUnix Makefiles'
        '-DBUILD_SHARED_LIBS:BOOL=OFF'
        '-DCMAKE_BUILD_TYPE:STRING=None'
        "-DCMAKE_INSTALL_PREFIX:PATH=${_stagingdir}"
        '-Wno-dev')
    
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
    sed -i \
        -e 's/\(-llensfun\)/\1 -lglib-2.0 -lstdc++/' \
        -e '/Cflags: /s/$/ -DCONF_LENSFUN_STATIC/' "${_pkgconfigdir}/lensfun.pc"
    
    # whisper.cpp AUR package conflicts with imagemagick at the time of writing
    # building it locally as a static library for the time being, as imagemagick is a commonly used package (high usage in pkgstats)
    cmake -B build/whisper.cpp -S "whisper.cpp-${_whispercpp_ver}" \
        "${_cmake_opts[@]}" \
        -DWHISPER_BUILD_EXAMPLES:BOOL='OFF' \
        -DWHISPER_BUILD_TESTS:BOOL='OFF'
    cmake --build build/whisper.cpp --target install
    
    cd "ffmpeg-${pkgver}"
    printf '%s\n' '  -> Running ffmpeg configure script...'
    
    export PKG_CONFIG_PATH="${_stagingdir}/lib/pkgconfig${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}"
    export CFLAGS+=' -isystem/opt/cuda/include'
    export LDFLAGS+=' -L/opt/cuda/lib64'
    
    # fix build of libavfilter/asrc_flite.c with gcc 14
    export CFLAGS+=' -Wno-error=incompatible-pointer-types'
    
    ./configure \
        --prefix='/usr' \
        --cc=clang \
        --cxx=clang++ \
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
