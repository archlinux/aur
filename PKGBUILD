# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

_opt_DKMS=1           # This can be toggled between installs

# Sunix states that the following are not errors and part of normal operation.

#[  126.093932] SNX Info : Loading SUNIX Multi-I/O Board Driver Module
#[  126.093934]                                                        -- Date :    2016/06/20
#[  126.093935]                                                        -- Version : V2.0.4.2
#[  126.094474] SNX Info : Found SUNIX 5069 Series Board (1S1P),
#[  126.094475]            bus number:5, device number:0
#[  126.094485] Trying to free nonexistent resource <000000000000c020-000000000000c027>
#[  126.094487] Trying to free nonexistent resource <000000000000c050-000000000000c057>
#[  126.094489] Trying to free nonexistent resource <000000000000c050-000000000000c052>
#[  126.094490] Trying to free nonexistent resource <000000000000c053-000000000000c057>
#[  126.094491] Trying to free nonexistent resource <000000000000c040-000000000000c047>
#[  126.094493] Trying to free nonexistent resource <000000000000c040-000000000000c042>
#[  126.094494] Trying to free nonexistent resource <000000000000c043-000000000000c047>
#[  126.094714] SNX Info : parport2 - PC-style at 0xc050 (0xc040)
#[  126.094880] SNX Info : lp2 port using parport2 (polling).
#[  126.094882] ================================================================================

# From website:
# Serial: SER5416H SER5466A AL H HL SER6427A AL SER6437A AL H HL SER6456A AL H HL SER5016H SER5027A AL D DL H HL U UH UL SER5037A AL D H HL U UH UL SER5056A AL H HL U UH UHL UL SER5066A AL H HL U UH UHL UL SER5337A SER5356A SER5366A MCS6456P
#   Also: SUN1889 SER4037A
#   Not: ExpressCard ECS1S00
# Parallel: PAR5418A AL PAR6408A AL PAR5008A AL R RL PAR5018A AL
#   Not: SUN1888 PAR4018A
# Multi I/O: MIO5499A H MIO6469A AL H HL P PH PHL PL S SH SHL SL MIO6479A AL H HL P PH PHL PL S SH SHL SL MIO4089AM MIO5069A H P PH U UH UL MIO5079A AL H HL U UH UL MIO5099A H
# RS422/485: IPC-E2108S SI IPC-E2202LI S SI SL IPC-E2204S SI IPC-E3204S IPC-P2102 L LI SI IPC-P2104 SI IPC-P2108 SI IPC-P2116 IPC-P3104 IPC-P3108 U IPC-B2102 SI IPC-B2104 SI IPC-B2108 SI
# Powered COM: DEL2S00PL DEL4S00P MIO6469P PH PHL PL S SH SHL SL MIO6479P PH PHL PL S SH SHL SL SER6427P PH PHL PL SER6437P PH PHL PL S SER6456P PH PHL PL S SH SL MIO5069P PH SER5027P PH PHL PL SER5037P PH PHL PL SER5056P PH PHL PL

# From README
#Maximum 4 boards can be installed in combination(up to 32 serial port and 2 parallel port),
#support sunix multi i/o boards as list below.

#(S - serial port, P - parallel port)

#Golden series
#1S - 4027T 4027A 4027AL 4027D 4027DL 4027P
#2S - 4037T 4037A 4037AL 4037D 4037U 4037P 4037PL
#4S - 4056A 4056A3 4056A4 4056AL 4056D 4056J 4056U 4056UE 4056P 4056PL 4056PM 4055WN 4056DW 4056AM 4056LM 4056LL 4056JM 4056LV 4000A 4000AL 4000P 4000PL
#8S - 4066R 4066U 4066UE 4066WM 4066RM 4066JM 8000A 8000AL
#2S1P - 4079AT
#2S2P - 4089AM
#4S2P - 4096A

#Matrix series
#2S - P1002 P2002
#4S - P1004 P2004 P3004
#8S - P1008 P2008 P3008
#16S - P1016

#SUN1999 series
#1S - 5027A 5027AL 5027H 5027HL 5027P 5027PL 5027PH 5027PHL
#2S - 5037A 5037H 5037AL 5037HL 5037P 5037PH 5037PL 5037PHL
#4S - 5056A 5056AL 5056H 5056HL 5056P 5056PL 5056PH 5056PHL 5056U 5056UL 5056UH 5056UHL
#8S - 5066A 5066H 5066AL 5066HL 5066U 5066UL 5066UH 5066UHL
#16S - 5016H
#1P - 5008A
#1S1P - 5069A 5069H 5069P 5069PH
#2S1P - 5079A 5079H 5079AL
#4S1P - 5099A 5099H
#2S - IPC-P2102 IPC-P2102SI
#4S - IPC-P2104 IPC-P2104SI IPC-P3104
#8S - IPC-P2108 IPC-P2108SI IPC-P3108
#16S -IPC-P2116

#Cash Drawer
#CDK1037A CDK1037P CDK1037H CDK1037L
#CDK1056A CDK1056P CDK1056H CDK1056L

#DIO
#DIO0802 DIO1604 DIO3204

#From OpenSUSE http://rpm.pbone.net/index.php3/stat/4/idpl/33441068/dir/opensuse/com/snx-kmp-pae-2.0.4.0_k4.3.3_6-1.14.i586.rpm.html
#Digitus cards:
#1S: DCSER1
#2S: DCSER2
#4S: DCSER4

set -u
# http://netbsd.gw.com/cgi-bin/man-cgi?puc+4+NetBSD-current
# https://pkgs.org/download/snx-kmp-default # OpenSUSE
# http://wiki.linuxcnc.org/cgi-bin/wiki.pl?Startech
pkgname='snx-kmp'
pkgver='2.0.4_2'
pkgrel='1'
pkgdesc='kernel driver for Sunix SUN1889 SUN1989 SUN1999 SUN2212 SUN2410 UL7502AQ UL7512EQ UL7522EQ PCI PCIe multi I/O parallel serial RS-232 422 485 Dell Lenovo Acer Startech'
arch=('i686' 'x86_64')
url='http://www.sunix.com.tw/'
#url='http://www.sunix.com/en/'
#url='http://www.sunixusa.com/'
license=('custom')
makedepends=('gzip' 'findutils' 'sed' 'diffutils' 'patch')
install="${pkgname}-install.sh"
source=(
  "http://www.sunix.com.tw/en/download.php?pid=1479&file=driver&file_link=download/driver/2016/20160706173626_snx_V${pkgver//_/.}.tar.gz"
  # http://dpdk.org/dev/patchwork/patch/22003/ [dpdk-dev] kni: fix build with kernel 4.11 lib/librte_eal/linuxapp/kni/compat.h lib/librte_eal/linuxapp/kni/kni_dev.h
  # http://dpdk.org/dev/patchwork/patch/22037/
  # http://rglinuxtech.com/?p=1930
  # https://forum.manjaro.org/t/error-with-rtl8812au/24066
  'sunix-patch-signal_pending-kernel-4-11.patch'
)
sha256sums=('56ef81518184116bd4fd158e39d0e5ceace53f26f85398371bb230d44da4ff9a'
            'b589ba0e9d18638b26c8584cefaa5ed500a4984b9d03ed1d6863ba34a559742c')

if [ "${_opt_DKMS}" -ne 0 ]; then
  depends+=('linux' 'dkms' 'linux-headers')
else
  makedepends+=('linux-headers')
fi

# We can't modify .install but we can stop and force the user to fix it.
_install_check() {
  local _ckvar
  local _ckline
  local _pkgname="${pkgname}"
  for _ckvar in _pkgname; do
    _ckline="${_ckvar}='${!_ckvar}'"
    if ! grep -q "^${_ckline}"'$' "${startdir}/${install}"; then
      set +u
      msg "${install} must be fixed"
      echo "${_ckline}"
      false
    fi
  done
}

prepare() {
  set -u

  _install_check

  # Make package compatible and fix some version problems
  #cp -p 'driver/Makefile' 'driver/Makefile.Arch'
  sed -e 's: /lib/modules/: /usr/lib/modules/:g' \
      -e '/^install:/,/^$/ s: /usr/lib/: "${DESTDIR}"/usr/lib/:g' \
      -e '# What sort of make clean deletes files out of system folders?' \
      -e '/^clean/,/^$/ s: /usr/lib/: "${DESTDIR}"/usr/lib/:g' \
      -e '# Prevent file deletion for DKMS' \
      -e '\:/usr/lib/modules: s:^\s\+rm\s:#&:g' \
      -e '# Disable depmod '\
      -e 's:^\s\+depmod :# &:g' \
      -e '# Dont repeat kernel make on install' \
      -e 's/install: modules/install: /g' \
      -e '# Fix bad kernel version matching. 2.6 would match 4.12.6, a version coming up soon' \
      -e '/findstring / s:findstring\s\+:&=:g ' \
      -e '/findstring / s:\$(shell uname:=&:g ' \
      -e '/findstring / s:"\([0-9]\):"=\1:g ' \
      -e '# 2.6 would match a hostname of rack2.6location5' \
      -e '/findstring / s:uname -a:uname -r:g ' \
    -i 'driver/Makefile'
  sed -e '/^install:/,/^$/ s: /usr/: "${DESTDIR}"/usr/:g' -i 'snxdump/Makefile' 'snxterm/Makefile'

  # Prevent conflict with /dev/kfd major 242 linux>=4.9. Not present in linux=4.4. linux>4.4 not tested.
  sed -e '/^#define SNX_[A-Z][A-Z][A-Z]_MAJOR/ s:24:23:g' \
      -e '# Remove UTF BOM' \
      -e 's:\xEF\xBB\xBF::g' \
    -i 'driver/snx_common.h'

  # diff -pNau3 driver/snx_common.h{.orig,} > 'sunix-patch-signal_pending-kernel-4-11.patch'
  patch -Nbup0 < 'sunix-patch-signal_pending-kernel-4-11.patch'

  # Forgot to clean tarball
  'ma'ke -s -j1 clean
  sed -e 's:\r$::g' -i $(grep -slrF $'\r')
  set +u
}

build() {
  set -u
  make -s -j1 # too small for parallel make
  set +u
}

package() {
  set -u
  if [ "${_opt_DKMS}" -eq 0 ]; then
    # I don't want Linux version info showing on AUR web. After a few months 'linux<0.0.0' makes it look like an out of date package.
    local _kernelversionsmall="$(uname -r)"
    _kernelversionsmall="${_kernelversionsmall%%-*}"
    _kernelversionsmall="${_kernelversionsmall%\.0}" # trim 4.0.0 -> 4.0, 4.1.0 -> 4.1
    # prevent the mksrcinfo bash emulator from getting these vars!
    eval 'conf''licts=("linux>${_kernelversionsmall}" "linux<${_kernelversionsmall}")'
    eval 'dep''ends+=("linux=${_kernelversionsmall}")'
  fi

  install -d "${pkgdir}/usr/bin"
  make -s -j1 DESTDIR="${pkgdir}" install

  # Don't install two copies.
  rm -r "${pkgdir}/usr/lib/modules/$(uname -r)/misc"

  # The module is in the same folder as DKMS. Compress to a different name to prevent conflict.
  # When future versions of DKMS compress we'll stop doing this.
  find "${pkgdir}/usr/lib/modules/" -type 'f' -name '*.ko' -exec 'gzip' '-9' '{}' ';'

  # Desktop file for config tool
  install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

[Desktop Entry]
Name=Sunix Configuration Tool
GenericName=Serial Port Configuration
Comment=Manage Sunix Serial Devices
Exec=snxterm
Terminal=true
Type=Application
#Icon=
Categories=Application;Utility;
MimeType=application/x-executable
EOF
  ) "${pkgdir}/usr/share/applications/sunix-snxterm.desktop"

  if [ "${_opt_DKMS}" -ne 0 ]; then
    rm -rf "${pkgdir}/usr/lib/modules/"
    local _dkms="${pkgdir}/usr/src/${pkgname}-${pkgver}"
    install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

PACKAGE_NAME="${pkgname}"
PACKAGE_VERSION="${pkgver}"
AUTOINSTALL="yes"

BUILT_MODULE_NAME[0]="snx"
BUILT_MODULE_LOCATION[0]="driver"
# Using all processors doesn't compile this tiny module any faster.
MAKE[0]="make -j1 -C 'driver'"
CLEAN[0]="make -j1 -C 'driver' clean"
# The install version is .ko.gz. The DKMS version is .ko. No conflicts.
DEST_MODULE_LOCATION[0]="/kernel/drivers/char"
EOF
    ) "${_dkms}/dkms.conf"
    install -dm755 "${_dkms}/driver/"
    cp -pr 'driver/' "${_dkms}/"
    sed -e '# No DKMS instructions say to do this but it works and keeps the MAKE line real simple' \
        -e 's:shell uname -r:KERNELRELEASE:g' \
        -e '# DKMS sets KERNELRELEASE which accidentally launches phase 2 of this Makefile' \
        -e '# Fix by changing the detection var.' \
        -e '# SUBDIRS makes more sense to me because I can see it in the Makefile!' \
        -e 's:ifneq ($(KERNELRELEASE),):ifneq ($(SUBDIRS),):g' \
      -i "${_dkms}/driver/Makefile"
    make -s -C "${_dkms}/driver/" clean KERNELRELEASE="$(uname -r)"
  fi
  set +u
}

set +u
