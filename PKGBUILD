# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=linphone-desktop-all-git
pkgver=4.1.1.r604.42510df7
pkgrel=1
pkgdesc="A free VoIP and video softphone based on the SIP protocol (Installed in /opt with all deps included)."
arch=("x86_64")
url="https://www.${pkgname%-desktop-all-git}.org/"
license=("GPL2")
depends=("qt5-graphicaleffects" "qt5-quickcontrols" "qt5-quickcontrols2" "qt5-svg" "qt5-tools")
makedepends=("cmake" "doxygen" "git" "graphviz" "ladspa" "nasm" "python-pystache" "yasm")
conflicts=("${pkgname%-all-git}")
source=("${pkgname%-all-git}::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/${pkgname%-all-git}.git"
        "bcg729::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/bcg729.git"
        "bcmatroska2::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/bcmatroska2.git"
        "bctoolbox::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/bctoolbox.git"
        "bcunit::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/bcunit.git"
        "belcard::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/belcard.git"
        "belle-msrp::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/belle-msrp.git"
        "belle-sip::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/belle-sip.git"
        "belr::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/belr.git"
        "bzrtp::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/bzrtp.git"
        "cmake-builder::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/${pkgname%-desktop-all-git}-cmake-builder.git"
        "bv16-floatingpoint::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/external/bv16-floatingpoint.git"
        "ffmpeg::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/external/ffmpeg.git"
        "gsm::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/external/gsm.git"
        "libjpeg-turbo::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/external/libjpeg-turbo.git"
        "libvpx::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/external/libvpx.git"
        "libxml2::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/external/libxml2.git"
        "libxsd::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/external/libxsd.git"
        "mbedtls::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/external/mbedtls.git"
        "minizip::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/external/minizip.git"
        "openh264::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/external/openh264.git"
        "opus::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/external/opus.git"
        "soci::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/external/soci.git"
        "speex::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/external/speex.git"
        "sqlite3::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/external/sqlite3.git"
        "srtp::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/external/srtp.git"
        "v4l-utils::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/external/v4l-utils.git"
        "xerces-c::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/external/xerces-c.git"
        "zlib::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/external/zlib.git"
        "${pkgname%-desktop-all-git}::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/${pkgname%-desktop-all-git}.git"
        "mediastreamer2::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/mediastreamer2.git"
        "msamr::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/msamr.git"
        "msopenh264::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/msopenh264.git"
        "mssilk::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/mssilk.git"
        "mswasapi::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/mswasapi.git"
        "mswebrtc::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/mswebrtc.git"
        "msx264::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/msx264.git"
        "ortp::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/ortp.git"
        "webrtc::git+https://gitlab.${pkgname%-desktop-all-git}.org/BC/public/external/webrtc.git"
        "${pkgname%-desktop-all-git}.desktop"
        "${pkgname%-all-git}-submodules.patch")
sha256sums=("SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP"
            "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP"
            "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" "SKIP" 
            "346d983f503873811b3a4f72772e5afe4990275526c9e15c1b5cde2ad69a0544"
            "ba70b6fc29dfea030828eb3011d4caa271737001f808b97d534feffb0d4558ad")

prepare() {
  cd "${srcdir}/${pkgname%-all-git}"

  git submodule init
  git config submodule.submodules/bcg729.url "${srcdir}/bcg729"
  git config submodule.submodules/bcmatroska2.url "${srcdir}/bcmatroska2"
  git config submodule.submodules/bctoolbox.url "${srcdir}/bctoolbox"
  git config submodule.submodules/bcunit.url "${srcdir}/bcunit"
  git config submodule.submodules/belcard.url "${srcdir}/belcard"
  git config submodule.submodules/belle-msrp.url "${srcdir}/belle-msrp"
  git config submodule.submodules/belle-sip.url "${srcdir}/belle-sip"
  git config submodule.submodules/belr.url "${srcdir}/belr"
  git config submodule.submodules/bzrtp.url "${srcdir}/bzrtp"
  git config submodule.submodules/cmake-builder.url "${srcdir}/cmake-builder"
  git config submodule.submodules/externals/bv16-floatingpoint.url "${srcdir}/bv16-floatingpoint"
  git config submodule.submodules/externals/ffmpeg.url "${srcdir}/ffmpeg"
  git config submodule.submodules/externals/gsm.url "${srcdir}/gsm"
  git config submodule.submodules/externals/libjpeg-turbo.url "${srcdir}/libjpeg-turbo"
  git config submodule.submodules/externals/libvpx.url "${srcdir}/libvpx"
  git config submodule.submodules/externals/libxml2.url "${srcdir}/libxml2"
  git config submodule.submodules/externals/libxsd.url "${srcdir}/libxsd"
  git config submodule.submodules/externals/mbedtls.url "${srcdir}/mbedtls"
  git config submodule.submodules/externals/minizip.url "${srcdir}/minizip"
  git config submodule.submodules/externals/openh264.url "${srcdir}/openh264"
  git config submodule.submodules/externals/opus.url "${srcdir}/opus"
  git config submodule.submodules/externals/soci.url "${srcdir}/soci"
  git config submodule.submodules/externals/speex.url "${srcdir}/speex"
  git config submodule.submodules/externals/sqlite3.url "${srcdir}/sqlite3"
  git config submodule.submodules/externals/srtp.url "${srcdir}/srtp"
  git config submodule.submodules/externals/v4l-utils.url "${srcdir}/v4l-utils"
  git config submodule.submodules/externals/xerces-c.url "${srcdir}/xerces-c"
  git config submodule.submodules/externals/zlib.url "${srcdir}/zlib"
  git config submodule.submodules/${pkgname%-desktop-all-git}.url "${srcdir}/${pkgname%-desktop-all-git}"
  git config submodule.submodules/mediastreamer2.url "${srcdir}/mediastreamer2"
  git config submodule.submodules/msamr.url "${srcdir}/msamr"
  git config submodule.submodules/msopenh264.url "${srcdir}/msopenh264"
  git config submodule.submodules/mssilk.url "${srcdir}/mssilk"
  git config submodule.submodules/mswasapi.url "${srcdir}/mswasapi"
  git config submodule.submodules/mswebrtc.url "${srcdir}/mswebrtc"
  git config submodule.submodules/msx264.url "${srcdir}/msx264"
  git config submodule.submodules/ortp.url "${srcdir}/ortp"
  git submodule update --init
  
  cd "${srcdir}/${pkgname%-all-git}/submodules/mswebrtc"

  git config submodule.webrtc.url "${srcdir}/webrtc"
  git submodule update --init

  cd "${srcdir}/${pkgname%-all-git}"

  patch -Np1 -i "../${pkgname%-all-git}-submodules.patch"
  
  #Patch generated via:
  #git diff --ignore-submodules > ../submodules.patch
  #git submodule --quiet foreach --recursive 'git diff --src-prefix=a/${name}/ --dst-prefix=b/${name}/' >> ../submodules.patch
}

pkgver() {
  cd "${srcdir}/${pkgname%-all-git}"
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed "s/^[a-Z\.\-]*//;s/\([^-]*-\)g/r\1/;s/-/./g" || 
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
  )
}

build() {
  cd "${srcdir}/${pkgname%-all-git}"

  ./prepare.py -c
  ./prepare.py --all-codecs
  make
}

package() {
  cd "${srcdir}/${pkgname%-all-git}"

  install -D -m 0644 "${srcdir}/${pkgname%-desktop-all-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-desktop-all-git}.desktop"
  install -d "${pkgdir}/opt"
  cp -r "OUTPUT/desktop" "${pkgdir}/opt/${pkgname%-all-git}"

  install -d "${pkgdir}/usr/share"
  mv "${pkgdir}/opt/${pkgname%-all-git}/share/icons" "${pkgdir}/usr/share"
}
