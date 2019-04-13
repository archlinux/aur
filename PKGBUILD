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
pkgver=18.2rc1pre141
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
_ffmpeg_version="4.0.3-$_codename-18.2"
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
  000-fix.building.with.mariadb.patch::https://github.com/wsnipex/xbmc/commit/cd20c8eb8a0394db1f028b118c4ca9b91b7e746a.patch
  001-PR14488.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/14488.patch
  002-PR14665.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/14665.patch
  003-PR15195.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15195.patch
  004-PR15434.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15434.patch
  005-PR15477.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15477.patch
  006-PR15479.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15479.patch
  007-PR15480.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15480.patch
  008-PR15489.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15489.patch
  009-PR15491.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15491.patch
  010-PR15499.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15499.patch
  011-PR15506.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15506.patch
  012-PR15510.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15510.patch
  013-PR15516.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15516.patch
  014-PR15518.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15518.patch
  015-PR15535.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15535.patch
  016-PR15537.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15537.patch
  017-PR15543.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15543.patch
  018-PR15553.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15553.patch
  019-PR15556.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15556.patch
  020-PR15557.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15557.patch
  021-PR15574.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15574.patch
  022-PR15580.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15580.patch
  023-PR15582.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15582.patch
  024-PR15586.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15586.patch
  025-PR15589.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15589.patch
  026-PR15591.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15591.patch
  027-PR15595.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15595.patch
  028-PR15596.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15596.patch
  029-PR15598.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15598.patch
  030-PR15600.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15600.patch
  031-PR15602.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15602.patch
  032-PR15605.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15605.patch
  033-PR15614.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15614.patch
  034-PR15615.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15615.patch
  035-PR15619.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15619.patch
  036-PR15621.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15621.patch
  037-PR15622.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15622.patch
  038-PR15624.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15624.patch
  039-PR15625.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15625.patch
  040-PR15630.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15630.patch
  041-PR15631.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15631.patch
  042-PR15633.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15633.patch
  043-PR15634.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15634.patch
  044-PR15635.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15635.patch
  045-PR15636.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15636.patch
  046-PR15640.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15640.patch
  047-PR15641.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15641.patch
  048-PR15643.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15643.patch
  049-PR15646.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15646.patch
  050-PR15649.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15649.patch
  051-PR15653.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15653.patch
  052-PR15654.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15654.patch
  053-PR15657.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15657.patch
  054-PR15661.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15661.patch
  055-PR15675.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15675.patch
  056-PR15678.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15678.patch
  057-PR15683.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15683.patch
  058-PR15685.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15685.patch
  059-PR15689.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15689.patch
  060-PR15697.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15697.patch
  061-PR15701.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15701.patch
  062-PR15702.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15702.patch
  063-PR15713.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15713.patch
  064-PR15714.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15714.patch
  065-PR15716.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15716.patch
  066-PR15719.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15719.patch
  067-PR15732.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15732.patch
  068-PR15738.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15738.patch
  069-PR15706.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15706.patch
  070-PR15707.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15707.patch
  071-PR15711.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15711.patch
  072-PR15753.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15753.patch
  073-PR15741.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15741.patch
  074-PR15755.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15755.patch
  075-PR15756.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15756.patch
  076-PR15658.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15658.patch
  077-PR15585.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15585.patch
  078-PR15766.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15766.patch
  079-PR15730.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15730.patch
  080-PR15647.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15647.patch
  081-PR15728.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15728.patch
  082-PR15769.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15769.patch
  083-PR15712.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15712.patch
  084-PR15744.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15744.patch
  085-PR15776.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15776.patch
  086-PR15780.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15780.patch
  087-PR15644.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15644.patch
  088-PR15779.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15779.patch
  089-PR15782.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15782.patch
  090-PR15773.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15773.patch
  091-PR15642.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15642.patch
  092-PR15790.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15790.patch
  093-PR15787.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15787.patch
  094-PR15593.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15593.patch
  095-PR15798.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15798.patch
  096-PR15804.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15804.patch
  097-PR15792.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15792.patch
  098-PR15810.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15810.patch
  099-PR15778.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15778.patch
  100-PR15795.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15795.patch
  101-PR15667.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15667.patch
  102-PR15783.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15783.patch
  103-PR15791.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15791.patch
  104-PR15822.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15822.patch
  #105-PR15820.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15820.patch
  106-PR15819.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15819.patch
  107-PR15818.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15818.patch
  108-PR15691.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15691.patch
  109-PR15774.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15774.patch
  110-PR15835.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15835.patch
  111-PR15813.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15813.patch
  112-PR15842.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15842.patch
  113-PR15850.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15850.patch
  114-PR15827.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15827.patch
  115-PR15855.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15855.patch
  116-PR15736.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15736.patch
  117-PR15861.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15861.patch
  118-PR15830.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15830.patch
  119-PR15821.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15821.patch
  120-PR15805.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15805.patch
  #121-PR15817.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15817.patch
  122-PR15684.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15684.patch
  123-PR15860.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15860.patch
  124-PR15864.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15864.patch
  125-PR15845.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15845.patch
  126-PR15857.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15857.patch
  127-PR15870.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15870.patch
  128-PR15873.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15873.patch
  129-PR15877.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15877.patch
  130-PR15878.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15878.patch
  131-PR15879.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15879.patch
  132-PR15883.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15883.patch
  133-PR15889.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15889.patch
  134-PR15880.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15880.patch
  135-PR15892.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15892.patch
  136-PR15867.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15867.patch
  137-PR15882.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15882.patch
  138-PR15859.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15859.patch
  139-PR15884.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15884.patch
  140-PR15904.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15904.patch
  141-PR15910.patch::https://patch-diff.githubusercontent.com/raw/xbmc/xbmc/pull/15910.patch
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
            '68535cc2a000946b62ce4be6edf7dda7900bd524f22bcb826800b94f4a873314'
            '38816f8373e243bc5950449b4f3b18938c4e1c59348e3411e23f31db4072e40d'
            '071e414e61b795f2ff9015b21a85fc009dde967f27780d23092643916538a57a'
            'a30b6aa0aad0f2c505bc77948af2d5531a80b6e68112addb4c123fca24d5d3bf'
            '73d4cab4fa8a3482643d8703de4d9522d7a56981c938eca42d929106ff474b44'
            '3d77d09a5df0de510aeeb940df4cb534787ddff3bb1828779753f5dfa1229d10'
            'e4018e850f80700acee8da296e56e15b1eef711ab15157e542e7d7e1237c3476'
            '5ca5491e4260cacae30f1a5786d109230db3f3a6e5a0eb45d0d0608293d247e3'
            '27387e49043127f09c5ef0a931fffb864f5730e79629100a6e210b68a1b9f2c1'
            '849daf1d5b081ef6d0e428bbc7d448799fc43a8ac9e79cd7513de0eb5a91b0bb'
            '00b5898ea40b3033e854c3d64162eb251545c1db0cf75023903ec5cbe685b711'
            '45ffc02a6750e9c61e6f0e9b879fccfbd28bb049c7c304044f3f761ce2febf48'
            'd813a19069bef390c46bd4f30cee2bb3fe28c7b012137929bfa531d09ad1f821'
            '1e3140f71720a61a8d1f511424800f0a9a15fa44487c9be0d3e4a5b21db74187'
            '3b598d34ad5f9806349835f57d86324dab10cdd151443ed6391605cbcdda950e'
            '4ae349a7f327874b50a246ce0d30f9f6682e82e49365e38f692b1be8e22f11f8'
            'f97223899b2d0b553c8a2a2c53abfa9283716e778ebe8ed10286ba2c4256ede3'
            '7102e4043838335879bed7213fdbbbc8206aefb26a4ef6847fd465b25a48ff3b'
            '9bc3641c749b4b013b5bce695328fc274d8a86b9451b4c42faae062cfa914306'
            '67ecebaf9a5336aeb072af1920734a81ec556daeda460b79af1e8238210ce0cf'
            '3f26bf9ac5e3cdd816af15fdd32c8a7efa1a69d068d0ca245c1bf5ccb1191530'
            '08d711c341e18b276247e9b0af696b00b6bd7ef89b7d93fc2d76d2e6200d86b8'
            'dce042e46078ea8eed548851018224594342981bdd7eaf357980c34bf72be5e5'
            '22bae9ac39cca389b903e5f209c6f6d20815b1e9c83f104c174e783b6abc8d64'
            '87071bad4fcfa3d8286fe78d01893788c6701d0f520bcbd1a72038da7de4dbc3'
            '1a7d792e4f0de1794b88b146688c8aec2fcc63af761a1631ea843a6cc11d3e5d'
            'aa76b8f616e6a8ce2f6b4bfc776c64c3c4044e6fb56f6e852251aca564588c2d'
            'ce007a14539d07f7ef7a03c9c4756f3b49dd609db4eb421887b8d91d93401217'
            '5876bdb064bab4f93cd2627ad275ca098607188d1cb578eeac4b5a8fae8ea70c'
            '363dd4e1b62e4259d91b1a71211b3ff30ab981485adaaf4145e826a5a162ec64'
            '2f1805b3d4bfba0779d3ec51277ab8ba1983be1c354645a32c4b6ea4dc384a8e'
            '7d3e63968eb5a8054a3f170e17fec1a18b91c1b76d88298f404c41244c2234da'
            '2c3954d70fed0ab79013a67a055d2ab99cea6b29c1b9a0381d68b2e15a12a191'
            'a4b3cc936b198b8b8cf77559604193e4f71a9c6d6c40e121bdc62209c16d4f9b'
            '2f1d7da8824d6bc83bc48bcbf596e0e03f4cbfdaf7c2898233e370f95e8522e0'
            '1ddd57409be1d8ddd54502a4df32e28ab21b269855d7fd94485e1e3446cf6db3'
            '7f34ee5bf18a5fcc43ed729976a6d858f2c719373d4ad5ad621eae185686196a'
            '26f274a5d8df91c3d1b27743b15f4cad2f5442368f0b29afc8c15d18f9c2241b'
            'bf4bfae2f885f389e44dab7279c5f6e5bade813376473a196715de93143765a9'
            'cf9425a03d04c0f6858756b540cfec6efadb55fc0af99259290fb0ba3fc29639'
            'a82cbfc0a0a8028ed5497be4ebbb45d801f63e32b2df683a1c1bf123e14319b7'
            'd395fcc4259c9475b9012c7389cdce626dac8782f09ab29f88a4cbec971b3d7a'
            '3e4d2dabe37901ccd2fe8b6f5aac0db152c8f9def88c31440a3ba7f52f5eb9b5'
            '78fc6a97f4dd7fdd2e4263aa049a54dc3223eb2a11ded92b4cc42e26d27b38c3'
            'b1f5e2a6570ec6e96db701a6bbd3b2fbae8459407a7059c98195769f0ea97ae8'
            '8e8e6d193b18340ef91fa0db8a2633de23170b237d1be9f05c77c3b3072e7246'
            '7b579d86b88abd57e2b47dfc94295550cb1df42f28d0e30128526406bd208d70'
            'f86019a0b2eda59bef40eca8680a484f2269bf5d8fa50fb62daa8cf2117632b5'
            '6a6081a26618075231ec789eef72a0c9ab98614fba0e862fa04eeb4b4508eecb'
            '4995149972b4df1007ab7cd2ee29c306d8bc0d06b70c0e5d2afe152e5b7b642f'
            'b572be223238ce1d7f3f5664ef650938caa677ee46a87d45e30ea5965585b0f1'
            '5759ac76eaaf1654afcf893ee7b4128b25099644eebc6dcb0caa3de92e50102d'
            '2eb13d86d4771bf0b319151a9172a09d560bf6a68415902f172afa2be963a922'
            'b163b917b98fc4b9a51f19a30465f2de98f63c6b039dac8a66a872c3a13a18a5'
            '25c3945bb5253e8bddfaaca8c2c2edc2990372bd6b3b9143dc439f1e6f2cc375'
            '5537365fca3ca4ea4aa41983dac5e23cf7fb6f7660a7f59ba43b71ec7845c673'
            'e2fe8b2d625ffe7b2f7488e81652917185d3a5d8d48e427fdb6f9142ec841c14'
            '59813c0ee7fcab56d8d112ee2311c94d09b1346aa22c688e45de1a7324e6f0fb'
            '2631d9f2102fc860135ea126ff6901e2f95a74db9082fd629350841c64104cac'
            'bf2afe348e99af603485f7aec6330808a0992e8c52852e30f13a6daffebac534'
            'a43b706a0f833caa01213849a0ddedde2be07b18baae9812f8415c175d145cec'
            'fd1c3fa032dadf98cfb9650971a6d5d2d9c5a1923492e20593b58c63f2393338'
            '10ce8de1ce5c4b1c4e49ae8c02df0e4c1793b0e28c8abe18613885312be73fae'
            '706dea921088dbfa7734954a55db9dd06bdad1e790ea3ba6b783e59b77f03e90'
            'fe13e816a9d2e811a9f8492c2f21c12578ac054715ffc7e5c8ef2d65a1239da1'
            '1cc9948b775538b15ecd7b4135d39f896425c3129a4b98af4fb51d21740d60a2'
            '09b9fc4f6c589ca7dfeb43742384d4473c50b30ec5ce971801857ed225703995'
            'a61f9bb4e068200728b3fe815f96aec371f5b0050c1e02c38f4af89b9bf448d0'
            '870500ecfb98fefd82e355fb69e97b2945527bd8bdbbb735a02dac6ca90e8b40'
            '0a18a6a3013c2080649efc35b8254b9edf754d3883043264d5871d3296ce9129'
            '8a1ddc840efa32bc95ba826ae7b2d9d105767fe32e61822a735e3a221f505c07'
            '53006ddb5b7d931933cf761491c52fa2b2459c260dd8ffca648b0191b4f6cef2'
            '036cf77622992b25e5d55e55a4212b50768c8bba65dcc8e014fa691393dde837'
            '8eea3732c8b7455a16d28697f1619344efdf281a6889ebe39c2366c4676d6cd5'
            '9629c2cdd12334d9cc0beb86bdbad018c2664551b17aa9fef75b66c69b91b740'
            'e72b4b720d699fc33f6da52cfe5df5f94c65370264203737b39bb6d675b35eaa'
            '5abbdf605babcc7143440977b99e9ba4a64dfbe0cba2a1af47a00631567963ed'
            '0ff001e6aaa827be4809112be8377a43176d750d642666c8f138a9b477bcaa4e'
            'bf3e781dc4df0e6b74f6bc80c9c229d8257a2322314347feb2d0bed3842fc4ec'
            '07cbf298efc6884ff5fd3c007130dd50208e269b8b9440a9c1ae4fdbbd4d02ba'
            '5d1d3cb301a5efc83ebd7b5eded4a0d326b754a5099d8fcbefbfafe4854bdb8c'
            'db0e82f92c19369724416c4aa7a00c1d34fcbe59a28f5644880530897bb28bf4'
            '8e861a35c722182da370997e33ba425e0c12094da9d9497dc3ed398ea83f125f'
            'd9787921f157db4b3f640682e90d6ad29bdce4f8c7c53abdc8694733e478f7ce'
            'aab8767e35244ec93b55cba36205d31d9015de63dff07eaf8e6bbee4fc96b358'
            '9d189b5919a17877d447b8dde3a670c76f59f36062e9f23e7b815b620cebaaf3'
            'c15046c77e7e3a60baa642bd064f50415ee998e3d0ea44455574f2dcdfb9c81e'
            '71249bcc13147fc5c5ab5124cd90854fe2e2679cfcffc46b2cfd7f6281e54e72'
            'b66bd829aaef1143ddd62ef17fcd278cc8f1cdf5510a44a16266363c7dee8cf9'
            'a703cd1c786fa2cdd2eb53dbea0515922cb6c23a286d03ac81f1f175fd74bc09'
            '6f8223643248c5ef3a90a6d9a840e063e48f6ba2ceb14d681cad4d7e1e33d6f4'
            '3e92df954b80a8ee980a290f94372c66922cd3cff6bc1470fd86038c1bf48156'
            '820ecdbd580a6f7d1435877613186d3065ad787f0df7795199abc40a6ccf3399'
            'd3bfee627021f427ddf13d8d8ebfc6629c23d03629dd035c8bce78f86ba83d74'
            '64e44ead05aa15b0f2033b9ab7c074797e6145bbc0e2646adddd21abf5e753d6'
            'f21aaa650d3ff1775abd28b66b63acce4266aeae0cf5d40f93d45fa38b60f568'
            '780f15cb962f4d2b593a2120c02b7f7a27e2da09ccae40f770acd47a1144bed5'
            'd59c264d48a5125e72ebb457dd83522632fc34f9439e57d55885bf84b2066907'
            '984233ae21c1d4d1b56b7a41c5d2d1c3bf7ec428f51f3c328dd009f3e6c105cd'
            'd7d1091d9da9a257763975e123af10f4b1e9fc13e7c579fbb0302c2a48d5f4ba'
            '93c598ab711980f38d9c74c1de7b19c40d4ebbd5ff7894ee21ce12deb5dd600c'
            '07f67450af11adb1c32416ae30083e2e3be48ed070da5f5281b445ee542aee7e'
            '7afe5626024527b3ef78dfffe7c07b81c1960bdb32b9645fdf2b43ca8136a11b'
            '9e14af544612f7fcb8596e327bf702ba65cb85f1180f2c0963412b1dd5bb3933'
            'e1fb0d5a39f7313349152c830d114117b45bedba9564e0662b7916dd9c1f1a60'
            '41e6b07c5dfd19b8452355f3c857e7d6dfe6aff125904306e6dcea2fdd0d8c73'
            '926f8b1a4d05f396912c2443fdda8fde635ff574506ab6e28fed5a041a959f55'
            '5f03ecdf681244d1283d6a4312ce5eb8faf060f848d6b25b1c0a6846ad8a4dc6'
            '906063fe4e91dd1f7589016e942e8db0f2e6e948ba171a440075bbb42597ec2f'
            'd8ed787357e1065fa63f31b628e2dc1baa739a7d2cdbc0f7d05e1d1b7b05c07e'
            'f43114c398d0c8f57571b4187d5ca837f6b969210b94e716caca737d9d445caa'
            '64043b7dfdacb032c6441f50c4932ffe3e4dace837aced80904915f66400f1b2'
            '9c554b16bcad50b71ff71f85a6041f845ae210c9578f8c460c4bedc8cf8ff067'
            'b8516595ad1114b2da81080ea2f35735d0b362292a49356f2684fc93333b2205'
            'c315451ecd9742c6004b9b7864e5f024e516fffa68a8360e5f023600b5112ab6'
            '128d6a5e862151f567bf2d743b2d067b51c50d56474658dc61c1f7378d3a7370'
            '01eda49806e7429d3fa8166a88c8a1718f9a118f9093c4588358da5aea1eb956'
            'ef8601bb1f41fb23eb24de91faac6503d4ce6702f406a4581827ff6f946906b6'
            '85f6c11ca8c6ac4caf0e6055a0a2e5a4481ef78f573ed9ac24e0ef940e750e36'
            'b369a95d8cb40995f81c737dfbd6bedb1f04721e2d9ac4b1503f8254ff7384d1'
            'f973af66c943c60f402a118c1be905904860e36b8392d4c01df1abc4c6d50f76'
            'af1d920df811915969fd751107b66569e4d581e645a097fbdd3f5798514916b6'
            '4dfef8c6c5fa7d88b912cb2f4512c0c766357d90d5bbcd389e15dccfef983021'
            'e88a5b78688829e938dcf7a9e715c5ee4da49d1ee2b1a7d97897c78cea649ab4'
            'bd0ebc8758501c4b4db06ca312bc034b6e6191f08e15cec1d7b9965ce092cfe6'
            '4f349d0b01081f0aacaa7fbf6470bebd28754b5a2055814b1dd71480a174aeea'
            'a5efdbaf0b433af61a07beae1a65fef6f63b18e83294e3d109010b5fd984af57'
            'a2a6c57a0738705f86a27184146a3944d1901385511f9cafd07abffc9b8afbb5'
            '47580d80530122156e50474da1e44765751a1d63f6dd560fb7a3e0dd77a1f9c5'
            '1cb3600e373ba8788a015bd4a31f0d0c7ffe44da6c4c935c283cdafc8a2a0901'
            'f74ab1d6e7cb460bfe736a79d011e16d81308dca96d7548bafbbe02fc7c06a16'
            '1b0e208c9bde3769a20b04d2a3980e1494bebfa72d22fb0eeda7e1226b533357'
            '10b41ce5f1d7a8cdf994081bb3d360f56873124985c8b150ebd0f00bd53d1221'
            '5ca3520e3df99818115402a36748723b3a38b7fa61722a72ed7e6032c996ca7d'
            '9936c692f6f7bcb46f995ef4f7c6d9b733d492ace7e992b1762eb5909744c222'
            'bd3f98a99f09647fb17541c58fc38d2f1d917f64dc8fd6056ef5d72d0ebc334b'
            'b235781f6dd40ba1c35304757b14d81c69e6896283c530a4f459422c64bbb291'
            '9779921fb639bd7cdc2864844f7a15b9946d6121c5c99bafaeffa6970b94ea4d'
            '442aa0c63812516e66d8955a44627b20dd4031a93669082dbde09cdf0091eda7'
            '3871c87157fa8fd6453ac7a2bba10892c971247b814b0672a5a9834c43159d90'
            'c58ca00b1e8be959a354b232499144971548144d50c4164794fd6854b26f222c'
            'c8cc581fd1d1b23a759cc830d4b7776b69f6a837ef6b0d02c824ad0180e66092'
            '7f79e3ce505198de60b448cb9ebe7a48d25768313ebfe98a386be0e8894ac579'
            'a3729b65d9c54a65b183828c1c35cd5ca77167f82cc2b56952ad217261440e4b'
            '913d7213c7938a6477c496fe849f57134c9b293d4e0fb009b046d32f6f2270ca'
            '4de09cbfb07b95951e1a06f98170c8deb0467a68c70aef6c89f0ac5f8126ef6c'
            'd8ebadd1949bff709e4a154b826afff0398d2afd944a0f8afe6a6e44082180ad'
            '252c945895559b9c21a0632c00c74e7e929c965e14571e56560f9f0c33b78541'
            'e5581be7bb2c416ceec3dc03e48e2522704d1c2e51f8a69c1f550d1d0d7e693d')

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
