# Maintainer: MLM Games <dev@mlm.games>
pkgname=repadio-bin
_pkgname=repadio
pkgver=0.3.9
_tag=v0.3.9
pkgrel=1
pkgdesc='Pure-Rust audio player built with Symphonia and CPAL on the Repose GUI framework'
arch=('x86_64' 'aarch64')
url="https://github.com/mlm-games/repadio"
license=('GPL-3.0-or-later')
depends=()
provides=(repadio)
conflicts=(repadio)
options=(!strip)
source_x86_64=("repadio-0.3.9-x86_64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/repadio/releases/download/${_tag}/repadio-0.3.9-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("repadio-0.3.9-aarch64-unknown-linux-gnu.tar.gz::https://github.com/mlm-games/repadio/releases/download/${_tag}/repadio-0.3.9-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('18aa705d0b252dc2a09f9c87a97a4f90188ec7870c8743787a772eba5ac56ebb')
sha256sums_aarch64=('46caa6995dd4e455c88ab46ea69746867d48441a4ced9597ab770cd8c603e088')
source+=("icon.svg::https://raw.githubusercontent.com/mlm-games/repadio/main/others/packaging/icon.svg")
sha256sums+=('SKIP')

package() {
  local dir
  if [[ "$CARCH" == "x86_64" ]]; then
    dir="${srcdir}/repadio-0.3.9-x86_64-unknown-linux-gnu"
  else
    dir="${srcdir}/repadio-0.3.9-aarch64-unknown-linux-gnu"
  fi
  install -Dm755 "${dir}/repadio" "${pkgdir}/usr/bin/repadio"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/repadio.desktop" << DESKTOP_EOF
[Desktop Entry]
Type=Application
Version=1.5
Name=Repadio
Comment=Audio and video player built with Repose
Categories=Audio;AudioVideo;Video;Player;
Keywords=audio;video;player;music;repose;symphonia;cpal;
Exec=repadio %F
Icon=repadio
Terminal=false
StartupNotify=true
StartupWMClass=repadio
MimeType=application/mxf;application/ogg;application/sdp;application/smil;application/streamingmedia;application/vnd.apple.mpegurl;application/vnd.ms-asf;application/vnd.rn-realmedia;application/vnd.rn-realmedia-vbr;application/x-cue;application/x-extension-m4a;application/x-extension-mp4;application/x-matroska;application/x-mpegurl;application/x-ogm;application/x-ogm-audio;application/x-ogm-video;application/x-ogg;application/x-shorten;application/x-smil;application/x-streamingmedia;audio/3gpp;audio/3gpp2;audio/AMR;audio/aac;audio/ac3;audio/aiff;audio/amr-wb;audio/dv;audio/eac3;audio/flac;audio/m3u;audio/m4a;audio/mp1;audio/mp2;audio/mp3;audio/mp4;audio/mpeg;audio/mpeg2;audio/mpeg3;audio/mpegurl;audio/mpg;audio/musepack;audio/ogg;audio/opus;audio/rn-mpeg;audio/scpls;audio/vnd.dolby.heaac.1;audio/vnd.dolby.heaac.2;audio/vnd.dts;audio/vnd.dts.hd;audio/vnd.rn-realaudio;audio/vnd.wave;audio/vorbis;audio/wav;audio/webm;audio/x-adpcm;audio/x-aiff;audio/x-ape;audio/x-matroska;audio/x-mp1;audio/x-mp2;audio/x-mp3;audio/x-mpegurl;audio/x-mpg;audio/x-musepack;audio/x-ms-asf;audio/x-ms-wma;audio/x-pls;audio/x-pn-au;audio/x-pn-realaudio;audio/x-pn-wav;audio/x-pn-windows-pcm;audio/x-realaudio;audio/x-scpls;audio/x-shorten;audio/x-tta;audio/x-vorbis;audio/x-vorbis+ogg;audio/x-wav;audio/x-wavpack;video/3gp;video/3gpp;video/3gpp2;video/avi;video/divx;video/dv;video/fli;video/flv;video/mkv;video/mp2t;video/mp4;video/mp4v-es;video/mpeg;video/msvideo;video/ogg;video/quicktime;video/vnd.avi;video/vnd.divx;video/vnd.mpegurl;video/vnd.rn-realvideo;video/webm;video/x-avi;video/x-flic;video/x-flc;video/x-flv;video/x-m4v;video/x-matroska;video/x-mpeg2;video/x-mpeg3;video/x-ms-afs;video/x-ms-asf;video/x-ms-wmv;video/x-ms-wmx;video/x-ms-wvxvideo;video/x-msvideo;video/x-ogm;video/x-ogm+ogg;video/x-theora;video/x-theora+ogg;
DESKTOP_EOF

  install -Dm644 "${srcdir}/icon.svg" "${pkgdir}/usr/share/pixmaps/repadio.svg"
  install -Dm644 "${srcdir}/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/repadio.svg"
}
