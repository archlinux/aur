# Maintainer: Inochi Amaoto <libraryindexsky@gmail.com>

pkgname=mpv-full-build-git
pkgver=0.37.0.r56.g67aa568437
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
         'codec2'
         'dav1d'
         'desktop-file-utils'
         'fontconfig'
         'freetype2'
         'frei0r-plugins'
         'fribidi'
         'glad'
         'glibc'
         'gmp'
         'gnutls'
         'gsm'
         'glslang'
         'harfbuzz'
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
         'libopenmpt'
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
         'openh264'
         'openjpeg2'
         'openmp'
         'opus'
         'pipewire'
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
             'clang'
             'fontconfig'
             'git'
             'intel-media-sdk'
             'ladspa'
             'llvm'
             'mesa'
             'meson'
             'nasm'
             'opencl-headers'
             'python-docutils'
             'vulkan-headers'
             'wayland-protocols'
             )

optdepends=('youtube-dl: Another way to view youtuve videos with mpv'
            'zsh-completions: Additional completion definitions for Zsh users')
provides=('mpv' 'mpv-git' 'mpv-build-git' 'mpv-full-git' 'libmpv.so')
conflicts=('mpv' 'mpv-git' 'mpv-build-git' 'mpv-full-git' 'libmpv.so')
replaces=('mpv' 'mpv-git' 'mpv-build-git' 'mpv-full-git' 'libmpv.so')
options=('!emptydirs' 'lto')
source=('mpv-build::git+https://github.com/mpv-player/mpv-build.git'
        'mpv::git+https://github.com/mpv-player/mpv.git'
        'ffmpeg::git+https://git.ffmpeg.org/ffmpeg.git'
        'libass::git+https://github.com/libass/libass.git'
        'libplacebo::git+https://code.videolan.org/videolan/libplacebo.git'
        'ffnvcodec::git+https://git.videolan.org/git/ffmpeg/nv-codec-headers.git'
        'LICENSE'
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
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

_makeoptdepends=('cuda: mpv ffmpeg nvcc and libnpp support'
                 'davs2: Additional libdavs2 support for ffmpeg'
                 'intel-media-sdk: Intel QuickSync support for ffmpeg'
                 'libklvanc: Additional libklvanc support for ffmpeg'
                 'libsixel: Allow mpv to implement sixel as a output device'
                 'nvidia-utils: for hardware accelerated video decoding with CUDA'
                 'onevpl: mpv ffmpeg intel graphic support'
                 'shine: Additional libshine support for ffmpeg'
                 'tensorflow: mpv ffmpeg DNN module backend'
                 'vo-amrwbenc: Additional libvo-amrwbenc support for ffmpeg'
                 'xavs: Additional libxavs support for ffmpeg'
                 'xavs2: Additional libxavs2 support for ffmpeg')

for _pkginfo in "${_makeoptdepends[@]}"; do
  optdepends+=("$_pkginfo")
done

if [ -z ${MPV_NO_CHECK_OPT_DEPEND+yes} ]; then
  if [ -f /usr/lib/libdavs2.so ]; then
    depends+=('davs2')
  fi
  if [ -f /usr/lib/libklvanc.so ]; then
    depends+=('libklvanc')
  fi
  if [ -f /usr/lib/libshine.so ]; then
    depends+=('shine')
  fi
  if [ -f /usr/lib/libsixel.so ]; then
    depends+=('libsixel')
  fi
  if [ -f /usr/lib/libvpl.so ]; then
    depends+=('onevpl')
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

export CCACHE_DISABLE=1
export CCACHE_DIR=/tmp/build/ccache

pkgver() {
  cd mpv

  local _version="$(git tag | sort --version-sort --reverse | head -n1 | sed 's/^v//')"
  local _revision="$(git rev-list v"${_version}"..HEAD --count)"
  local _shorthash="$(git rev-parse --short HEAD)"
  printf '%s.r%s.g%s' "$_version" "$_revision" "$_shorthash"

  # git describe --tags --long | sed 's|^v\(.*\)|\1|;s|\([^-]*-g\)|r\1|;s|-|.|g'
}

_prepare_ffnvcodec() {
  make PREFIX=/usr -C "${srcdir}/ffnvcodec"
  make PREFIX=/usr DESTDIR="${srcdir}" -C "${srcdir}/ffnvcodec" install
  sed -i "s|=/usr|=${srcdir}/usr|g" "${srcdir}/usr/lib/pkgconfig/ffnvcodec.pc"

  export PKG_CONFIG_PATH=${srcdir}/usr/lib/pkgconfig
}

prepare() {
  _prepare_ffnvcodec

  cd mpv-build
  ln -sf -t . "../mpv"
  ln -sf -t . "../ffmpeg"
  ln -sf -t . "../libass"
  ln -sf -t . "../libplacebo"

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
    '--enable-libjxl'
    '--enable-libkvazaar'
    '--disable-liblensfun'
    '--enable-libmodplug'
    '--enable-libmp3lame'
    '--enable-libmysofa'
    '--enable-libopencore-amrnb'
    '--enable-libopencore-amrwb'
    '--enable-libopenh264'
    '--enable-libopenjpeg'
    '--enable-libopenmpt'
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
    '-Dprefix=/usr'
    '-Dlibexecdir=lib'
    '-Dsbindir=bin'
    '-Dbuildtype=plain'
    '-Db_lto=true'
    '-Db_pie=true'
    '-Db_staticpic=true'
    '-Ddefault_library=shared'
    '-Dc_link_args="-Wl,-Bsymbolic"'

    '-Dcplayer=true'
    '-Dlibmpv=true'
    '-Dbuild-date=false'

    # misc features
    '-Dcdda=enabled'
    '-Dcplugins=enabled'
    '-Ddvbin=enabled'
    '-Ddvdnav=enabled'
    '-Diconv=enabled'
    '-Djavascript=enabled'
    '-Dlcms2=enabled'
    '-Dlibarchive=enabled'
    '-Dlibavdevice=enabled'
    '-Dlibbluray=enabled'
    '-Dlua=lua52'
    '-Drubberband=enabled'
    '-Dsdl2=enabled'
    '-Dsdl2-gamepad=enabled'
    '-Duchardet=enabled'
    '-Duwp=disabled'
    '-Dvapoursynth=enabled'
    '-Dvector=auto'
    '-Dwin32-threads=disabled'
    '-Dzimg=enabled'
    '-Dzlib=enabled'

    # audio output features
    '-Dalsa=enabled'
    '-Daudiounit=disabled'
    '-Dcoreaudio=disabled'
    '-Djack=enabled'
    '-Dopenal=enabled'
    '-Dopensles=disabled'
    '-Doss-audio=disabled'
    '-Dpipewire=enabled'
    '-Dpulse=enabled'
    '-Dsdl2-audio=enabled'
    '-Dsndio=enabled'
    '-Dwasapi=disabled'

    # video output features
    '-Dcaca=enabled'
    '-Dcocoa=disabled'
    '-Dd3d11=disabled'
    '-Ddirect3d=disabled'
    '-Ddmabuf-wayland=enabled'
    '-Ddrm=enabled'
    '-Degl=enabled'
    '-Degl-android=disabled'
    '-Degl-angle=disabled'
    '-Degl-angle-lib=disabled'
    '-Degl-angle-win32=disabled'
    '-Degl-drm=enabled'
    '-Degl-wayland=enabled'
    '-Degl-x11=enabled'
    '-Dgbm=enabled'
    '-Dgl=enabled'
    '-Dgl-cocoa=disabled'
    '-Dgl-dxinterop=disabled'
    '-Dgl-win32=disabled'
    '-Djpeg=enabled'
    '-Drpi=disabled'
    '-Dsdl2-video=enabled'
    '-Dshaderc=disabled'
    '-Dplain-gl=enabled'
    '-Dvdpau=enabled'
    '-Dvaapi=enabled'
    '-Dvaapi-drm=enabled'
    '-Dvaapi-wayland=enabled'
    '-Dvaapi-x11=enabled'
    '-Dvaapi-win32=disabled'
    '-Dvulkan=enabled'
    '-Dvulkan-interop=enabled'
    '-Dwayland=enabled'
    '-Dx11=enabled'
    '-Dxv=enabled'

    # hwaccel features
    '-Dandroid-media-ndk=disabled'
    '-Dd3d-hwaccel=disabled'
    '-Dd3d9-hwaccel=disabled'
    '-Dgl-dxinterop-d3d9=disabled'
    '-Dios-gl=disabled'
    '-Drpi-mmal=auto'
    '-Dvideotoolbox-gl=disabled'
    '-Dvideotoolbox-pl=disabled'

    # manpages
    '-Dmanpage-build=enabled'
    '-Dhtml-build=disabled'
    '-Dpdf-build=disabled'
  )

  _libass_options=(
    '--enable-harfbuzz'
    '--enable-fontconfig'
  )

  _libplacebo_options=(
    '-Dvulkan=enabled'
    '-Dglslang=enabled'
    '-Dshaderc=enabled'
    '-Dlcms=enabled'
    '-Dd3d11=disabled'
  )

  if [ ! -f /usr/lib/libHLSL.so ]; then
    sed -i 's|-lHLSL||g' ffmpeg/configure;
    sed -i 's|-lOGLCompiler||g' ffmpeg/configure;
  fi

  if [ -z ${MPV_NO_CHECK_OPT_DEPEND+yes} ]; then
    if [ -f /usr/lib/libdavs2.so ]; then
      _ffmpeg_options+=('--enable-libdavs2')
    fi
    if [ -f /usr/lib/libklvanc.so ]; then
      _ffmpeg_options+=('--enable-libklvanc')
    fi
    if [ -f /usr/lib/libshine.so ]; then
      _ffmpeg_options+=('--enable-libshine')
    fi
    if [ -f /usr/lib/libsixel.so ]; then
      _mpv_options+=('-Dsixel=enabled')
    fi
    if [ -f /usr/lib/libvpl.so ]; then
      _ffmpeg_options+=('--enable-libvpl')
    else
      _ffmpeg_options+=('--enable-libmfx')
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
      export NVCC_PREPEND_FLAGS='-ccbin /opt/cuda/bin/g++'
      _ffmpeg_options+=('--enable-cuda-nvcc')
      _ffmpeg_options+=('--enable-cuda-llvm')
      _ffmpeg_options+=('--enable-libnpp')
      _ffmpeg_options+=('--extra-cflags=-I/opt/cuda/include')
      _ffmpeg_options+=('--extra-ldflags=-L/opt/cuda/lib64')
      _ffmpeg_options+=('--nvccflags=-O2')
      _mpv_options+=('-Dcuda-hwaccel=enabled')
      _mpv_options+=('-Dcuda-interop=enabled')
    fi
  fi

  (IFS=$'\n'; echo "${_ffmpeg_options[*]}" > ffmpeg_options)
  (IFS=$'\n'; echo "${_mpv_options[*]}" > mpv_options)
  (IFS=$'\n'; echo "${_libass_options[*]}" > libass_options)
  (IFS=$'\n'; echo "${_libplacebo_options[*]}" > libplacebo_options)

  sed -i 's|-Dprefer_static=true||g' "${srcdir}/mpv-build/scripts/mpv-config"
  sed -i 's|-Dbuildtype=release||g' "${srcdir}/mpv-build/scripts/mpv-config"

}

build() {
  cd mpv-build
  if [ -d /opt/cuda ]; then
    sed -i 's|scripts/mpv-config|sed \-i "s\|-lavfilter\|-L/opt/cuda/targets/x86_64-linux/lib/ -lavfilter\|" build_libs/lib/pkgconfig/libavfilter.pc\nscripts/mpv-config|' "${srcdir}/mpv-build/build"
  fi
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
