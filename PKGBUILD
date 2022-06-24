# Maintainer: Inochi Amaoto <libraryindexsky@gmail.com>

pkgname=mpv-full-build-git
pkgver=0.34.0.r360.g8da6b355f8
pkgrel=1
pkgdesc="Video player based on MPlayer/mplayer2 with all possible libs (uses statically linked ffmpeg with all possible libs). (GIT version )"
arch=('x86_64')
depends=(
         # official repositories:
         'alsa-lib'
         'aom'
         'aribb24'
         'avisynthplus'
         'bzip2'
         'celt'
         'codec2'
         'dav1d'
         'desktop-file-utils'
         'fontconfig'
         'freetype2'
         'frei0r-plugins'
         'fribidi'
         'glibc'
         'gmp'
         'gnutls'
         'gsm'
         'glslang'
         'hicolor-icon-theme'
         'jack'
         'kvazaar'
         'ladspa'
         'lame'
         'lcms2'
         # 'lensfun'
         'libarchive'
         'libass'
         'libavc1394'
         'libbluray'
         'libbs2b'
         'libcaca'
         'libcdio-paranoia'
         'libdc1394'
         'libdrm'
         'libdvdnav'
         'libfdk-aac'
         'libgcrypt'
         'libgl'
         'libglvnd'
         'libgme'
         'libiec61883'
         'libilbc'
         'libjxl'
         'libmodplug'
         'libmysofa'
         'libomxil-bellagio'
         'libplacebo'
         'libpng'
         'libpulse'
         'librabbitmq-c'
         'librsvg'
         'libsoxr'
         'libssh'
         'libtheora'
         'libva'
         'libvdpau'
         'libvorbis'
         'libvpx'
         'libwebp'
         'libx11'
         'libxcb'
         'libxext'
         'libxinerama'
         'libxkbcommon'
         'libxml2'
         'libxpresent'
         'libxrandr'
         'libxss'
         'libxv'
         'lilv'
         'lua52'
         'lv2'
         'mujs'
         'ocl-icd'
         'openal'
         'opencore-amr'
         'openjpeg2'
         'opus'
         'pulseaudio'
         'rav1e'
         'rtmpdump'
         'rubberband'
         'sdl2'
         'shaderc'
         'snappy'
         'sndio'
         'speex'
         'srt'
         'svt-av1'
         'tesseract'
         'twolame'
         'uchardet'
         'v4l-utils'
         'vapoursynth'
         'vid.stab'
         'vmaf'
         'vulkan-icd-loader'
         'wayland'
         'x264'
         'x265'
         'xdg-utils'
         'xvidcore'
         'xz'
         'zeromq'
         'zimg'
         'zlib'
         'zvbi'

         # AUR:
         'chromaprint-fftw'
         )
license=('custom')
url='http://mpv.io'
makedepends=(
             'amf-headers'
             'avisynthplus'
             'ffnvcodec-headers'
             'clang'
             'fontconfig'
             'git'
             'intel-media-sdk'
             'ladspa'
             'llvm'
             'mesa'
             'nasm'
             'opencl-headers'
             'python-docutils'
             'vulkan-headers'
             'wayland-protocols'
             )
optdepends=(
            'cuda: mpv ffmpeg nvcc and libnpp support'
            'davs2: Additional libdavs2 support for ffmpeg'
            'intel-media-sdk: Intel QuickSync support for ffmpeg'
            'libklvanc-git: Additional libklvanc support for ffmpeg'
            'libopenmpt: Additional libopenmpt support for ffmpeg'
            'libsixel: Allow mpv to implement sixel as a output device'
            'mpv-bash-completion-git: Additional completion definitions for Bash users'
            'nvidia-utils: for hardware accelerated video decoding with CUDA'
            'openh264: Additional libopenh264 support for ffmpeg'
            'rockchip-mpp: Additional rkmpp support for ffmpeg'
            'shine: Additional libshine support for ffmpeg'
            'spirv-cross: Additional spirv support for mpv'
            'tensorflow: mpv ffmpeg DNN module backend'
            'vo-amrwbenc: Additional libvo-amrwbenc support for ffmpeg'
            'xavs: Additional libxavs support for ffmpeg'
            'xavs2: Additional libxavs2 support for ffmpeg'
            'youtube-dl: Another way to view youtuve videos with mpv'
            'zsh-completions: Additional completion definitions for Zsh users'
            )
provides=('mpv' 'mpv-git' 'mpv-build-git' 'mpv-full-git' 'libmpv.so')
conflicts=('mpv' 'mpv-git' 'mpv-build-git' 'mpv-full-git' 'libmpv.so')
replaces=('mpv' 'mpv-git' 'mpv-build-git' 'mpv-full-git' 'libmpv.so')
options=('!emptydirs')
source=('mpv-build::git+https://github.com/mpv-player/mpv-build.git'
        'mpv::git+https://github.com/mpv-player/mpv.git'
        'ffmpeg::git+https://git.ffmpeg.org/ffmpeg.git'
        'libass::git+https://github.com/libass/libass.git'
        'LICENSE'
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36'
            )
backup=('etc/mpv/encoding-profiles.conf')

# MPV_NO_CHECK_OPT_DEPEND
# if you don't need opt dependency checked, defined this
# for example
# MPV_NO_CHECK_OPT_DEPEND=yes makepkg -si

if [[ -n ${MPV_BUILD_WITH_CLANG} ]]; then
  makedepends+=(clang lld)
fi

if [ -z ${MPV_NO_CHECK_OPT_DEPEND+yes} ]; then
  if [ -f /usr/lib/libdavs2.so ]; then
    depends+=('davs2')
  fi
  if [ -f /usr/lib/libklvanc.so ]; then
    depends+=('libklvanc')
  fi
  if [ -f /usr/lib/libopenmpt.so ]; then
    depends+=('libopenmpt')
  fi
  if [ -f /usr/lib/libopenh264.so ]; then
    depends+=('openh264')
  fi
  if [ -f /usr/lib/librockchip_mpp.so ]; then
    depends+=('rockchip-mpp')
  fi
  if [ -f /usr/lib/libspirv-cross-c-shared.so ]; then
    depends+=('spirv-cross')
  fi
  if [ -f /usr/lib/libshine.so ]; then
    depends+=('shine')
  fi
  if [ -f /usr/lib/libsixel.so ]; then
    depends+=('libsixel')
  fi
  if [ -f /usr/lib/libtensorflow.so ]; then
    depends+=('tensorflow')
  fi
  if [ -f /usr/lib/libvo-amrwbenc.so ]; then
    depends+=('vo-amrwbenc')
  fi
  if [ -f /usr/lib/libxavs.so ]; then
    depends+=('xavs')
  fi
  if [ -f /usr/lib/libxavs2.so ]; then
    depends+=('xavs2')
  fi

  if [ -d /opt/cuda ]; then
    makedepends+=('cuda')
    depends+=('cuda')
  fi
fi

pkgver() {
  cd mpv
  git describe --tags --long | sed 's|^v\(.*\)|\1|;s|\([^-]*-g\)|r\1|;s|-|.|g'
}

prepare() {
  cd mpv-build
  ln -sf -t . "../mpv"
  ln -sf -t . "../ffmpeg"
  ln -sf -t . "../libass"

  if [[ -n ${MPV_BUILD_WITH_CLANG} ]]; then
    unset CC CXX
    export CC=clang
    export CXX=clang++
    export LDFLAGS="$LDFLAGS -fuse-ld=lld"
  fi

  # Set ffmpeg/libass/mpv flags
  _ffmpeg_options=(
    '--disable-libopencv'
    '--disable-libtls'
    '--disable-mbedtls'
    '--disable-programs'
    '--enable-alsa'
    '--enable-amf'
    '--enable-bzlib'
    '--enable-chromaprint'
    '--enable-cuvid'
    '--enable-ffnvcodec'
    '--enable-fontconfig'
    '--enable-frei0r'
    '--enable-gcrypt'
    '--enable-gmp'
    '--enable-gnutls'
    '--enable-gpl'
    '--enable-gray'
    '--enable-iconv'
    '--enable-ladspa'
    '--enable-lcms2'
    '--enable-libaom'
    '--enable-libaribb24'
    '--enable-libass'
    '--enable-libbluray'
    '--enable-libbs2b'
    '--enable-libcaca'
    '--enable-libcdio'
    '--enable-libcelt'
    '--enable-libcodec2'
    '--enable-libdav1d'
    '--enable-libdc1394'
    '--enable-libdrm'
    '--enable-libfdk-aac'
    '--enable-libfreetype'
    '--enable-libfribidi'
    '--enable-libglslang'
    '--enable-libgme'
    '--enable-libgsm'
    '--enable-libiec61883'
    '--enable-libilbc'
    '--enable-libjack'
    # '--enable-libjxl'
    '--enable-libkvazaar'
    '--disable-liblensfun'
    '--enable-libmfx'
    '--enable-libmodplug'
    '--enable-libmp3lame'
    '--enable-libmysofa'
    '--enable-libopencore-amrnb'
    '--enable-libopencore-amrwb'
    '--enable-libopenjpeg'
    '--enable-libopus'
    '--enable-libpulse'
    '--enable-librabbitmq'
    '--enable-librav1e'
    '--enable-librsvg'
    '--enable-librtmp'
    '--enable-librubberband'
    '--enable-libsnappy'
    '--enable-libsoxr'
    '--enable-libspeex'
    '--enable-libsrt'
    '--enable-libssh'
    '--enable-libsvtav1'
    '--enable-libtesseract'
    '--enable-libtheora'
    '--enable-libtwolame'
    '--enable-libv4l2'
    '--enable-libvidstab'
    '--enable-libvmaf'
    '--enable-libvorbis'
    '--enable-libvpx'
    '--enable-libwebp'
    '--enable-libx264'
    '--enable-libx265'
    '--enable-libxcb'
    '--enable-libxcb-shape'
    '--enable-libxcb-shm'
    '--enable-libxcb-xfixes'
    '--enable-libxml2'
    '--enable-libxvid'
    '--enable-libzimg'
    '--enable-libzmq'
    '--enable-libzvbi'
    '--enable-lto'
    '--enable-lv2'
    '--enable-lzma'
    '--enable-nonfree'
    '--enable-nvdec'
    '--enable-nvenc'
    '--enable-omx'
    '--enable-openal'
    '--enable-opencl'
    '--enable-opengl'
    '--enable-pic'
    '--enable-sdl2'
    '--enable-sndio'
    '--enable-v4l2-m2m'
    '--enable-vaapi'
    '--enable-vapoursynth'
    '--enable-vdpau'
    '--enable-version3'
    '--enable-vulkan'
    '--enable-xlib'
    '--enable-zlib'
  )
  _mpv_options=(
    '--prefix=/usr'
    '--confdir=/etc/mpv'
    '--htmldir=/usr/share/doc/mpv/html'
    '--disable-build-date'
    '--disable-debug-build'
    
    '--enable-manpage-build'
    '--disable-html-build'
    '--disable-pdf-build'
    
    '--lua=lua52'
    '--enable-alsa'
    '--enable-caca'
    '--enable-cdda'
    '--enable-cplugins'
    '--enable-drm'
    '--enable-dvbin'
    '--enable-dvdnav'
    '--enable-egl-drm'
    '--enable-egl-x11'
    '--enable-gbm'
    '--enable-gl'
    '--enable-gl-wayland'
    '--enable-html-build'
    '--enable-iconv'
    '--enable-jack'
    '--enable-javascript'
    '--enable-jpeg'
    # '--enable-jpegxl'
    '--enable-lcms2'
    '--enable-libarchive'
    '--enable-libavdevice'
    '--enable-libbluray'
    '--enable-libmpv-shared'
    '--enable-libplacebo'
    '--enable-lua'
    '--enable-manpage-build'
    '--enable-openal'
    '--disable-oss-audio'
    '--enable-plain-gl'
    '--enable-pulse'
    '--enable-rubberband'
    '--enable-sdl2'
    '--enable-shaderc'
    '--enable-uchardet'
    '--enable-vaapi'
    '--enable-vaapi-drm'
    '--enable-vaapi-wayland'
    '--enable-vaapi-x11'
    '--enable-vaapi-x-egl'
    '--enable-vdpau'
    '--enable-vulkan'
    '--enable-wayland'
    '--enable-wayland-protocols'
    '--enable-wayland-scanner'
    '--enable-x11'
    '--enable-xv'
    '--enable-zimg'
    '--enable-zlib'
  )

  local _legacy_mpv_options=(
    '--enable-gl-x11'
    '--enable-vdpau-gl-x11'
  )

  if [[ -n ${MPV_BUILD_WITH_CLANG} ]]; then
    _ffmpeg_options+=('--cc=clang')
    _ffmpeg_options+=('--cxx=clang++')
  fi

  local _ffmpeg_cflags=''
  local _ffmpeg_ldflags=''
  if [ -z ${MPV_NO_CHECK_OPT_DEPEND+yes} ]; then
    if [ -f /usr/lib/libdavs2.so ]; then
      _ffmpeg_options+=('--enable-libdavs2')
    fi
    if [ -f /usr/lib/libklvanc.so ]; then
      _ffmpeg_options+=('--enable-libklvanc')
    fi
    if [ -f /usr/lib/libopenmpt.so ]; then
      _ffmpeg_options+=('--enable-libopenmpt')
    fi
    if [ -f /usr/lib/libopenh264.so ]; then
      _ffmpeg_options+=('--enable-libopenh264')
    fi
    if [ -f /usr/lib/librockchip_mpp.so ]; then
      _ffmpeg_options+=('--enable-rkmpp')
    fi
    if [ -f /usr/lib/libspirv-cross-c-shared.so ]; then
      _mpv_options+=('--enable-spirv-cross')
    fi
    if [ -f /usr/lib/libshine.so ]; then
      _ffmpeg_options+=('--enable-libshine')
    fi
    if [ -f /usr/lib/libsixel.so ]; then
      _mpv_options+=('--enable-sixel')
    fi
    if [ -f /usr/lib/libtensorflow.so ]; then
      _ffmpeg_options+=('--enable-libtensorflow')
      _ffmpeg_options+=('--extra-cflags=-I/usr/include/tensorflow')
    fi
    if [ -f /usr/lib/libvo-amrwbenc.so ]; then
      _ffmpeg_options+=('--enable-libvo-amrwbenc')
    fi
    if [ -f /usr/lib/libxavs.so ]; then
      _ffmpeg_options+=('--enable-libxavs')
    fi
    if [ -f /usr/lib/libxavs2.so ]; then
      _ffmpeg_options+=('--enable-libxavs2')
    fi

    if [ -d /opt/cuda ]; then
      _ffmpeg_options+=('--enable-cuda-nvcc')
      _ffmpeg_options+=('--enable-cuda-llvm')
      _ffmpeg_options+=('--enable-libnpp')
      _ffmpeg_options+=('--extra-cflags=-I/opt/cuda/include')
      _ffmpeg_options+=('--extra-ldflags=-L/opt/cuda/lib64')
      _ffmpeg_options+=('--nvccflags=-O2')
      _mpv_options+=('--enable-cuda-hwaccel')
      _mpv_options+=('--enable-cuda-interop')
    fi
  fi

  (IFS=$'\n'; echo "${_ffmpeg_options[*]}" > ffmpeg_options)
  (IFS=$'\n'; echo "${_mpv_options[*]}" > mpv_options)

  cd mpv

  ./bootstrap.py
  
}

build() {
  cd mpv-build
  if [ -d /opt/cuda ]; then
    sed -i 's|scripts/mpv-config|sed \-i "s\|-lavfilter\|-L/opt/cuda/targets/x86_64-linux/lib/ -lavfilter\|" build_libs/lib/pkgconfig/libavfilter.pc\nscripts/mpv-config|' "${srcdir}/mpv-build/build"
  fi
  export LDFLAGS="${LDFLAGS-} $(pkg-config --libs fontconfig harfbuzz fribidi)"
  ./build
}

package() {
  cd mpv-build
  DESTDIR="${pkgdir}" ./install

  install -Dm755 mpv/TOOLS/mpv_identify.sh "${pkgdir}/usr/bin/mpv-identify"
  install -Dm755 mpv/TOOLS/idet.sh "${pkgdir}/usr/bin/mpv-idet"
  install -Dm755 mpv/TOOLS/umpv "${pkgdir}/usr/bin/umpv"

  install -Dm644 mpv/DOCS/encoding.rst "${pkgdir}/usr/share/doc/mpv/encoding.rst"
  install -Dm644 mpv/DOCS/edl-mpv.rst "${pkgdir}/usr/share/doc/mpv/edl-mpv.rst"
  install -Dm644 mpv/DOCS/client-api-changes.rst "${pkgdir}/usr/share/doc/mpv/client-api-changes.rst"
  install -Dm644 mpv/DOCS/contribute.md "${pkgdir}/usr/share/doc/mpv/contribute.md"

  sed 's|/usr/local/etc/mpv.conf|/etc/mpv.conf|g' -i "${pkgdir}/usr/share/doc/mpv/mpv.conf"
  install -D -m644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/ffmpeg"

  (cd mpv/TOOLS/lua; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/mpv/scripts/${i}"; done)
}
