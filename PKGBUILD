# Contributor (Arch): Daniel Micay <danielmicay@gmail.com>
# Contributor (Arch): Tobias Powalowski <tpowa@archlinux.org>
# Contributor (Arch): Thomas Baechler <thomas@archlinux.org>
# Contributor (Arch): henning mueller <henning@orgizm.net>
# Contributor (Arch): Thomas Dwyer http://tomd.tel
# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor: Nicolás Reynolds <fauno@kiwwwi.com.ar>
# Contributor: Sorin-Mihai Vârgolici <smv@yobicore.org>
# Contributor: Michał Masłowski <mtjm@mtjm.eu>
# Contributor: Márcio Silva <coadde@parabola.nu>
# Contributor: Luke Shumaker <lukeshu@sbcglobal.net>

pkgbase=linux-libre-lts-grsec   # Build kernel with lts-grsec localname
_pkgbasever=3.14-gnu
_pkgver=3.14.47-gnu
_grsecver=3.1
_timestamp=201507050832

_replacesarchkernel=('linux%') # '%' gets replaced with _kernelname
_replacesoldkernels=('kernel26%' 'kernel26-libre%') # '%' gets replaced with _kernelname
_replacesoldmodules=() # '%' gets replaced with _kernelname

_srcname=linux-${_pkgbasever%-*}
_archpkgver=${_pkgver%-*}.${_timestamp}
pkgver=${_pkgver//-/_}.${_timestamp}
pkgrel=1
arch=('i686' 'x86_64' 'mips64el')
url="https://grsecurity.net/"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc')
options=('!strip')
source=("http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgbasever}/linux-libre-${_pkgbasever}.tar.xz"
        "http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgbasever}/linux-libre-${_pkgbasever}.tar.xz.sign"
        "http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgver}/patch-${_pkgbasever}-${_pkgver}.xz"
        "http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgver}/patch-${_pkgbasever}-${_pkgver}.xz.sign"
        "https://repo.parabola.nu/other/grsecurity-libre/stable/grsecurity-libre-${_grsecver}-${_pkgver%-*}-${_timestamp}.patch"
        "https://repo.parabola.nu/other/grsecurity-libre/stable/grsecurity-libre-${_grsecver}-${_pkgver%-*}-${_timestamp}.patch.sig"
        "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_clut224.ppm"
        "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_clut224.ppm.sig"
        "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_mono.pbm"
        "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_mono.pbm.sig"
        "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_vga16.ppm"
        "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_vga16.ppm.sig"
        # the main kernel config files
        'config.i686' 'config.x86_64' 'config.mips64el'
        # standard config files for mkinitcpio ramdisk
        'linux.preset'
        'change-default-console-loglevel.patch'
        '0001-Bluetooth-allocate-static-minor-for-vhci.patch'
        '0002-module-allow-multiple-calls-to-MODULE_DEVICE_TABLE-p.patch'
        '0003-module-remove-MODULE_GENERIC_TABLE.patch'
        '0006-genksyms-fix-typeof-handling.patch'
        'gcc5_buildfixes.diff'
        # loongson-community patch: http://linux-libre.fsfla.org/pub/linux-libre/lemote/gnewsense/pool/debuginfo/
        # Note: Makefile patching was removed due which we are using specific flags from grsecurity patch
        "https://repo.parabola.nu/other/linux-libre/patches/3.14.26-8475f027b4-loongson-community_grsecurity.patch"
        "https://repo.parabola.nu/other/linux-libre/patches/3.14.26-8475f027b4-loongson-community_grsecurity.patch.sig")
sha256sums=('477555c709b9407fe37dbd70d3331ff9dde1f9d874aba2741f138d07ae6f281b'
            'SKIP'
            'd9be335479424000a60cb76928a6aa691dcb9669d0583099247dad58dc5e664a'
            'SKIP'
            '325574b248d7096596a95d888020d1de6f6815082f0c08f9f48f248c357e56a8'
            'SKIP'
            'bfd4a7f61febe63c880534dcb7c31c5b932dde6acf991810b41a939a93535494'
            'SKIP'
            '13bd7a8d9ed6b6bc971e4cd162262c5a20448a83796af39ce394d827b0e5de74'
            'SKIP'
            '6de8a8319271809ffdb072b68d53d155eef12438e6d04ff06a5a4db82c34fa8a'
            'SKIP'
            '3758c3c26491cbbea0a096724a8f54ac246188b1c8e86a3dbe91ac1d23708d3e'
            '07447a3299fcd730a17ca5f1ef6e18983e4843b167e65eca0ab479adf64d60c2'
            'c7863a24550dd068b86b50f74a3a2503289419503d460e526164ea6c246bd443'
            'f0d90e756f14533ee67afda280500511a62465b4f76adcc5effa95a40045179c'
            'faced4eb4c47c4eb1a9ee8a5bf8a7c4b49d6b4d78efbe426e410730e6267d182'
            '6d72e14552df59e6310f16c176806c408355951724cd5b48a47bf01591b8be02'
            '52dec83a8805a8642d74d764494acda863e0aa23e3d249e80d4b457e20a3fd29'
            '65d58f63215ee3c5f9c4fc6bce36fc5311a6c7dbdbe1ad29de40647b47ff9c0d'
            'cf2e7a2d00787f754028e7459688c2755a406e632ce48b60952fa4ff7ed6f4b7'
            '9c89039a0f876888fda3be6f574bca5a120e3587d8342747bbc0723b0b4cde7a'
            '4637b23fc0cb21520c9da612cd39c38a52bd00c80778e39110fc2e72118f9c10'
            'SKIP')
validpgpkeys=(
              '474402C8C582DAFBE389C427BCB7CF877E7D47A7' # Alexandre Oliva
              'C92BAA713B8D53D3CAE63FC9E6974752F9704456' # André Silva
              '684D54A189305A9CC95446D36B888913DDB59515' # Márcio Silva
)

_kernelname=${pkgbase#linux-libre}
_replacesarchkernel=("${_replacesarchkernel[@]/\%/${_kernelname}}")
_replacesoldkernels=("${_replacesoldkernels[@]/\%/${_kernelname}}")
_replacesoldmodules=("${_replacesoldmodules[@]/\%/${_kernelname}}")

case "$CARCH" in
  i686|x86_64) KARCH=x86;;
  mips64el) KARCH=mips;;
esac

prepare() {
  cd "${srcdir}/${_srcname}"

  # add upstream patch
  if [ "${_pkgbasever}" != "${_pkgver}" ]; then
    patch -p1 -i "${srcdir}/patch-${_pkgbasever}-${_pkgver}"
  fi

  # add grsecurity patches (without nonfree bnx2 firmware patching)
  patch -Np1 -i "${srcdir}/grsecurity-libre-${_grsecver}-${_pkgver%-*}-${_timestamp}.patch"
  rm localversion-grsec

  # add freedo as boot logo
  install -m644 -t drivers/video/logo \
    "${srcdir}/logo_linux_"{clut224.ppm,vga16.ppm,mono.pbm}

  # buildfixes for gcc5
  # https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/scsi/qla2xxx/qla_nx2.c?id=9493c2422cae272d6f1f567cbb424195defe4176
  # https://lkml.org/lkml/2014/11/9/27
  # https://lkml.org/lkml/2014/12/14/55
  patch -p1 -i "${srcdir}/gcc5_buildfixes.diff"

  # add latest fixes from stable queue, if needed
  # http://git.kernel.org/?p=linux/kernel/git/stable/stable-queue.git

  # set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
  # remove this when a Kconfig knob is made available by upstream
  # (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
  patch -p1 -i "${srcdir}/change-default-console-loglevel.patch"

  # Fix vhci warning in kmod (to restore every kernel maintainer's sanity)
  patch -p1 -i "${srcdir}/0001-Bluetooth-allocate-static-minor-for-vhci.patch"

  # Fix atkbd aliases
  patch -p1 -i "${srcdir}/0002-module-allow-multiple-calls-to-MODULE_DEVICE_TABLE-p.patch"
  patch -p1 -i "${srcdir}/0003-module-remove-MODULE_GENERIC_TABLE.patch"

  # Fix generation of symbol CRCs
  # http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=dc53324060f324e8af6867f57bf4891c13c6ef18
  patch -p1 -i "${srcdir}/0006-genksyms-fix-typeof-handling.patch"

  # Adding loongson-community patch
  if [ "${CARCH}" == "mips64el" ]; then
    patch -p1 -i ${srcdir}/3.14.26-8475f027b4-loongson-community.patch
  fi

  cat "${srcdir}/config.${CARCH}" > ./.config

  # append pkgrel to extraversion
  sed -ri "s|^(EXTRAVERSION =.*\S).*|\1-${_timestamp}-${pkgrel}|" Makefile

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  # get kernel version
  make prepare

  # load configuration
  # Configure the kernel. Replace the line below with one of your choice.
  #make menuconfig # CLI menu for configuration
  #make nconfig # new CLI menu for configuration
  #make xconfig # X-based configuration
  #make oldconfig # using old config from previous kernel version
  # ... or manually edit .config

  # rewrite configuration
  yes "" | make config >/dev/null
}

build() {
  cd "${srcdir}/${_srcname}"

  make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

_package() {
  pkgdesc="The ${pkgbase^} kernel and modules - stable longtime supported kernel package suitable for servers with grsecurity/PaX patches"
  [ "${pkgbase}" = "linux-libre" ] && groups=('base')
  depends=('coreutils' 'linux-libre-firmware' 'kmod' 'grsec-common' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country'
              'gradm: to configure and enable Role Based Access Control (RBAC)'
              'paxd-libre: to enable PaX exploit mitigations and apply exceptions automatically')
  provides=("${_replacesarchkernel[@]/%/=${_archpkgver}}")
  conflicts=("${_replacesoldkernels[@]}" "${_replacesoldmodules[@]}")
  replaces=("${_replacesarchkernel[@]}" "${_replacesoldkernels[@]}" "${_replacesoldmodules[@]}")
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=linux.install

  cd "${srcdir}/${_srcname}"

  # get kernel version
  _kernver="$(make LOCALVERSION= kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
  cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgbase}"

  # set correct depmod command for install
  cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
  true && install=${install}.pkg
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/" \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/" \
    -i "${startdir}/${install}"

  # install mkinitcpio preset file for kernel
  install -D -m644 "${srcdir}/linux.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"
  sed \
    -e "1s|'linux.*'|'${pkgbase}'|" \
    -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-${pkgbase}\"|" \
    -e "s|default_image=.*|default_image=\"/boot/initramfs-${pkgbase}.img\"|" \
    -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-${pkgbase}-fallback.img\"|" \
    -i "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # remove build and source links
  rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
  # remove the firmware
  rm -rf "${pkgdir}/lib/firmware"
  # gzip -9 all modules to save 100MB of space
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
  # make room for external modules
  ln -s "../extramodules-${_basekernel}${_kernelname}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
  # add real version for building modules and running depmod from post_install/upgrade
  mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname}"
  echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname}/version"

  # Now we call depmod...
  depmod -b "${pkgdir}" -F System.map "${_kernver}"

  # move module tree /lib -> /usr/lib
  mkdir -p "${pkgdir}/usr"
  mv "${pkgdir}/lib" "${pkgdir}/usr/"

  # add vmlinux
  install -D -m644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux" 

  # add grsecurity gcc plugins
  mkdir -p "$pkgdir/usr/lib/modules/${_kernver}/build/tools/gcc"
  cp -a tools/gcc/*.h "$pkgdir/usr/lib/modules/${_kernver}/build/tools/gcc/"
  cp -a tools/gcc/Makefile "$pkgdir/usr/lib/modules/${_kernver}/build/tools/gcc/"
  install -m644 tools/gcc/*.so "$pkgdir/usr/lib/modules/${_kernver}/build/tools/gcc/"
  mkdir -p "$pkgdir/usr/lib/modules/${_kernver}/build/tools/gcc/size_overflow_plugin"
  install -m644 tools/gcc/size_overflow_plugin/Makefile tools/gcc/size_overflow_plugin/*.so \
    "$pkgdir/usr/lib/modules/${_kernver}/build/tools/gcc/size_overflow_plugin"
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgbase^} kernel"
  provides=("${_replacesarchkernel[@]/%/-headers=${_archpkgver}}")
  conflicts=("${_replacesoldkernels[@]/%/-headers}")
  replaces=("${_replacesarchkernel[@]/%/-headers}" "${_replacesoldkernels[@]/%/-headers}")

  install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"

  cd "${srcdir}/${_srcname}"
  install -D -m644 Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/Makefile"
  install -D -m644 kernel/Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/kernel/Makefile"
  install -D -m644 .config \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/.config"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include"

  for i in acpi asm-generic config crypto drm generated keys linux math-emu \
    media net pcmcia scsi sound trace uapi video xen; do
    cp -a include/${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/include/"
  done

  # copy arch includes for external modules
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}"
  cp -a arch/${KARCH}/include "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"

  # copy files necessary for later builds
  cp Module.symvers "${pkgdir}/usr/lib/modules/${_kernver}/build"
  cp -a scripts "${pkgdir}/usr/lib/modules/${_kernver}/build"

  # fix permissions on scripts dir
  chmod og-w -R "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/.tmp_versions"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel"

  cp arch/${KARCH}/Makefile "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"

  if [ "${CARCH}" = "i686" ]; then
    cp arch/${KARCH}/Makefile_32.cpu "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"
  fi

  cp arch/${KARCH}/kernel/asm-offsets.s "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel/"

  # add docbook makefile
  install -D -m644 Documentation/DocBook/Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/DocBook/Makefile"

  # add dm headers
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"
  cp drivers/md/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"

  # add inotify.h
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux"
  cp include/linux/inotify.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux/"

  # add wireless headers
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/net/mac80211/"
  cp net/mac80211/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/net/mac80211/"

  # add dvb headers for external modules
  # in reference to:
  # http://bugs.archlinux.org/task/9912
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-core"
  cp drivers/media/dvb-core/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-core/"
  # and...
  # http://bugs.archlinux.org/task/11194
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"
  cp include/config/dvb/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"

  # add dvb headers for http://mcentral.de/hg/~mrec/em28xx-new
  # in reference to:
  # http://bugs.archlinux.org/task/13146
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  cp drivers/media/dvb-frontends/lgdt330x.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/"
  cp drivers/media/i2c/msp3400-driver.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/"

  # add dvb headers
  # in reference to:
  # http://bugs.archlinux.org/task/20402
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/dvb-usb"
  cp drivers/media/usb/dvb-usb/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/dvb-usb/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends"
  cp drivers/media/dvb-frontends/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/tuners"
  cp drivers/media/tuners/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/tuners/"

  # add xfs and shmem for aufs building
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/fs/xfs"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/mm"
  cp fs/xfs/xfs_sb.h "${pkgdir}/usr/lib/modules/${_kernver}/build/fs/xfs/xfs_sb.h"

  # copy in Kconfig files
  for i in $(find . -name "Kconfig*"); do
    mkdir -p "${pkgdir}"/usr/lib/modules/${_kernver}/build/`echo ${i} | sed 's|/Kconfig.*||'`
    cp ${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/${i}"
  done

  chown -R root.root "${pkgdir}/usr/lib/modules/${_kernver}/build"
  find "${pkgdir}/usr/lib/modules/${_kernver}/build" -type d -exec chmod 755 {} \;

  # strip scripts directory
  find "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts" -type f -perm -u+w 2>/dev/null | while read binary ; do
    case "$(file -bi "${binary}")" in
      *application/x-sharedlib*) # Libraries (.so)
        /usr/bin/strip ${STRIP_SHARED} "${binary}";;
      *application/x-archive*) # Libraries (.a)
        /usr/bin/strip ${STRIP_STATIC} "${binary}";;
      *application/x-executable*) # Binaries
        /usr/bin/strip ${STRIP_BINARIES} "${binary}";;
    esac
  done

  # remove unneeded architectures
  find "${pkgdir}"/usr/lib/modules/${_kernver}/build/arch -mindepth 1 -maxdepth 1 -type d -not -name "$KARCH" -exec rm -rf {} +
}

_package-docs() {
  pkgdesc="Kernel hackers manual - HTML documentation that comes with the ${pkgbase^} kernel"
  provides=("${_replacesarchkernel[@]/%/-docs=${_archpkgver}}")
  conflicts=("${_replacesoldkernels[@]/%/-docs}")
  replaces=("${_replacesarchkernel[@]/%/-docs}" "${_replacesoldkernels[@]/%/-docs}")

  cd "${srcdir}/${_srcname}"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build"
  cp -al Documentation "${pkgdir}/usr/lib/modules/${_kernver}/build"
  find "${pkgdir}" -type f -exec chmod 444 {} \;
  find "${pkgdir}" -type d -exec chmod 755 {} \;

  # remove a file already in linux package
  rm -f "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/DocBook/Makefile"
}

pkgname=("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-docs")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
