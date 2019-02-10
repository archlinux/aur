# vim:set ts=2 sw=2 et:
# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Maintainer graysky <graysky AT archlinux DOT us>
# Contributor: M-Reimer <manuel.reimer AT gmx DOT de>
# Contributor: Arthur Borsboom <arthurborsboom@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: BlackIkeEagle < ike DOT devolder AT gmail DOT com >
# Contributor: DonVla <donvla@users.sourceforge.net>
# Contributor: Ulf Winkelvos <ulf [at] winkelvos [dot] de>
# Contributor: Ralf Barth <archlinux dot org at haggy dot org>
# Contributor: B & monty - Thanks for your hints :)
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: marzoul
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>
# Contributor: Zeqadious <zeqadious.at.gmail.dot.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: dhead666 <myfoolishgames@gmail.com>
#
# Original credits go to Edgar Hucek <gimli at dark-green dot com>
# for his xbmc-vdpau-vdr PKGBUILD at https://archvdr.svn.sourceforge.net/svnroot/archvdr/trunk/archvdr/xbmc-vdpau-vdr/PKGBUILD

pkgbase=kodi-devel
pkgname=('kodi-devel' 'kodi-devel-eventclients' 'kodi-devel-tools-texturepacker' 'kodi-devel-dev')
pkgver=18.1rc1pre7
_major=18.0
pkgrel=1
_codename=Leia
_tag="$_major-$_codename"
# Found on their respective github release pages. One can check them against
# what is pulled down when not specifying them in the cmake step.
# $CHROOT/build/kodi-devel/src/kodi-build/build/download
#
# https://github.com/xbmc/FFmpeg/tags
# https://github.com/xbmc/libdvdcss/tags
# https://github.com/xbmc/libdvdnav/tags
# https://github.com/xbmc/libdvdread/tags
#
# fmt and crossguid can be found http://mirrors.kodi.tv/build-deps/sources/
#
_ffmpeg_version="4.0.3-$_codename-RC5"
_libdvdcss_version="1.4.2-$_codename-Beta-5"
_libdvdnav_version="6.0.0-$_codename-Alpha-3"
_libdvdread_version="6.0.0-$_codename-Alpha-3"
_fmt_version="5.1.0"
_crossguid_version="8f399e8bd4"
_fstrcmp_version="0.7.D001"
_flatbuffers_version="1.9.0"
arch=('x86_64')
url="http://kodi.tv"
license=('GPL2')
makedepends=(
  'afpfs-ng' 'bluez-libs' 'cmake' 'curl' 'doxygen' 'glew' 'git'
  'gperf' 'hicolor-icon-theme' 'jasper' 'java-runtime' 'libaacs' 'libass'
  'libbluray' 'libcdio' 'libcec' 'libgl' 'mariadb-libs' 'libmicrohttpd'
  'libmodplug' 'libmpeg2' 'libnfs' 'libplist' 'libpulse' 'libssh' 'libva'
  'libvdpau' 'libxrandr' 'libxslt' 'lirc' 'lzo' 'mesa' 'nasm' 'nss-mdns'
  'python2-pillow' 'python2-pybluez' 'python2-simplejson' 'rtmpdump'
  'shairplay' 'smbclient' 'speex' 'swig' 'taglib' 'tinyxml' 'unzip' 'upower'
  'yajl' 'zip' 'git' 'giflib' 'rapidjson' 'ghostscript'
)
source=(
  "${pkgbase%%-*}-$_tag.tar.gz::https://github.com/xbmc/xbmc/archive/$_tag.tar.gz"
  "ffmpeg-$_ffmpeg_version.tar.gz::https://github.com/xbmc/FFmpeg/archive/$_ffmpeg_version.tar.gz"
  "libdvdcss-$_libdvdcss_version.tar.gz::https://github.com/xbmc/libdvdcss/archive/$_libdvdcss_version.tar.gz"
  "libdvdnav-$_libdvdnav_version.tar.gz::https://github.com/xbmc/libdvdnav/archive/$_libdvdnav_version.tar.gz"
  "libdvdread-$_libdvdread_version.tar.gz::https://github.com/xbmc/libdvdread/archive/$_libdvdread_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/fmt-$_fmt_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/crossguid-$_crossguid_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/fstrcmp-$_fstrcmp_version.tar.gz"
  "http://mirrors.kodi.tv/build-deps/sources/flatbuffers-$_flatbuffers_version.tar.gz"
  'cpuinfo'
  '00-fix.building.with.mariadb.patch::https://github.com/wsnipex/xbmc/commit/cd20c8eb8a0394db1f028b118c4ca9b91b7e746a.patch'
  # closed milestone patches go here
  # https://github.com/xbmc/xbmc/milestone/121?closed=1
  '01-PR14924.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/14924.patch'
  '02-PR15352.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15352.patch'
  '03-PR15328.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15328.patch'
  '04-PR15327.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15327.patch'
  '05-PR15248.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15248.patch'
  '06-PR15342.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15342.patch'
  '07-PR15362.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15362.patch'
  '08-PR15359.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15359.patch'
  '09-PR15376.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15376.patch'
  '10-PR15368.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15368.patch'
  '11-PR15383.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15383.patch'
  '12-PR15382.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15382.patch'
  '13-PR15381.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15381.patch'
  '14-PR15392.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15392.patch'
  '15-PR15394.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15394.patch'
  '16-PR15385.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15385.patch'
  '17-PR15401.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15401.patch'
  '18-PR15403.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15403.patch'
  '19-PR15351.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15351.patch'
  '20-PR15399.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15399.patch'
  '21-PR15410.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15410.patch'
  '22-PR15422.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15422.patch'
  '23-PR15353.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15353.patch'
  '24-PR15419.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15419.patch'
  '25-PR15420.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15420.patch'
  '26-PR15358.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15358.patch'
  '27-PR15425.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15425.patch'
  '28-PR15431.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15431.patch'
  '29-PR15443.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15443.patch'
  '30-PR15441.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15441.patch'
  '31-PR15341.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15341.patch'
  '32-PR15369.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15369.patch'
  '33-PR15445.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15445.patch'
  '34-PR15448.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15448.patch'
  '35-PR15232.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15232.patch'
  '36-PR15449.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15449.patch'
  '37-PR15450.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15450.patch'
  '38-PR15455.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15455.patch'
  '39-PR15460.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15460.patch'
  '40-PR15457.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15457.patch'
  '41-PR15148.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15148.patch'
  '42-PR15468.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15468.patch'
  '43-PR15466.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15466.patch'
  '44-PR15476.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15476.patch'
  '45-PR15461.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15461.patch'
  '46-PR15454.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15454.patch'
  '47-PR15459.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15459.patch'
)
noextract=(
  "libdvdcss-$_libdvdcss_version.tar.gz"
  "libdvdnav-$_libdvdnav_version.tar.gz"
  "libdvdread-$_libdvdread_version.tar.gz"
  "ffmpeg-$_ffmpeg_version.tar.gz"
  "fmt-$_fmt_version.tar.gz"
  "crossguid-$_crossguid_version.tar.gz"
  "fstrcmp-$_fstrcmp_version.tar.gz"
  "flatbuffers-$_flatbuffers_version.tar.gz"
)
sha256sums=('ac5d64d59c6f4811b41a869538506e56c342b530fac97ad9dc9715f3d480e633'
            '9a971662e44353c120f2ccf87655571998956e699a2dd800ec708b8b928a53c8'
            '38816f8373e243bc5950449b4f3b18938c4e1c59348e3411e23f31db4072e40d'
            '071e414e61b795f2ff9015b21a85fc009dde967f27780d23092643916538a57a'
            'a30b6aa0aad0f2c505bc77948af2d5531a80b6e68112addb4c123fca24d5d3bf'
            '73d4cab4fa8a3482643d8703de4d9522d7a56981c938eca42d929106ff474b44'
            '3d77d09a5df0de510aeeb940df4cb534787ddff3bb1828779753f5dfa1229d10'
            'e4018e850f80700acee8da296e56e15b1eef711ab15157e542e7d7e1237c3476'
            '5ca5491e4260cacae30f1a5786d109230db3f3a6e5a0eb45d0d0608293d247e3'
            '27387e49043127f09c5ef0a931fffb864f5730e79629100a6e210b68a1b9f2c1'
            '849daf1d5b081ef6d0e428bbc7d448799fc43a8ac9e79cd7513de0eb5a91b0bb'
            '4676b603e0c170f2d627e305560622b72dbdee51c0a221058c350841a814dc39'
            '3dea58570ec1a59c94513e4c468d232f87d9a71787740b2bc631751e13ce17c1'
            'e27441261d72aaa3f3611638715444b068795d175b0b8c8de8d7612062ca4137'
            'f8966249bc86234a8445109600c24ad926026f179e5bcf65ab3facdfd6acef09'
            'c53ba29065ea3a1a2ed1c6de76b4f5a6b089313a20704f67224233ac1de2971a'
            '4c73812dca6de51ab896d060508608756dd5051cc53c6ca4cce9031fd8747b3a'
            '50b4a057cc2c1c6a6ada2839eb119d91d42ac14e1bbcb5baf272964412fbc711'
            '3850804d0380db35d651e964b83cbe4d0e3e1e7b1bd85c2dda955fd3974e0737'
            'ad3b9acf718875c15a2d8427a9e8b90cf88b2512404e7305bc9b0a36ca2f0b5e'
            'c9dbeeb0d51e8eaa56981f64ca2c3bc5a58317d613d97eba474d2488fefcb04e'
            '834b542997a21a9c205330ed1b743ec8c430bee9c01a64c0493347756aff4f25'
            '65f3f4f297f1f5fcc3b91d5f1bbd232d41497a885f2af5480ec72cac3605b76c'
            'ba525b840f615815892258f74a85c332c9030e8e95988a5463cbb42d35a38a8e'
            '090d038f824a2d5571e68ced2377173c371bd2e20996eeb1c2b2d9e5999050d4'
            'b8ee25888ab3e5efbe2e1997180108ac9f2563eeaabecdc83ff981deed079ef6'
            '269a0f6df80a045c930f38206dabeb966abe317fd05a3d6d38c02c15ed74d6a9'
            '6e3c798913b1a1aaaebd1e0e699c72e78366e681f8b56282aeaa0237d8508a22'
            'a31e0ebdb1b7f4af1f2772d87dc5c1b83be105b20c2cc2d2659de58529f0b207'
            '026b9fb181bbfab92cd141eebff9458cfe536cf789a748047db0e43685db56c1'
            'f74d3247ea74d4b1bbc6b7cbe82e56066a7d859be8986e90950250d6178b1361'
            'e087519deabb93c20409d959542a56156970a0a43fbef05278a0225e07ce31bf'
            '83ba1ab2afcd45e40987bceb5fb2a7b966cc6d669c6d050f51d3539fe2ec247e'
            '379dbd50fe2ec514636aa544b519201b01973af4fee2d0ad218ac3605d0cd634'
            '6aaf1343f41a414ea8e27bfd13bffd37f6e594cf8671f96f754f90fa1dac0cc4'
            '8a6e0aeb20a74bd9a40bd4a7eb50c64c251c5f5ba625a1e96cc438635fb063aa'
            'ccd551b83ae0911c33584d97bf4a3f4bc26eaebe228b15f1cbe5994bdc156edf'
            '652df54be641ed23321f795079a2c91f0a8160f5e369f29d26d6caf0689a9c37'
            '4b6d023895e34649a47e0e7525d1e0db0c67aeb69f0a13370afe433c3981ccd9'
            '1476af4a27081c5c576ba54d939e611d209e7d3bb42af3e1712378ba3885e9be'
            '749e0def2581231a712fb08e90a99fbcaba3f6c11e0a740ff1feba11bfd0ac96'
            'ab7a092bf3b27720da836009ed5d5a30d99c975b1d89b31ff385b921227a980d'
            '761663edbed8f18f70e9b48b068e7e7500259783a1d150ad94ed5117bdea145c'
            '4fd2e32602d4b28611e873eb6c86bd307f8b5ed100f616681dac0431943c5af9'
            '1be369b4a4eaee12c82f8ce003de4bb17da6b486c9bb7ac7a240e0ff41d225b4'
            '51302f2e12ad58ca3c06d8f5d635b8614943a09cbf4dfad2ee94e9ce5e50eafe'
            'e293154c3e4698fc7df3a91aac7ce29949d81bd502f0e4ddc8a6e733a6b861ec'
            'ccf2c6886c20cde118514cebd1faf27b432875b5c6ec1f653c0294b03b04c72e'
            'e5a71dc57afdf7cf00afa4576b56fcc1e9155837665e3575b0ccb289d061a902'
            'eadc8a2df4e1bf9202e059d8caade407bae0282236bf324d46534d66becd6c22'
            '6a42d19d9a7b701db2308829dd3e147089d5a9c3855a9f6f96176e98889726e2'
            '01a8cbe46e3e3c9fb42278d4283e27f8f7882e3145b58fd7f8fae104ee8f24ea'
            '7c1c7e993574d1f9be0cd54ee52de58cbc9e77ba38ada7875d858778b64fbac2'
            '1ff6181f5fa5bb932c532e82b800c0bd60bfa5dd2a42fdf758b9879e05591be2'
            'd494c8606e52d37b93aa2230525d26c2faea92e49fff5fd9492ad7d9c63aa1ee'
            '9743757a932270759d938427be588855a5369cc3c3b9b1e4ee99a371ae961e4a'
            'd166424a07cad55734e65619ba85332f9af8bd0387e823995f739e10789a2587'
            '2ee85388c9551cbdd0e094f39f42b8f4fce9bb5f24eadc0ca94a0e5d361df292')

prepare() {
  [[ -d kodi-build ]] && rm -rf kodi-build
  mkdir kodi-build

  cd "xbmc-$_tag"

  # detect if building in arch chroot using $pkgname rather than hard coding it into a patch
  if [[ "$srcdir" =~ ^\/build.* ]]; then
    local _find="exec_program(cat ARGS \"/proc/cpuinfo\" OUTPUT_VARIABLE CPUINFO)"
    local _replace="exec_program(cat ARGS \"/build/$pkgname/src/cpuinfo\" OUTPUT_VARIABLE CPUINFO)"
    sed -i s"|$_find|$_replace|" cmake/modules/FindSSE.cmake
  fi

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    # only patch subset of patches that begin with 0-9
    [[ $src == [0-9]*.patch ]] || continue
    msg2 "Applying patch $src..."
    # patch -Np1 < "../$src"
    # patch will fail if binary diffs are present so use git apply
    git apply --verbose -p1 < "../$src"
  done
}

build() {
  cd kodi-build

  ### Optionally uncomment and setup to your liking
  # export CFLAGS+=" -march=native"
  # export CXXFLAGS="${CFLAGS}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DENABLE_EVENTCLIENTS=ON \
    -DENABLE_INTERNAL_FFMPEG=ON \
    -DENABLE_INTERNAL_FMT=ON \
    -DENABLE_INTERNAL_CROSSGUID=ON \
    -DENABLE_INTERNAL_FSTRCMP=ON \
    -DENABLE_INTERNAL_FLATBUFFERS=ON \
    -DENABLE_MARIADBCLIENT=ON \
    -DENABLE_MYSQLCLIENT=OFF \
    -Dlibdvdcss_URL="$srcdir/libdvdcss-$_libdvdcss_version.tar.gz" \
    -Dlibdvdnav_URL="$srcdir/libdvdnav-$_libdvdnav_version.tar.gz" \
    -Dlibdvdread_URL="$srcdir/libdvdread-$_libdvdread_version.tar.gz" \
    -DFFMPEG_URL="$srcdir/ffmpeg-$_ffmpeg_version.tar.gz" \
    -DFMT_URL="$srcdir/fmt-$_fmt_version.tar.gz" \
    -DCROSSGUID_URL="$srcdir/crossguid-$_crossguid_version.tar.gz" \
    -DFSTRCMP_URL="$srcdir/fstrcmp-$_fstrcmp_version.tar.gz" \
    -DFLATBUFFERS_URL="$srcdir/flatbuffers-$_flatbuffers_version.tar.gz" \
    ../"xbmc-$_tag"
  make
  make preinstall
}

# kodi
# components: kodi, kodi-bin

package_kodi-devel() {
  pkgdesc="Alpha, Beta, or RC versions of the software media player and entertainment hub for digital media"
  depends=(
    'bluez-libs' 'curl' 'desktop-file-utils' 'freetype2' 'fribidi'
    'hicolor-icon-theme' 'libass' 'libcdio' 'libjpeg-turbo' 'mariadb-libs'
    'libmicrohttpd' 'libpulse' 'libssh' 'libva' 'libvdpau' 'libxrandr' 'libcec' 'libnfs'
    'libxslt' 'lirc' 'lzo' 'mesa' 'python2-pillow' 'python2-simplejson' 'smbclient'
    'speex' 'taglib' 'tinyxml' 'xorg-xdpyinfo' 'yajl' 'libbluray'
  )
  optdepends=(
    'afpfs-ng: Apple shares support'
    'bluez: Blutooth support'
    'python2-pybluez: Bluetooth support'
    'libplist: AirPlay support'
    'lsb-release: log distro information in crashlog'
    'pulseaudio: PulseAudio support'
    'shairplay: AirPlay support'
    'unrar: Archives support'
    'unzip: Archives support'
    'upower: Display battery level'
  )
  provides=("kodi=${pkgver}")
  conflicts=('kodi')
  replaces=('kodi-pre-release')

  _components=(
  'kodi'
  'kodi-bin'
  )

  cd kodi-build
  # install eventclients
  for _cmp in ${_components[@]}; do
  DESTDIR="$pkgdir" /usr/bin/cmake \
    -DCMAKE_INSTALL_COMPONENT="$_cmp" \
     -P cmake_install.cmake
  done

  # python2 is being used
  cd "$pkgdir"
  grep -lR '#!.*python' * | while read file; do sed -s 's/\(#!.*python\)/\12/g' -i "$file"; done
}

# kodi-eventclients
# components: kodi-eventclients-common kodi-eventclients-ps3 kodi-eventclients-wiiremote kodi-eventclients-kodi-send

package_kodi-devel-eventclients() {
  pkgdesc="Kodi Event Clients"
  provides=("kodi-eventclients=${pkgver}")
  conflicts=('kodi-eventclients')
  replaces=('kodi-pre-release-eventclients')
  optdepends=('python2: most eventclients are implemented in python2')

  _components=(
    'kodi-eventclients-common'
    'kodi-eventclients-ps3'
    'kodi-eventclients-kodi-send'
  )

  cd kodi-build
  # install eventclients
  for _cmp in ${_components[@]}; do
    DESTDIR="$pkgdir" /usr/bin/cmake \
      -DCMAKE_INSTALL_COMPONENT="$_cmp" \
      -P cmake_install.cmake
  done

  # python2 is being used
  cd "$pkgdir"
  grep -lR '#!.*python' * | while read file; do sed -s 's/\(#!.*python\)/\12/g' -i "$file"; done
}

# kodi-tools-texturepacker
# components: kodi-tools-texturepacker

package_kodi-devel-tools-texturepacker() {
  pkgdesc="Kodi Texturepacker tool"
  provides=("kodi-tools-texturepacker=${pkgver}")
  conflicts=('kodi-tools-texturepacker')
  replaces=('kodi-pre-release-tools-texturepacker')
  depends=('libpng' 'giflib' 'libjpeg-turbo' 'lzo')

  _components=(
    'kodi-tools-texturepacker'
  )

  cd kodi-build
  # install eventclients
  for _cmp in ${_components[@]}; do
    DESTDIR="$pkgdir" /usr/bin/cmake \
      -DCMAKE_INSTALL_COMPONENT="$_cmp" \
      -P cmake_install.cmake
  done
}

# kodi-dev
# components: kodi-addon-dev kodi-audio-dev kodi-eventclients-dev kodi-game-dev kodi-inputstream-dev kodi-peripheral-dev kodi-pvr-dev kodi-screensaver-dev kodi-visualization-dev

package_kodi-devel-dev() {
  pkgdesc="Kodi dev files"
  provides=("kodi-dev=${pkgver}")
  conflicts=('kodi-dev' 'kodi-pre-release-dev')
  replaces=('kodi-pre-release-dev')
  depends=('kodi-devel')

  _components=(
    'kodi-addon-dev'
    'kodi-audio-dev'
    'kodi-eventclients-dev'
    'kodi-game-dev'
    'kodi-inputstream-dev'
    'kodi-peripheral-dev'
    'kodi-pvr-dev'
    'kodi-screensaver-dev'
    'kodi-visualization-dev'
  )

  cd kodi-build
  # install eventclients
  for _cmp in ${_components[@]}; do
    DESTDIR="$pkgdir" /usr/bin/cmake \
      -DCMAKE_INSTALL_COMPONENT="$_cmp" \
      -P cmake_install.cmake
  done

  # python2 is being used
  cd "$pkgdir"
  grep -lR '#!.*python' * | while read file; do sed -s 's/\(#!.*python\)/\12/g' -i "$file"; done
}
