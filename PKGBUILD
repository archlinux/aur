# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

_opt_DKMS=1           # This can be toggled between installs

#export KERNELRELEASE="$(basename $(dirname /usr/lib/modules/5.10.*/modules.alias))"

# Todo: Unable to trigger timer to see if it works
# Todo: modprobe snx with conflicting major, again modeprobe snx crashes kernel

# ls -l /dev/ttySNX*
# lsmod | grep snx
# lspci -v | grep -A4 -i snx
# dmesg | grep -A8 -i snx

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
pkgname='sunix-snx'
#pkgver='2.0.4_2'; _dl='2016/20160706173626'
#pkgver='2.0.4_3'; _dl='2017/20171122180114'
#pkgver='2.0.5_0'; _dl='2021/20210407180737'
#pkgver='2.0.7_0'; _dl='2022/20220531161341'
pkgver='2.0.8_0'; _dl='2023/20230427142706'
pkgrel='1'
pkgdesc='kernel module driver for Sunix SUN1889 SUN1989 SUN1999 SUN2212 SUN2410 UL7502AQ UL7512EQ UL7522EQ PCI PCIe multi I/O parallel serial RS-232 422 485 port Dell Lenovo Acer Startech'
arch=('i686' 'x86_64')
url='http://www.sunix.com/'
#url='http://www.sunix.com.tw/'
#url='http://www.sunix.com/en/'
#url='http://www.sunixusa.com/'
license=('GPL' 'custom')
makedepends=('gzip' 'findutils' 'sed' 'diffutils' 'patch')
install="${pkgname}-install.sh"
_srcdir="snx_V${pkgver//_/.}"
source=(
  # DO NOT switch link to https. It doesn't work.
  "http://www.sunix.com/en/download.php?file=driver&file_link=download/driver/${_dl}_snx_V${pkgver//_/.}.zip"
  #"http://www.sunix.com.tw/en/download.php?pid=1479&file=driver&file_link=download/driver/${_dl}_snx_V${pkgver//_/.}.tar.gz"
  # http://dpdk.org/dev/patchwork/patch/22003/ [dpdk-dev] kni: fix build with kernel 4.11 lib/librte_eal/linuxapp/kni/compat.h lib/librte_eal/linuxapp/kni/kni_dev.h
  # http://dpdk.org/dev/patchwork/patch/22037/
  # http://rglinuxtech.com/?p=1930
  # https://forum.manjaro.org/t/error-with-rtl8812au/24066
  #'0000-Kernel-4-15-timers.patch'
  '0001-kernel-4.7-async-initialized.patch'
  '0002-kernel-5.12-tty-low_latency.patch'
  '0003-kernel-5.14-task_struct.state-unsigned-tty-flow-tty.patch'
  '0004-kernel-5.15-alloc_tty_driver-put_tty_driver.patch'
  '0005-kernel-6.0-set_termios-const-ktermios.patch'
  '0006-kernel-6.1-TTY_DRIVER_MAGIC-remove-dead-code.patch'
  '0007-kernel-6.4-DEFINE_SEMAPHORE-2arg.patch'
  '0008-kernel-6.6-struct-tty_operations-write-size_t.patch'
  '0009-kernel-6.4-class_create-1arg.patch'
)
md5sums=('04bd8a61796fabbef2bcae349dd8fae0'
         '71564d580faaf72ab3518c298883742e'
         'e3604145fb2b1678da395a600e4cf1ed'
         'a16e94419d504663c50d3d7522b0c019'
         '43db33db258f67122c58c3868d688d13'
         'a2fbf035e4dddf5cab87317223435633'
         '920cdd39dc868c2d216c23d180d9eb3e'
         '7e16e1860e93a08a0591be4bfc8ca558'
         '4b38b409ec2d9aa23b51578587e7033c'
         'd967f1bf0e7a16a778931223404fd046')
sha256sums=('0997586558e219656543b5740e5202f31d2476dd0399e74d768277e862bb4746'
            '4ea9275ca8122543c25f17112d4c374dc39de32e3d9d1d0aa5488bacd514750d'
            'ab0ef161b7c7053299b18ab9b697047d37142e9e88d53d40ac087f64522a55dd'
            '12a9d8f11c60cef0e70d0d5cba684146beb32eef76e7519728e2e4453f671251'
            'fce8e15188f58fcfbea2720672709ea1e8d9e4703155c1222cf31ababd61807f'
            'bc1aeab271927cbb62c9c2d2517f535bbd30646d997c99c757ed4b92fd474218'
            '71d3be91c017166ea523f0f1c7bc5d1e66d828d1de60923b24947be4cb960e01'
            '6e98100a00af103ac21a7054519296ebc1958f7e15f129199189a63c6de5332c'
            '628cb175f7b30e74d1c2f3ca78ccb9a9e4301f1d8e8756d25435581959e312a5'
            '2fedbe6763ce6b7363af62264794fce05ff7bc28e377cc580f697c7b5553df5c')

if [ "${_opt_DKMS}" -ne 0 ]; then
  depends+=('linux' 'dkms' 'linux-headers')
else
  makedepends+=('linux-headers')
fi

_modulename='snx'

# We can't modify .install but we can stop and force the user to fix it.
_install_check() {
  local _ckvar
  local _ckline
  local _pkgname="${pkgname}"
  for _ckvar in '_pkgname' '_modulename'; do
    _ckline="${_ckvar}='${!_ckvar}'"
    if ! grep -q "^${_ckline}"'$' "${startdir}/${install}"; then
      msg "${install} must be fixed"
      echo "${_ckline}"
      set +u
      false
    fi
  done
}

prepare() {
  set -u
  _install_check
  cd "${_srcdir}"

  # Kernel 3,4,5 all use the same makefile. Trim out everything but Kernel 4
  mv driver/Makefile{,.Arch}
  sed -n -e '/^# for kernel 4.0/,/^# for kernel 3.0/ p' 'driver/Makefile.Arch' > 'driver/Makefile'
  sed -e '/findstring 4./ s:^:#:g' -i 'driver/Makefile'
  rm 'driver/Makefile.Arch'

  # Make package compatible and fix some version problems
  #cp -p 'driver/Makefile'{,.Arch}
  sed -e 's: /lib/modules/: /usr/lib/modules/:g' \
      -e '/^install:/,/^$/ s: /usr/lib/: "${DESTDIR}"/usr/lib/:g' \
      -e '# New cache folder for gcc 8' \
      -e 's/^clean.*:$/&\n\trm -f .cache.mk\n\trm -f .Module*\n\trm -f .module*/g' \
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
      -e '# Kernel 5.4 compatible' \
      -e 's: SUBDIRS=\([^ ]\+\) : M=\1&:g ' \
      -e '# No DKMS instructions say to do this but it works and keeps the MAKE line real simple' \
      -e 's:shell uname -r:KERNELRELEASE:g' \
      -e '# DKMS sets KERNELRELEASE which accidentally launches phase 2 of this Makefile' \
      -e '# Fix by changing the detection var.' \
      -e '# SUBDIRS makes more sense to me because I can see it in the Makefile!' \
      -e 's:ifneq ($(KERNELRELEASE),):ifneq ($(SUBDIRS),):g' \
      -e '1i KERNELRELEASE?=$(shell uname -r)' \
    -i 'driver/Makefile'
  sed -e '/^install:/,/^$/ s: /usr/: "${DESTDIR}"/usr/:g' -i 'snxdump/Makefile' 'snxterm/Makefile'
  ! test -s 'driver/Makefile.Arch' || echo "${}"

  # Prevent conflict with /dev/kfd major 242 linux>=4.9. Not present in linux=4.4. linux>4.4 not tested.
  sed -e '/^#define SNX_[A-Z][A-Z][A-Z]_MAJOR/ s:24:23:g' \
      -e '# Remove UTF BOM' \
      -e '1 s:\xEF\xBB\xBF::g' \
    -i 'driver/snx_common.h'

  sed -e 's:\r$::g' -i $(grep -slrF $'\r')

  #cp -pr "${srcdir}/${_srcdir}"{,.orig-0000}; false
  #diff -pNaru5 snx_V2.0.4.3{.orig-0000,} > '0000-Kernel-4-15-timers.patch'
  #patch -Nup1 -i "${srcdir}/0000-Kernel-4-15-timers.patch"

  #cp -pr "${srcdir}/${_srcdir}"{,.orig-0000}; false
  #diff -pNaru5 snx_V2.0.5.0{.orig-0000,} > '0001-kernel-4.7-async-initialized.patch'
  #patch -Nup1 -i "${srcdir}/0001-kernel-4.7-async-initialized.patch"

  #cp -pr "${srcdir}/${_srcdir}"{,.orig-0000}; false
  #diff -pNaru5 snx_V2.0.5.0{.orig-0000,} > '0002-kernel-5.12-tty-low_latency.patch'
  #patch -Nup1 -i "${srcdir}/0002-kernel-5.12-tty-low_latency.patch"

  #cp -pr "${srcdir}/${_srcdir}"{,.orig-0000}; false
  #diff -pNaru5 snx_V2.0.5.0{.orig-0000,} > '0003-kernel-5.14-task_struct.state-unsigned-tty-flow-tty.patch'
  patch -Nup1 --no-backup-if-mismatch -i "${srcdir}/0003-kernel-5.14-task_struct.state-unsigned-tty-flow-tty.patch"

  # http://lkml.iu.edu/hypermail/linux/kernel/2107.2/08799.html [PATCH 5/8] tty: drop alloc_tty_driver
  # http://lkml.iu.edu/hypermail/linux/kernel/2107.2/08801.html [PATCH 7/8] tty: drop put_tty_driver
  #cp -pr "${srcdir}/${_srcdir}"{,.orig-0000}; false
  #diff -pNaru5 snx_V2.0.5.0{.orig-0000,} > '0004-kernel-5.15-alloc_tty_driver-put_tty_driver.patch'
  patch -Nup1 --no-backup-if-mismatch -i "${srcdir}/0004-kernel-5.15-alloc_tty_driver-put_tty_driver.patch"

  # https://lore.kernel.org/linux-arm-kernel/20220816115739.10928-9-ilpo.jarvinen@linux.intel.com/T/
  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  # diff -pNaru5 'a' 'b' > '0005-kernel-6.0-set_termios-const-ktermios.patch'
  patch -Nup1 -i "${srcdir}/0005-kernel-6.0-set_termios-const-ktermios.patch"

  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  # diff -pNaru5 'a' 'b' > '0006-kernel-6.1-TTY_DRIVER_MAGIC-remove-dead-code.patch'
  patch -Nup1 -i "${srcdir}/0006-kernel-6.1-TTY_DRIVER_MAGIC-remove-dead-code.patch"

  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; cd "${_srcdir}"; false
  # diff -pNaru5 'a' 'b' > '0007-kernel-6.4-DEFINE_SEMAPHORE-2arg.patch'
  patch -Nup1 -i "${srcdir}/0007-kernel-6.4-DEFINE_SEMAPHORE-2arg.patch"

  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; cd "${_srcdir}"; false
  # diff -pNaru5 'a' 'b' > '0008-kernel-6.6-struct-tty_operations-write-size_t.patch'
  patch -Nup1 -i "${srcdir}/0008-kernel-6.6-struct-tty_operations-write-size_t.patch"

  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; cd "${_srcdir}"; false
  # diff -pNaru5 'a' 'b' > '0009-kernel-6.4-class_create-1arg.patch'
  patch -Nup1 -i "${srcdir}/0009-kernel-6.4-class_create-1arg.patch"

  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make -j1 # too small for parallel make
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
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
  rm -r "${pkgdir}/usr/lib/modules"/*/misc

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
    rm -r "${pkgdir}/usr/lib/modules/"
    local _dkms="${pkgdir}/usr/src/${pkgname}-${pkgver}"
    install -Dm644 <(cat << EOF
# Automatically generated by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

PACKAGE_NAME="${pkgname}"
PACKAGE_VERSION="${pkgver}"
AUTOINSTALL="yes"

BUILT_MODULE_NAME[0]="${_modulename}"
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
    make -s -C "${_dkms}/driver/" clean KERNELRELEASE="$(uname -r)"
  fi
  set +u
}

set +u
