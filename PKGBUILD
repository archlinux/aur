# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor: Nicolás Reynolds <fauno@kiwwwi.com.ar>
# Contributor: Sorin-Mihai Vârgolici <smv@yobicore.org>
# Contributor: Michał Masłowski <mtjm@mtjm.eu>
# Contributor: Márcio Silva <coadde@parabola.nu>
# Contributor: Luke Shumaker <lukeshu@sbcglobal.net>
# Contributor: Luke R. <g4jc@openmailbox.org>

# Based on linux-grsec package

pkgbase=linux-libre-grsec
_pkgbasever=4.8-gnu
_pkgver=4.8.17-gnu
_grsecver=3.1
_timestamp=201701151620

_replacesarchkernel=('linux%') # '%' gets replaced with _kernelname
_replacesoldkernels=() # '%' gets replaced with _kernelname
_replacesoldmodules=() # '%' gets replaced with _kernelname

_srcname=linux-${_pkgbasever%-*}
_archpkgver=${_pkgver%-*}.${_timestamp}
epoch=1
pkgver=${_pkgver//-/_}.r${_timestamp}
pkgrel=1
rcnrel=armv7-x4
arch=('i686' 'x86_64' 'armv7h')
url="https://grsecurity.net/"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'libelf')
makedepends_armv7h=('git')
options=('!strip')
source=("https://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgbasever}/linux-libre-${_pkgbasever}.tar.xz"
        "https://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgbasever}/linux-libre-${_pkgbasever}.tar.xz.sign"
        "https://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgver}/patch-${_pkgbasever}-${_pkgver}.xz"
        "https://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgver}/patch-${_pkgbasever}-${_pkgver}.xz.sign"
        "https://repo.parabola.nu/other/grsecurity-libre/test/grsecurity-libre-${_grsecver}-${_pkgver%-*}-${_timestamp}.patch"
        "https://repo.parabola.nu/other/grsecurity-libre/test/grsecurity-libre-${_grsecver}-${_pkgver%-*}-${_timestamp}.patch.sig"
        "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_clut224.ppm"
        "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_clut224.ppm.sig"
        "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_mono.pbm"
        "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_mono.pbm.sig"
        "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_vga16.ppm"
        "https://repo.parabola.nu/other/linux-libre/logos/logo_linux_vga16.ppm.sig"
        # the main kernel config files
        'config.i686' 'config.x86_64' 'config.armv7h'
        # pacman hook for initramfs regeneration
        '99-linux.hook'
        # standard config files for mkinitcpio ramdisk
        'linux.preset'
        'change-default-console-loglevel.patch'
        '0001-usb-serial-gadget-no-TTY-hangup-on-USB-disconnect-WI.patch'
        '0002-fix-Atmel-maXTouch-touchscreen-support.patch'
        # armv7h patches
        "https://repo.parabola.nu/other/rcn-libre-grsec/patches/${_pkgver%-*}/rcn-libre-grsec-${_pkgver%-*}-${rcnrel}.patch"
        "https://repo.parabola.nu/other/rcn-libre-grsec/patches/${_pkgver%-*}/rcn-libre-grsec-${_pkgver%-*}-${rcnrel}.patch.sig"
        '0001-ARM-disable-implicit-function-declaration-error.patch'
        '0002-ARM-fix-redefinition-error-of-atomic64_xchg_unchecked_relaxed.patch'
        '0001-ARM-atags-add-support-for-Marvell-s-u-boot.patch'
        '0002-ARM-atags-fdt-retrieve-MAC-addresses-from-Marvell-bo.patch'
        '0003-SMILE-Plug-device-tree-file.patch'
        '0004-fix-mvsdio-eMMC-timing.patch'
        '0005-net-smsc95xx-Allow-mac-address-to-be-set-as-a-parame.patch'
        '0006-ARM-TLV320AIC23-SoC-Audio-Codec-Fix-errors-reported-.patch'
        '0007-set-default-cubietruck-led-triggers.patch'
        '0008-USB-armory-support.patch'
        '0009-ARM-dts-imx6ul-pico-hobbit-Add-Wifi-support.patch'
        '0010-exynos4412-odroid-set-higher-minimum-buck2-regulator.patch'
        '0011-usb-musb-Call-pm_runtime-from-musb_gadget_queue.patch'
        '0012-phy-twl4030-usb-better-handle-musb_mailbox-failure.patch'
        '0013-Revert-gpu-drm-omapdrm-dss-of-add-missing-of_node_pu.patch')
sha512sums=('728da6c27bd73a41866d37c82bfdc350a3bff59e15291e80a94af9e0b7b4401ea161da4c2ec4d8fc25d30c35becd85624ac32d068afff4c12ee7790c5649da2d'
            'SKIP'
            'e8e52f5a4ea0a8c78cf9704963710962cfc33e764f3de14359591d5ed656b42212ccd83a20923e3c755375c040e155520aad01d41adebface831b5decc62c08e'
            'SKIP'
            '40c94b598768ba10d587095986ab7b33e90d0f12c11d77b4d3ac8d288ffde799f38d59e33c3949f952dbaaa018fc0da651bc2aebfa65747367f3852cda230111'
            'SKIP'
            '13cb5bc42542e7b8bb104d5f68253f6609e463b6799800418af33eb0272cc269aaa36163c3e6f0aacbdaaa1d05e2827a4a7c4a08a029238439ed08b89c564bb3'
            'SKIP'
            '267295aa0cea65684968420c68b32f1a66a22d018b9d2b2c1ef14267bcf4cb68aaf7099d073cbfefe6c25c8608bdcbbd45f7ac8893fdcecbf1e621abdfe9ecc1'
            'SKIP'
            '7a3716bfe3b9f546da309c7492f3e08f8f506813afeb1c737a474c83313d5c313cf4582b65215c2cfce3b74d9d1021c96e8badafe8f6e5b01fe28d2b5c61ae78'
            'SKIP'
            '050f446fc554b36de24b621883421004213f91388a3afa49c23033b8dd2e570c87bb611f494dd0c50e07dd8cf85e533914ff46a2b2d674c377cddda332c7c4e8'
            '6a46acb9ac2c0c88ba70f76313fb7ba2cc52f4a9f41c62df5f8c47583f1646b30079caf1d3c150c5907f18e176cc456a9926660458c744eec5b36c612dcd8647'
            'ce0f9e7f27ec965003327900e65039beaa0a7d845e17996053446f8527e6cd02e648154b2e637ef063593d4b1330eeb06e99ee0e7127e84b3e27ee2fcad00865'
            'd6faa67f3ef40052152254ae43fee031365d0b1524aa0718b659eb75afc21a3f79ea8d62d66ea311a800109bed545bc8f79e8752319cd378eef2cbd3a09aba22'
            '2dc6b0ba8f7dbf19d2446c5c5f1823587de89f4e28e9595937dd51a87755099656f2acec50e3e2546ea633ad1bfd1c722e0c2b91eef1d609103d8abdc0a7cbaf'
            'd9d28e02e964704ea96645a5107f8b65cae5f4fb4f537e224e5e3d087fd296cb770c29ac76e0ce95d173bc420ea87fb8f187d616672a60a0cae618b0ef15b8c8'
            '02af4dd2a007e41db0c63822c8ab3b80b5d25646af1906dc85d0ad9bb8bbf5236f8e381d7f91cf99ed4b0978c50aee37cb9567cdeef65b7ec3d91b882852b1af'
            'b8fe56e14006ab866970ddbd501c054ae37186ddc065bb869cf7d18db8c0d455118d5bda3255fb66a0dde38b544655cfe9040ffe46e41d19830b47959b2fb168'
            'b8ff835e9b74ad47eba7d2b680cd69ff4c45dff591a1b6a26c348e4f3a46db1469c53bf1164da82e9a7e0e6d0c3d33f7e674c4d3366de0c3fcd086662d211589'
            'SKIP'
            'e04da62f138b24a489daf6ea12759ecb545b77be4dd585983d3abb764f4ac3aa4a9bf4179adddc73032b81e4fa54cbf5dbf173b25dfb1723e7379583b57aa426'
            '5d3a5440b3612fb85759b34d9b455118da342928e585b11545a0dcc9d11f16f0924e1b6018e08ed0507e53d1aabab7000c9b4405bc8881a7bda775456d81df2a'
            'b465e902c387804d7ad7721cbd49d6c5d5b15cc321948fcaa620db3dfa9d3476b449cd7c3106ff2f30bc35e0250438464f95c69fecd393b78bb5aec102616891'
            '26029098acbfd12ebc9201df86faa7f906bf37e9df6929ddd2851bcc700828c808331d95874189cfab2c4396e48f257f71c468db6ff367ca3ff8d391d664e7a0'
            '7061ca97ae79c5fa22bdc46aab9f94e3d5079a6fe328816b8ec41c8df705ee8364b0452e3b780b5ebc5a1142e3dc41e0456bad2c9bfb877954f77795e028b07d'
            '34e8f42c10d75a9a1c89d6264af1a3f0b33c136fcd46267bbc20c348ce464743c06fdc0ca2da95a1215bd6ca5e9db9130aa0d85c88280344367a9c035f010db6'
            '2aca4f30c1fcc8032e511b9ee89ef9230d58e377e725e22fecc131e04ef93b0723e040539768cc7917f1be7067d24d371eac61536cc32ba0b404fe85c8657139'
            '9b882ac5ae02355e0c306fa7b3d074df05415a17a02bdc6e7c2d4a8c36bd00987aacc54b5c0af3264f4ee7c3bd49bd5f08bb73d994f2db1b3d0883e52598cc28'
            'ed9b1f86f41547da9862c3b0aef27ca3944141af36392ea8bc2ac22954c4cb4d593e222ebbdcfaf8d45c55e632d1eaa733a25048046ee2960cbe359e8794fa95'
            'a8f577cad348ac190f6b3462870b5a4ceeea9b732408074a4a0caed12f5cddc2ea5de3a7c9292e7b1de256670acf43741a80ad57d1f7a5fd3f9d5d9a80e39c73'
            '6fbb354cfa8c42406da016d300db39b831b4977f1bd33483045615c86ace2d570b9624946ef1ce2bc73cea4f849f7d692d8e81a7c8b173f5066afcb4b315810a'
            '2392019b53c2d4003956dc925f7b1c54506bdf32a848579d846a9230ba6526fbd3aa9d69d2cabf5a9d7b0b0bf77d17b7e6f71b6793339a61d3d592cc00098eba'
            'c2c5a6187f64401423ce4edc857f27957b244f1b1f9b86a19ec556e7d9c42d27bf032605f842cc1b0b2f4967ca739e535b7f12f3dd798d4d70a325c336384055'
            'e15c3ff1cc17e964aa69f7d3bc0df878a267298d73066c883542bf8e4373b797d5080aa5a26d05c6d03ec864f6898899183bd76dffec71e9bcb160aeb51033e0'
            'f91a68687e5191057ebb6fd0aebe0ed5be0148589d15f3e0c4363de7bf7160e29686d4a22725e69d7c5f546c523618b6fad9cfb3444cdc46eaa4a89bc3be237b')
validpgpkeys=(
              '474402C8C582DAFBE389C427BCB7CF877E7D47A7' # Alexandre Oliva
              'C92BAA713B8D53D3CAE63FC9E6974752F9704456' # André Silva
              '684D54A189305A9CC95446D36B888913DDB59515' # Márcio Silva
)

_kernelname=${pkgbase#linux-libre}
_replacesarchkernel=("${_replacesarchkernel[@]/\%/${_kernelname}}")
_replacesoldkernels=("${_replacesoldkernels[@]/\%/${_kernelname}}")
_replacesoldmodules=("${_replacesoldmodules[@]/\%/${_kernelname}}")

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

  # add grsecurity patches (bnx2 firmware deblobbed)
  patch -Np1 -i "${srcdir}/grsecurity-libre-${_grsecver}-${_pkgver%-*}-${_timestamp}.patch"
  rm localversion-grsec

  if [ "${CARCH}" = "armv7h" ]; then
    # RCN patch (CM3 firmware deblobbed, AUFS and RT removed)
    # Note: For stability reasons, AUFS and RT have been removed in the RCN patch.
    # We are supporting AUFS in linux-libre-pck through PCK patch and RT through its official
    # patch in linux-libre-rt. See https://wiki.parabola.nu/PCK for further details about PCK.
    git apply -v "${srcdir}/rcn-libre-grsec-${_pkgver%-*}-${rcnrel}.patch"

    # disable implicit function declaration error since grsecurity patches conflicts against some RCN modules
    patch -p1 -i "${srcdir}/0001-ARM-disable-implicit-function-declaration-error.patch"

    # fix redefinition error of atomic64_xchg_unchecked_relaxed
    patch -p1 -i "${srcdir}/0002-ARM-fix-redefinition-error-of-atomic64_xchg_unchecked_relaxed.patch"

    # ALARM patches
    patch -p1 -i "${srcdir}/0001-ARM-atags-add-support-for-Marvell-s-u-boot.patch"
    patch -p1 -i "${srcdir}/0002-ARM-atags-fdt-retrieve-MAC-addresses-from-Marvell-bo.patch"
    patch -p1 -i "${srcdir}/0003-SMILE-Plug-device-tree-file.patch"
    patch -p1 -i "${srcdir}/0004-fix-mvsdio-eMMC-timing.patch"
    patch -p1 -i "${srcdir}/0005-net-smsc95xx-Allow-mac-address-to-be-set-as-a-parame.patch"
    patch -p1 -i "${srcdir}/0006-ARM-TLV320AIC23-SoC-Audio-Codec-Fix-errors-reported-.patch"
    patch -p1 -i "${srcdir}/0007-set-default-cubietruck-led-triggers.patch"
    patch -p1 -i "${srcdir}/0008-USB-armory-support.patch"
    patch -p1 -i "${srcdir}/0009-ARM-dts-imx6ul-pico-hobbit-Add-Wifi-support.patch"
    patch -p1 -i "${srcdir}/0010-exynos4412-odroid-set-higher-minimum-buck2-regulator.patch"
    patch -p1 -i "${srcdir}/0011-usb-musb-Call-pm_runtime-from-musb_gadget_queue.patch"
    patch -p1 -i "${srcdir}/0012-phy-twl4030-usb-better-handle-musb_mailbox-failure.patch"
    patch -p1 -i "${srcdir}/0013-Revert-gpu-drm-omapdrm-dss-of-add-missing-of_node_pu.patch"
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

  # maintain the TTY over USB disconnects
  # http://www.coreboot.org/EHCI_Gadget_Debug
  patch -p1 -i "${srcdir}/0001-usb-serial-gadget-no-TTY-hangup-on-USB-disconnect-WI.patch"

  # fix Atmel maXTouch touchscreen support
  # https://labs.parabola.nu/issues/877
  # http://www.fsfla.org/pipermail/linux-libre/2015-November/003202.html
  patch -p1 -i "${srcdir}/0002-fix-Atmel-maXTouch-touchscreen-support.patch"

  cat "${srcdir}/config.${CARCH}" > ./.config

  # append pkgrel to extraversion
  sed -ri "s|^(EXTRAVERSION =.*\S).*|\1-r${_timestamp}-${pkgrel}|" Makefile

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
  pkgdesc="The ${pkgbase^} kernel and modules with grsecurity/PaX patches"
  [ "${pkgbase}" = "linux-libre" ] && groups=('base' 'base-openrc')
  depends=('coreutils' 'linux-libre-firmware' 'kmod' 'grsec-common')
  optdepends=('crda: to set the correct wireless channels of your country'
              'gradm: to configure and enable Role Based Access Control (RBAC)'
              'paxd-libre: to enable PaX exploit mitigations and apply exceptions automatically')
  provides=("${_replacesarchkernel[@]/%/=${_archpkgver}}")
  conflicts=("${_replacesoldkernels[@]}" "${_replacesoldmodules[@]}")
  replaces=("${_replacesoldkernels[@]}" "${_replacesoldmodules[@]}")
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
  sed -e "s|%PKGBASE%|${pkgbase}|g;s|%KERNVER%|${_kernver}|g" \
    "${startdir}/${install}" > "${startdir}/${install}.pkg"
  true && install=${install}.pkg

  if [ "${CARCH}" = "x86_64" ] || [ "${CARCH}" = "i686" ]; then
    # install mkinitcpio preset file for kernel
    sed "s|%PKGBASE%|${pkgbase}|g" "${srcdir}/linux.preset" |
      install -D -m644 /dev/stdin "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

    # install pacman hook for initramfs regeneration
    sed "s|%PKGBASE%|${pkgbase}|g" "${srcdir}/99-linux.hook" |
      install -D -m644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/99-${pkgbase}.hook"
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
  replaces=("${_replacesoldkernels[@]/%/-headers}")

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
    media net pcmcia scsi soc sound trace uapi video xen; do
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
  replaces=("${_replacesoldkernels[@]/%/-docs}")

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
