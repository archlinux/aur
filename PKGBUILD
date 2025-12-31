# Maintainer:
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>

true "${QUIET:=}" "${logpipe:=}" "${RED:=}" "${BLUE:=}" "${ALL_OFF:=}" "${BOLD:=}"

set -u
pkgname='xnee'
pkgver='3.19'
pkgrel='2'
pkgdesc='A program to record, distribute, and replay X (X11) protocol data'
arch=('x86_64')
url='https://xnee.wordpress.com/'
license=('GPL-3.0-or-later')
depends=('glibc' 'bash' 'libx11' 'libxi' 'gdk-pixbuf2' 'glib2' 'gtk2' 'libxtst')
makedepends=('texinfo')
optdepends=('xosd: feedback support')
options=('!emptydirs')
_srcdir="${pkgname}-${pkgver}"
source=(
  "https://ftp.gnu.org/gnu/${pkgname}/${_srcdir}.tar.gz"
  #'0000-xnee_fake-include-xnee_km.patch'
  '0000-xnee-patch-file-54452-xnee_fake.c--strip=0.patch::https://file.savannah.gnu.org/file/xnee_fake.c.patch?file_id=54452' # https://savannah.gnu.org/bugs/?63879
  #'0001-cneedemo.h-cnee_record_replay.patch'
  '0001-xnee-patch-file-54453-cnee_demo.h--strip=0.patch::https://file.savannah.gnu.org/file/cnee_demo.h.patch?file_id=54453' # https://savannah.gnu.org/bugs/?63879
  #'0001-cneedemo.h-cnee_record_replay.patch'
  # this patch requires configure to be rebuilt with autoconf
  '0002-xnee-patch-file-54455-configure.in--strip=0.patch::https://file.savannah.gnu.org/file/configure.in.patch?file_id=54455' # https://savannah.gnu.org/bugs/?63882
  '0002-LIBSEMA-CCC-remove.patch'
  # incomplete '0003-xnee-patch-file-54454-duplicate-symbols--strip=0.patch::https://file.savannah.gnu.org/file/duplicate-symbols.patch?file_id=54454' # https://savannah.gnu.org/bugs/?63881
  '0003a-xnee-patch-file-file-49534-enum-decl.patch::https://file.savannah.gnu.org/file/enum-decl.patch?file_id=49534' # https://savannah.gnu.org/bugs/?58810
  '0004-xnee-patch-file-54460-xnee.1.in--strip=0.patch::https://file.savannah.gnu.org/file/xnee.1.in.patch?file_id=54460' # https://savannah.gnu.org/bugs/?63883
  '0005-xnee-patch-file-54457-xnee_error.c--strip=0.patch::https://file.savannah.gnu.org/file/xnee_error.c.patch?file_id=54457' # https://savannah.gnu.org/bugs/?63884
  '0006-xnee-patch-file-54458-TMPDIR--strip=0.patch::https://file.savannah.gnu.org/file/TMPDIR.patch?file_id=54458' # https://savannah.gnu.org/bugs/?63885
  '0007-xnee-patch-file-54459-xnee.sh--strip=0.patch::https://file.savannah.gnu.org/file/xnee.sh.patch?file_id=54459' # https://savannah.gnu.org/bugs/?63888
  '0008-xnee-patch-file-54461-gnee--strip=0.patch::https://file.savannah.gnu.org/file/gnee.patch?file_id=54461' # https://savannah.gnu.org/bugs/?63889
  '0009-xnee-patch-file-54462-simple_bash.sh.in1--strip=0.patch::https://file.savannah.gnu.org/file/simple_bash.sh.in1.patch?file_id=54462' # https://savannah.gnu.org/bugs/?63890
  'gnee.desktop'
)
md5sums=('560e8126950d8d4e7c30fc844d556482'
         '1521fced26b7a4937c98769494809aec'
         'be699c29fa6d63bba4924f0b3bbd2814'
         'c6d54bcac8801d34599194934cbf491a'
         '2eecd9ae2bd17dd70c1cde19bc5b7ce5'
         'fef5adb5491b0a7d4dab08df4b51360e'
         '3483dde6e877a6f904da799c68ebd40b'
         'bfaf0c1b1d87390ed3fbf7b01d9ad47a'
         '8380f0db9ae09b73f5e6053338db0b50'
         'fe30cf0ed9b7a409a3995e3c16b960a8'
         '4270d8d89e76b1e30776e6af6859b3cc'
         '2385e0f8f80410bbf8ee6a6e5ab3eab2'
         '39729efe7273d3400e55ef6ad9c9513c')
sha256sums=('52a41e5cf62f81b7a3e5b58124eb3565e1e12028abda63f547fbbe0d98a2c212'
            'bc358dd33911b984cda4393f7c74ce0a97680a8895ffb9b521f6c8b43e9e9595'
            '29d2a212232696ca662a99a4a8e415c27cb9468a56d1708daa94edd149ee3c64'
            'a1b43c7b8e198ef5e88c0328c736e143840c149a51efde53de25bdb08fdf1e86'
            'b4267b936c93eb44416d34fc250b47eb28e2af05e454e8b53e7fbb1947d2084a'
            'ad9eb3e2574e56e90bf08f803d1f0ecf264091b2466673400828e2840c432d46'
            'd2b56bbe080fc8923be8e390481ff2487e8556e3659616cce3b0daa60ae77887'
            'e87470928f1d64c1b6818038aae1a7104c474a50035435d31d676ce5f3995901'
            '0120f358c9c0e715fab40b743d9c6ad2ca103f993fe70296e7d706674d31e6e0'
            'ba9148d9927fb3bd463c4e7e5e9cee2435c3acf3280eb7dbe9c0802e7a41bd7d'
            '87e520e38bf0bf7b0ba1d4d624c86c5a235052274ed34f06178807ecd7eec17d'
            'e1502fe4fef8e4ecd5db9872e363b56f9703ea34fc63db4b0ccbf516daebb77f'
            'de42d419a46083e39a9b6d60c045c1cd68deb793cc5166a86df81dff608387c1')

#unsolved FS#51027 - [xnee] 'gnee' not recording mouse/keyboard

prepare() {
  local -; set -u
  cd "${_srcdir}"

  local _pt _str
  for _pt in "${source[@]%%::*}"; do
    _pt="${_pt##*/}"
    case "${_pt}" in
    *.patch)
      set +u; msg2 "Applying patch ${_pt}"; set -u
      if [[ "${_pt}" =~ '--strip='([0-9]+) ]]; then
        _str="${BASH_REMATCH[1]}"
      else
        _str=1
      fi
      patch --no-backup-if-mismatch -Np"${_str}" -i "${srcdir}/${_pt}"
      ;;
    esac
  done
  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  # diff -pNaru5 'a' 'b' > "0000-$RANDOM.patch"
  #rm -f 'configure'
}

build() {
  local -; set -u
  cd "${_srcdir}"

  if [ ! -s 'configure' ]; then
    autoconf
  fi
  if [ ! -s 'Makefile' ]; then
    #CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=3/}"
    CFLAGS+=' -Wp,-D_FORTIFY_SOURCE=2' # *** buffer overflow detected ***: terminated
    ./configure --prefix='/usr' --enable-gui --enable-lib --disable-static --disable-static-programs
  fi
  make
}

package() {
  local -; set -u
  cd "${_srcdir}"

  make DESTDIR="${pkgdir}" install

#.desktop file
  install -Dpm644 "${srcdir}/gnee.desktop" "${pkgdir}/usr/share/applications/gnee.desktop"
}
set +u
