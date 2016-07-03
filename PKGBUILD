# Maintainer: André Silva <emulatorman@parabola.nu>
# Maintainer: Márcio Silva <coadde@parabola.nu>
# Contributor: Nicolás Reynolds <fauno@kiwwwi.com.ar>
# Contributor: Sorin-Mihai Vârgolici <smv@yobicore.org>
# Contributor: Michał Masłowski <mtjm@mtjm.eu>
# Contributor: Luke Shumaker <lukeshu@sbcglobal.net>
# Contributor: Luke R. <g4jc@openmailbox.org>

# Based on linux package

pkgbase=linux-libre-pck
_pkgbasever=4.6-gnu
_pkgver=4.6.3-gnu
_pckpatchver=pck1

_replacesarchkernel=('linux-zen')
_replacesoldkernels=()
_replacesoldmodules=()

_srcname=linux-${_pkgbasever%-*}
_archpkgver=${_pkgver%-*}
pkgver=${_pkgver//-/_}.${_pckpatchver}
pkgrel=1
rcnrel=armv7-x4
arch=('i686' 'x86_64' 'armv7h')
url="https://wiki.parabola.nu/PCK"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'libelf')
makedepends_armv7h=('git')
options=('!strip')
source=("http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgbasever}/linux-libre-${_pkgbasever}.tar.xz"
        "http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgbasever}/linux-libre-${_pkgbasever}.tar.xz.sign"
        "http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgver}/patch-${_pkgbasever}-${_pkgver}.xz"
        "http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgver}/patch-${_pkgbasever}-${_pkgver}.xz.sign"
        "https://repo.parabola.nu/other/pck/patches/${_pkgver}/patch-${_pkgver}-${_pckpatchver}.patch"
        "https://repo.parabola.nu/other/pck/patches/${_pkgver}/patch-${_pkgver}-${_pckpatchver}.patch.sig"
        "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_clut224.ppm"
        "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_clut224.ppm.sig"
        "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_mono.pbm"
        "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_mono.pbm.sig"
        "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_vga16.ppm"
        "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_vga16.ppm.sig"
        # the main kernel config files
        'config.i686' 'config.x86_64' 'config.armv7h'
        # standard config files for mkinitcpio ramdisk
        'linux.preset'
        'change-default-console-loglevel.patch'
        # armv7h patches
        "https://repo.parabola.nu/other/rcn-libre/patches/${_pkgver%-*}/rcn-libre-${_pkgver%-*}-${rcnrel}.patch"
        "https://repo.parabola.nu/other/rcn-libre/patches/${_pkgver%-*}/rcn-libre-${_pkgver%-*}-${rcnrel}.patch.sig"
        '0001-ARM-atags-add-support-for-Marvell-s-u-boot.patch'
        '0002-ARM-atags-fdt-retrieve-MAC-addresses-from-Marvell-bo.patch'
        '0003-SMILE-Plug-device-tree-file.patch'
        '0004-fix-mvsdio-eMMC-timing.patch'
        '0005-net-smsc95xx-Allow-mac-address-to-be-set-as-a-parame.patch'
        '0006-ARM-TLV320AIC23-SoC-Audio-Codec-Fix-errors-reported-.patch'
        '0007-set-default-cubietruck-led-triggers.patch'
        '0008-USB-armory-support.patch')
sha256sums=('c3726ad785b2f4534c78a2cff1dd09906dde8b82775e55860a6091b16bf62ef8'
            'SKIP'
            '5a6abaddb87c6dd655c3c894bcdfb91e776b36b84c290d446667e5d08121f85a'
            'SKIP'
            '0b7b40a8eb66111ee3d96ef2c75969e57ab12750f480dc08d184575d2c5fb362'
            'SKIP'
            'bfd4a7f61febe63c880534dcb7c31c5b932dde6acf991810b41a939a93535494'
            'SKIP'
            '13bd7a8d9ed6b6bc971e4cd162262c5a20448a83796af39ce394d827b0e5de74'
            'SKIP'
            '6de8a8319271809ffdb072b68d53d155eef12438e6d04ff06a5a4db82c34fa8a'
            'SKIP'
            '365299d0c75640ca61e1c3dab1601e20f19b59fd1eca5c0704024298c9f4f983'
            '2cc1e73ad760f6f55c0b342e0d7ff35e8e996b758579046f890962084f6a6baf'
            '38b2a0949fc815d83e3fba5773dae27c0837bec621fc2c22b579f4fa7d0d2e5a'
            'f0d90e756f14533ee67afda280500511a62465b4f76adcc5effa95a40045179c'
            '1256b241cd477b265a3c2d64bdc19ffe3c9bbcee82ea3994c590c2c76e767d99'
            'f74b28e9e3b6434c1bb7803f9751a068299206953519a9e61162538f5dd8be7e'
            'SKIP'
            '9fc2533ed95497583752c6eca931f24c159be956fcc49d39cac64da7298a9c88'
            '909c046f6123ec81764fde5d9a78431a9dc3b206ce01119ae4d91be54d9471dd'
            '11c63a0952293b4fee080c2c0faf8b08283282c0a50694e71cab0c2503478ac5'
            '49a4fe309e71d3e8cbf4bd98a862c7fcf13cb96d1802dafa8138bbfcf8769725'
            '586e9f30059534dc3b0e765cb78e52ce75c1a3ea23779a7b86045fac7cba2f65'
            '9ade3a63d0d1b4004af3733b0853a4c4d6837d933f30a462045214e2a4354a7a'
            'bd41dd7fa8241781c150f783d55317c2d6d7dd31834619b12504d7277fe91574'
            'f9626d188c76f387da62c6294b09f5fa4d94f5b1534ce2891bef7a99c7b40d2b')
validpgpkeys=(
              '474402C8C582DAFBE389C427BCB7CF877E7D47A7' # Alexandre Oliva
              'C92BAA713B8D53D3CAE63FC9E6974752F9704456' # André Silva
              '684D54A189305A9CC95446D36B888913DDB59515' # Márcio Silva
)

_kernelname=${pkgbase#linux-libre}

case "${CARCH}" in
  i686|x86_64) KARCH=x86;;
  armv7h) KARCH=arm;;
esac

prepare() {
  cd "${srcdir}/${_srcname}"

  # add upstream patch
  if [ "${_pkgbasever}" != "${_pkgver}" ]; then
    patch -p1 -i "${srcdir}/patch-${_pkgbasever}-${_pkgver}"
  fi

  # add PCK patch
  patch -p1 -i "${srcdir}/patch-${_pkgver}-${_pckpatchver}.patch"

  if [ "${CARCH}" = "armv7h" ]; then
    # RCN patch (CM3 firmware deblobbed, AUFS and RT removed)
    # Note: For stability reasons, AUFS and RT have been removed in the RCN patch.
    # We are supporting AUFS in linux-libre-pck through PCK patch and RT through its official
    # patch in linux-libre-rt. See https://wiki.parabola.nu/PCK for further details about PCK.
    git apply -v "${srcdir}/rcn-libre-${_pkgver%-*}-${rcnrel}.patch"

    # ALARM patches
    patch -p1 -i "${srcdir}/0001-ARM-atags-add-support-for-Marvell-s-u-boot.patch"
    patch -p1 -i "${srcdir}/0002-ARM-atags-fdt-retrieve-MAC-addresses-from-Marvell-bo.patch"
    patch -p1 -i "${srcdir}/0003-SMILE-Plug-device-tree-file.patch"
    patch -p1 -i "${srcdir}/0004-fix-mvsdio-eMMC-timing.patch"
    patch -p1 -i "${srcdir}/0005-net-smsc95xx-Allow-mac-address-to-be-set-as-a-parame.patch"
    patch -p1 -i "${srcdir}/0006-ARM-TLV320AIC23-SoC-Audio-Codec-Fix-errors-reported-.patch"
    patch -p1 -i "${srcdir}/0007-set-default-cubietruck-led-triggers.patch"
    patch -p1 -i "${srcdir}/0008-USB-armory-support.patch"
  fi

  # add freedo as boot logo
  install -m644 -t drivers/video/logo \
    "${srcdir}/logo_linux_"{clut224.ppm,vga16.ppm,mono.pbm}

  # add latest fixes from stable queue, if needed
  # http://git.kernel.org/?p=linux/kernel/git/stable/stable-queue.git

  # set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
  # remove this when a Kconfig knob is made available by upstream
  # (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
  patch -p1 -i "${srcdir}/change-default-console-loglevel.patch"

  cat "${srcdir}/config.${CARCH}" > ./.config

  # append pkgrel to extraversion
  sed -ri "s|^(EXTRAVERSION =.*\S).*|\1-${pkgrel}|" Makefile

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

  if [ "${CARCH}" = "armv7h" ]; then
    make ${MAKEFLAGS} LOCALVERSION= zImage modules dtbs
  elif [ "${CARCH}" = "x86_64" ] || [ "${CARCH}" = "i686" ]; then
    make ${MAKEFLAGS} LOCALVERSION= bzImage modules
  fi
}

_package() {
  pkgdesc="The ${pkgbase^} kernel and modules with a handful of awesome features not merged into mainline [AUFS, BFQ, BFS, Knock, TuxOnIce]"
  [ "${pkgbase}" = "linux-libre" ] && groups=('base')
  depends=('coreutils' 'linux-libre-firmware' 'kmod')
  optdepends=('crda: to set the correct wireless channels of your country'
              'systemd-knock: to use system and service manager with TCP Stealth support'
              'openssh-knock: to use SSH with TCP Stealth support')
  provides=("${_replacesarchkernel[@]/%/=${_archpkgver}}")
  conflicts=("${_replacesoldkernels[@]}" "${_replacesoldmodules[@]}")
  replaces=("${_replacesarchkernel[@]}" "${_replacesoldkernels[@]}" "${_replacesoldmodules[@]}")
  depends_i686=('mkinitcpio>=0.7')
  depends_x86_64=('mkinitcpio>=0.7')
  backup_i686=("etc/mkinitcpio.d/${pkgbase}.preset")
  backup_x86_64=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=linux.install

  cd "${srcdir}/${_srcname}"

  # get kernel version
  _kernver="$(make LOCALVERSION= kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
  if [ "${CARCH}" = "armv7h" ]; then
    make LOCALVERSION= INSTALL_DTBS_PATH="${pkgdir}/boot/dtbs/${pkgbase}" dtbs_install
    cp arch/$KARCH/boot/zImage "${pkgdir}/boot/vmlinuz-${pkgbase}"
  elif [ "${CARCH}" = "x86_64" ] || [ "${CARCH}" = "i686" ]; then
    cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgbase}"
  fi

  # set correct depmod command for install
  cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
  true && install=${install}.pkg
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/" \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/" \
    -i "${startdir}/${install}"

  if [ "${CARCH}" = "x86_64" ] || [ "${CARCH}" = "i686" ]; then
    # install mkinitcpio preset file for kernel
    install -D -m644 "${srcdir}/linux.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"
    sed \
      -e "1s|'linux.*'|'${pkgbase}'|" \
      -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-${pkgbase}\"|" \
      -e "s|default_image=.*|default_image=\"/boot/initramfs-${pkgbase}.img\"|" \
      -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-${pkgbase}-fallback.img\"|" \
      -i "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"
  fi

  # remove build and source links
  rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
  # remove the firmware
  rm -rf "${pkgdir}/lib/firmware"
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

  if [ "${CARCH}" = "x86_64" ] || [ "${CARCH}" = "i686" ]; then
    # add vmlinux
    install -D -m644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux"
  fi
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
  if [ "${CARCH}" = "armv7h" ]; then
    for i in dove exynos omap2; do
      mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/mach-${i}"
      cp -a arch/${KARCH}/mach-${i}/include "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/mach-${i}/"
    done
    for i in omap orion samsung versatile; do
      mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/plat-${i}"
      cp -a arch/${KARCH}/plat-${i}/include "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/plat-${i}/"
    done
  fi

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
  # removed in 3.17-gnu series
  # cp fs/xfs/xfs_sb.h "${pkgdir}/usr/lib/modules/${_kernver}/build/fs/xfs/xfs_sb.h"

  # copy in Kconfig files
  for i in $(find . -name "Kconfig*"); do
    mkdir -p "${pkgdir}"/usr/lib/modules/${_kernver}/build/`echo ${i} | sed 's|/Kconfig.*||'`
    cp ${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/${i}"
  done

  # add objtool for external module building and enabled VALIDATION_STACK option
  if [ -f tools/objtool/objtool ];  then
      mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/tools/objtool"
      cp -a tools/objtool/objtool ${pkgdir}/usr/lib/modules/${_kernver}/build/tools/objtool/ 
  fi

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

  # remove files already in docs package
  rm -f "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/kbuild/Kconfig.recursion-issue-01"
  rm -f "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/kbuild/Kconfig.recursion-issue-02"
  rm -f "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/kbuild/Kconfig.select-break"
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

  # remove a file already in kernel package
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
