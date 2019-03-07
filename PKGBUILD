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
pkgver=18.2rc1pre57
_major=18.1
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
  cpuinfo
  00-fix.building.with.mariadb.patch::https://github.com/wsnipex/xbmc/commit/cd20c8eb8a0394db1f028b118c4ca9b91b7e746a.patch
  01-PR15483.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15483.patch
  02-PR15521.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15521.patch
  03-PR15535.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15535.patch
  04-PR15434.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15434.patch
  05-PR15479.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15479.patch
  06-PR15489.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15489.patch
  07-PR15480.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15480.patch
  08-PR15556.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15556.patch
  09-PR15516.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15516.patch
  10-PR15553.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15553.patch
  11-PR15195.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15195.patch
  12-PR15543.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15543.patch
  13-PR15557.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15557.patch
  14-PR15574.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15574.patch
  15-PR15586.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15586.patch
  16-PR15580.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15580.patch
  17-PR15595.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15595.patch
  18-PR15600.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15600.patch
  19-PR15602.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15602.patch
  20-PR14665.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/14665.patch
  21-PR15619.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15619.patch
  22-PR15624.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15624.patch
  23-PR15625.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15625.patch
  24-PR15630.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15630.patch
  25-PR15477.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15477.patch
  26-PR15598.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15598.patch
  27-PR14488.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/14488.patch
  28-PR15582.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15582.patch
  29-PR15622.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15622.patch
  30-PR15631.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15631.patch
  31-PR15636.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15636.patch
  32-PR15634.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15634.patch
  33-PR15499.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15499.patch
  34-PR15615.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15615.patch
  35-PR15614.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15614.patch
  36-PR15635.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15635.patch
  37-PR15537.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15537.patch
  38-PR15491.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15491.patch
  39-PR15641.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15641.patch
  40-PR15506.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15506.patch
  41-PR15510.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15510.patch
  42-PR15640.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15640.patch
  43-PR15646.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15646.patch
  44-PR15605.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15605.patch
  45-PR15649.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15649.patch
  46-PR15653.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15653.patch
  47-PR15589.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15589.patch
  48-PR15621.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15621.patch
  49-PR15661.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15661.patch
  50-PR15591.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15591.patch
  51-PR15654.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15654.patch
  52-PR15675.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15675.patch
  53-PR15633.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15633.patch
  54-PR15678.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15678.patch
  55-PR15518.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15518.patch
  56-PR15689.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15689.patch
  57-PR15683.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15683.patch
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
sha256sums=('bc1ef0e271d0b6ce2e1be7546ad4f7d330930d7631cc19a9bbc5f75ddc586166'
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
            '60c44e53614754578ffe6450d6b1fdb7cebd36f832aeca821a03c922d3e016ad'
            '01d667ac126a48c936fd93926c83588807372ebebb5e32c8305b91b1ff00e6f0'
            '87071bad4fcfa3d8286fe78d01893788c6701d0f520bcbd1a72038da7de4dbc3'
            '1e3140f71720a61a8d1f511424800f0a9a15fa44487c9be0d3e4a5b21db74187'
            '4ae349a7f327874b50a246ce0d30f9f6682e82e49365e38f692b1be8e22f11f8'
            '7102e4043838335879bed7213fdbbbc8206aefb26a4ef6847fd465b25a48ff3b'
            'f97223899b2d0b553c8a2a2c53abfa9283716e778ebe8ed10286ba2c4256ede3'
            '5876bdb064bab4f93cd2627ad275ca098607188d1cb578eeac4b5a8fae8ea70c'
            'dce042e46078ea8eed548851018224594342981bdd7eaf357980c34bf72be5e5'
            'ce007a14539d07f7ef7a03c9c4756f3b49dd609db4eb421887b8d91d93401217'
            'd813a19069bef390c46bd4f30cee2bb3fe28c7b012137929bfa531d09ad1f821'
            'aa76b8f616e6a8ce2f6b4bfc776c64c3c4044e6fb56f6e852251aca564588c2d'
            '363dd4e1b62e4259d91b1a71211b3ff30ab981485adaaf4145e826a5a162ec64'
            '2f1805b3d4bfba0779d3ec51277ab8ba1983be1c354645a32c4b6ea4dc384a8e'
            'a4b3cc936b198b8b8cf77559604193e4f71a9c6d6c40e121bdc62209c16d4f9b'
            '7d3e63968eb5a8054a3f170e17fec1a18b91c1b76d88298f404c41244c2234da'
            '7f34ee5bf18a5fcc43ed729976a6d858f2c719373d4ad5ad621eae185686196a'
            'cf9425a03d04c0f6858756b540cfec6efadb55fc0af99259290fb0ba3fc29639'
            'a82cbfc0a0a8028ed5497be4ebbb45d801f63e32b2df683a1c1bf123e14319b7'
            '45ffc02a6750e9c61e6f0e9b879fccfbd28bb049c7c304044f3f761ce2febf48'
            'b1f5e2a6570ec6e96db701a6bbd3b2fbae8459407a7059c98195769f0ea97ae8'
            'f86019a0b2eda59bef40eca8680a484f2269bf5d8fa50fb62daa8cf2117632b5'
            '6a6081a26618075231ec789eef72a0c9ab98614fba0e862fa04eeb4b4508eecb'
            '4995149972b4df1007ab7cd2ee29c306d8bc0d06b70c0e5d2afe152e5b7b642f'
            '3b598d34ad5f9806349835f57d86324dab10cdd151443ed6391605cbcdda950e'
            'bf4bfae2f885f389e44dab7279c5f6e5bade813376473a196715de93143765a9'
            '00b5898ea40b3033e854c3d64162eb251545c1db0cf75023903ec5cbe685b711'
            '2c3954d70fed0ab79013a67a055d2ab99cea6b29c1b9a0381d68b2e15a12a191'
            '7b579d86b88abd57e2b47dfc94295550cb1df42f28d0e30128526406bd208d70'
            'b572be223238ce1d7f3f5664ef650938caa677ee46a87d45e30ea5965585b0f1'
            '25c3945bb5253e8bddfaaca8c2c2edc2990372bd6b3b9143dc439f1e6f2cc375'
            '2eb13d86d4771bf0b319151a9172a09d560bf6a68415902f172afa2be963a922'
            '67ecebaf9a5336aeb072af1920734a81ec556daeda460b79af1e8238210ce0cf'
            '78fc6a97f4dd7fdd2e4263aa049a54dc3223eb2a11ded92b4cc42e26d27b38c3'
            '3e4d2dabe37901ccd2fe8b6f5aac0db152c8f9def88c31440a3ba7f52f5eb9b5'
            'b163b917b98fc4b9a51f19a30465f2de98f63c6b039dac8a66a872c3a13a18a5'
            '1a7d792e4f0de1794b88b146688c8aec2fcc63af761a1631ea843a6cc11d3e5d'
            '9bc3641c749b4b013b5bce695328fc274d8a86b9451b4c42faae062cfa914306'
            'e2fe8b2d625ffe7b2f7488e81652917185d3a5d8d48e427fdb6f9142ec841c14'
            '3f26bf9ac5e3cdd816af15fdd32c8a7efa1a69d068d0ca245c1bf5ccb1191530'
            '08d711c341e18b276247e9b0af696b00b6bd7ef89b7d93fc2d76d2e6200d86b8'
            '5537365fca3ca4ea4aa41983dac5e23cf7fb6f7660a7f59ba43b71ec7845c673'
            '2631d9f2102fc860135ea126ff6901e2f95a74db9082fd629350841c64104cac'
            'd395fcc4259c9475b9012c7389cdce626dac8782f09ab29f88a4cbec971b3d7a'
            'bf2afe348e99af603485f7aec6330808a0992e8c52852e30f13a6daffebac534'
            'a43b706a0f833caa01213849a0ddedde2be07b18baae9812f8415c175d145cec'
            '2f1d7da8824d6bc83bc48bcbf596e0e03f4cbfdaf7c2898233e370f95e8522e0'
            '8e8e6d193b18340ef91fa0db8a2633de23170b237d1be9f05c77c3b3072e7246'
            '706dea921088dbfa7734954a55db9dd06bdad1e790ea3ba6b783e59b77f03e90'
            '1ddd57409be1d8ddd54502a4df32e28ab21b269855d7fd94485e1e3446cf6db3'
            'fd1c3fa032dadf98cfb9650971a6d5d2d9c5a1923492e20593b58c63f2393338'
            'fe13e816a9d2e811a9f8492c2f21c12578ac054715ffc7e5c8ef2d65a1239da1'
            '5759ac76eaaf1654afcf893ee7b4128b25099644eebc6dcb0caa3de92e50102d'
            '1cc9948b775538b15ecd7b4135d39f896425c3129a4b98af4fb51d21740d60a2'
            '22bae9ac39cca389b903e5f209c6f6d20815b1e9c83f104c174e783b6abc8d64'
            '870500ecfb98fefd82e355fb69e97b2945527bd8bdbbb735a02dac6ca90e8b40'
            '09b9fc4f6c589ca7dfeb43742384d4473c50b30ec5ce971801857ed225703995')

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

  # needed for `git apply` ... if you know how to avoid this let me know
  git init

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    # only patch subset of patches that begin with 0-9
    [[ $src == [0-9]*.patch ]] || continue
    msg2 "Applying patch $src..."
    # patch will fail if binary diffs are present so use git apply first and only
    # if it fails try patch
    if ! git apply --verbose -p1 < "../$src"; then
      patch -Np1 < "../$src"
    fi
  done

  rm -rf .git
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
