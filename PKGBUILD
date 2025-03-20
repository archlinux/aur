# Maintainer: Jeka <evgeny.myandin[at]gmail[dot]com>
# Manjaro credits:
# Bernhard Landauer <bernhard@manjaro.org>
# Philip Müller <philm[at]manjaro[dot]org>
# Arch credits:
# Tobias Powalowski <tpowa@archlinux.org>
# Thomas Baechler <thomas@archlinux.org>
#
# Kernel for Manjaro/EndeavourOS/Arch (ACS override patch include)

pkgbase=linux-jcore
pkgname=('linux-jcore' 'linux-jcore-headers')
_kernelname=-jcore
_hostname=jcore
pkgver=6.13.7
pkgrel=1
pkgdesc="Kernel for Manjaro/EndeavourOS/Arch (ACS override patch include)"
arch=('x86_64')
url="https://www.kernel.org/"
license=('GPL2')
makedepends=(bc docbook-xsl libelf pahole python-sphinx git inetutils kmod xmlto cpio perl tar xz)
replaces=('linux-acs-manjaro' 'linux-acs-manjaro-headers')
options=('!debug' '!strip')

source=(https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$pkgver.tar.xz
        config
        # Upstream Patches
        # ARCH Patches
        0101-ZEN_Add_sysctl_and_CONFIG_to_disallow_unprivileged_CLONE_NEWUSER.patch
        0102-drivers-firmware-skip-simpledrm-if-nvidia-drm.modese.patch
        0103_default_to_max_ASLR_bits.patch
        # Realtek patch
        0999-patch_realtek.patch
        # ROG ALLY Patches (wip/ally-6.13)
        0001-Tmp-add-GA605W-H7606W-to-AMD-PMF-quirks.patch
        0002-drm-amd-display-Avoid-divide-by-zero-by-initializing.patch
        0003-hid-add-VID-PID-for-ASUS-ROG-RAIKIRI-PRO.patch
        0004-hid-asus-check-ROG-Ally-MCU-version-and-warn.patch
        0005-platform-x86-asus-wmi-Refactor-Ally-suspend-resume.patch
        0006-hid-asus-ally-Add-joystick-LED-ring-support.patch
        0007-hid-asus-ally-move-MCU-FW-validation-to-module.patch
        0008-hid-asus-ally-initial-Ally-X-gamepad-bringup.patch
        0009-hid-asus-ally-initial-gamepad-configuration.patch
        0010-hid-asus-ally-add-button-remap-attributes.patch
        0011-hid-asus-ally-add-gamepad-mode-selection.patch
        0012-hid-asus-ally-Turbo-settings-for-buttons.patch
        0013-hid-asus-ally-add-vibration-intensity-settings.patch
        0014-hid-asus-ally-add-JS-deadzones.patch
        0015-hid-asus-ally-add-trigger-deadzones.patch
        0016-hid-asus-ally-add-anti-deadzones.patch
        0017-hid-asus-ally-add-JS-response-curves.patch
        0018-hid-asus-ally-mcu_version-attribute.patch
        0019-hid-asus-ally-add-calibrations-wip.patch
        0020-debug-by-default.patch
        0021-platform-x86-asus-wmi-export-symbols-used-for-read-w.patch
        0022-platform-x86-asus-armoury-move-existing-tunings-to-a.patch
        0023-platform-x86-asus-armoury-add-panel_hd_mode-attribut.patch
        0024-platform-x86-asus-armoury-add-apu-mem-control-suppor.patch
        0025-platform-x86-asus-armoury-add-core-count-control.patch
        0026-platform-x86-asus-wmi-deprecate-bios-features.patch
        0027-platform-x86-asus-armoury-add-the-ppt_-and-nv_-tunin.patch
        0028-backport-fix-fw_attr-use.patch
        # OrangePi Neo patches
        0001-iio_imu_Add_driver_for_Bosch_BMI260_IMU.patch
        # Zotac Zone patches
        636de3f2be1d171b50c47b9f038b7a5b19d8667d.patch
        # Steamdeck (OLED)
        0001-steam-deck.patch
        # ACS Override patch
        1001-6.13.0-add-acs-overrides.patch)

sha256sums=('3a39b62038b7ac2f43d26a1f84b4283e197804e1e817ad637e9a3d874c47801d'
            '01e778180bc186dc5e3c5769f495b6626e8934ed662816d81e0a62fd32f63cd5'
            '888a89ec67433ddfd71ba187a7356ca60270dbe51d6df7211e3930f13121ba8c'
            '934bc233684c45860251bb75433d671b23fa784c891ab3a1ef10d5bc761156b6'
            '6400a06e6eb3a24b650bc3b1bba9626622f132697987f718e7ed6a5b8c0317bc'
            'b88d42565ce771cb6c8f98b7c05aada6b8024578a1985e5772dc5a2d07facee0'
            'de5e14b75160f2bc817194a8dae29ea918196ac9c298f3d8480ff7bb5c26643c'
            '2127896a59e9b4a29103c5c56bdec45b89bbda511e7c92b23259199ec7fb49ae'
            'e78594693244daad56ded1b6796c3accea04777e3d932d74ad989e3b4f713edb'
            '8c8485453ad3dedf29c17a5dc1bb20333a915bd65c1e62a154f353b2817b0469'
            'e1bde7bee50528cc36622ed5a1808ccc271b22ca8078d5b7b87a993ec0fe9a18'
            '88b9b2a5b80438c5a16719145f560f9bd85fe3364d452f76acbe19b2e67e91bf'
            '59d6d8bc520a19a8afcf6daffed2c6fa01e5bf036bbc4895d23f5fbc32c501c0'
            '65f65dd45445bb3bd4e78f2884c1a4fd5157a7cca5338484ac887adfcf7d826b'
            'e7bebaf95bc49557f1a783bc285e2b888f7e69da4d468ce739983f7efca4d363'
            'c67dd63fc5f24efd831ec7bd1a0f26a2515181da5667d126e969d7d6222e2089'
            'b159b452fcab392e3fec74b2fa4f7bfe6ec745b931598f0b0977a18ce74a3f68'
            '6ca6458b6202bce89580fe69aacdda33d9c5ff2173b136ef66aa05d510d4424f'
            'da66ed198e5982f6ba3e349454ecef0b04c2f71693817325665687b7f3a8937f'
            'f9e719d4b8411697161800b50ab8f69f6fdb40190b7ad253f6b58a7f63325004'
            'a3b13f0260b2967c93a25effdfa2fbb6dd335be649153fe0a32822c067dddbf5'
            '6d0dbc7b1d166d1ed6375d7901e338385c53d965510570d9ad7a469d1bec48bb'
            '4429dfd236fa595de0d884db2c2b672e19c9b64df2694273f151ad6064917bbd'
            '558495a7d732de58ad197545c3c618f1c63b747d143784ec78f93418836f2cf0'
            'fc9ce1e36fa4ddf0d959475b964a3543a6702e671e652698e1fd21d14c4e4d1c'
            'e23edf3f19b37cd5f1ed7d7113141d216ff7060a79ceeaa1e83e040c4876ceaf'
            '19150872459c8a7e2f8e69ff9f6eb2c12c0ab5eabd636a82d68a372b4b12e988'
            '1a7ede6f30d8f6319fa364a7d332930e4c403b5bb4e52dace12b2e727cfde882'
            'f800580bda18a4145501511eac7c624294df160c63bb17ba4e334dfd18c89f26'
            '39913168920010425156edaa30b79e48f1e1730797e19a05247cef0d76e07527'
            '969beeb3a236a7b55ef404d35eed5865d04c1ac91c3edce8d62eebea8a749dd9'
            '8cde145d701b0db2bc64782b741d2ce43d27b438a52e64bdf12d29dada859aa0'
            '5917a3d340a6084b67935651d274af1bb3f2ebb989ff52a86d4571dd54a7b4ce'
            '21c1661958674cfeb3d0f595997cbe4000a16e557a201cafa105a896dff52559'
            '14278fdc353e6ab5abc9c1a6b753221df12c9a0e6a8d9fec8baf81d7897a6a4b'
            '5dabdb1d45f1edd9bfaeebbc4a8767812fae5b4de9866cedecab7bfcf982b8ee'
            'f8cf8ad3e17857b51c3f7dd954eb5ac7ba44bfe0302a40e70b2c496573407edf'
            '569742a1c7ce7996ee4c650c444ed13d650fff7b84f23a16e6358693e58aee9f')

prepare() {
  cd "linux-${pkgver}"

  local src
  for src in "${source[@]}"; do
      src="${src%%::*}"
      src="${src##*/}"
      [[ $src = *.patch ]] || continue
      msg2 "Applying patch: $src..."
      patch -Np1 < "../$src"
  done

  cat "../config" > ./.config

  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
    sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config
  fi

  if [ "${_hostname}" != "" ]; then
    sed -i "s|CONFIG_DEFAULT_HOSTNAME=.*|CONFIG_DEFAULT_HOSTNAME=\"${_hostname}\"|g" ./.config
  fi

  msg "set extraversion to pkgrel"
  sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

  msg "don't run depmod on 'make install'"
  # We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  msg "get kernel version"
  make prepare

  msg "rewrite configuration"
  yes "" | make config >/dev/null
}

build() {
  cd "linux-${pkgver}"

  msg "build"
  make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

package_linux-jcore() {
  pkgdesc="Kernel for Manjaro/EndeavourOS/Arch (ACS override patch include)"
  depends=('coreutils' 'linux-firmware' 'kmod' 'initramfs')
  optdepends=('dkms: Dynamic Kernel Module System' 'wireless-regdb: to set the correct wireless channels of your country')
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE KSMBD-MODULE)

  cd "linux-${pkgver}"

  # get kernel version
  _kernver="$(make LOCALVERSION= kernelrelease)"

  mkdir -p "${pkgdir}"/{boot,usr/lib/modules}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}/usr" INSTALL_MOD_STRIP=1 modules_install

  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  cp arch/x86/boot/bzImage "${pkgdir}/usr/lib/modules/${_kernver}/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "${pkgbase}" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules/${_kernver}/pkgbase"

  # add kernel version
  echo "${pkgver}-${pkgrel}${_kernelname} x64" > "${pkgdir}/boot/${pkgbase}-${CARCH}.kver"

  # remove build and source links
  rm "${pkgdir}"/usr/lib/modules/${_kernver}/build

  # now we call depmod...
  depmod -b "${pkgdir}/usr" -F System.map "${_kernver}"
}

package_linux-jcore-headers() {
  pkgdesc="Headers and scripts for building modules for the Kernel for Manjaro/EndeavourOS/Arch (ACS override patch include)"
  depends=('gawk' 'python' 'libelf' 'pahole')

  cd "linux-${pkgver}"
  local _builddir="${pkgdir}/usr/lib/modules/${_kernver}/build"

  install -Dt "${_builddir}" -m644 Makefile .config Module.symvers
  install -Dt "${_builddir}/kernel" -m644 kernel/Makefile
  install -Dt "${_builddir}" -m644 vmlinux

  mkdir "${_builddir}/.tmp_versions"

  cp -t "${_builddir}" -a include scripts

  install -Dt "${_builddir}/arch/x86" -m644 "arch/x86/Makefile"
  install -Dt "${_builddir}/arch/x86/kernel" -m644 "arch/x86/kernel/asm-offsets.s"

  cp -t "${_builddir}/arch/x86" -a "arch/x86/include"

  install -Dt "${_builddir}/drivers/md" -m644 drivers/md/*.h
  install -Dt "${_builddir}/net/mac80211" -m644 net/mac80211/*.h

  # https://bugs.archlinux.org/task/13146
  install -Dt "${_builddir}/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # https://bugs.archlinux.org/task/20402
  install -Dt "${_builddir}/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "${_builddir}/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "${_builddir}/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # https://bugs.archlinux.org/task/71392
  install -Dt "${_builddir}/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

  # add xfs and shmem for aufs building
  mkdir -p "${_builddir}"/{fs/xfs,mm}

  # copy in Kconfig files
  find . -name Kconfig\* -exec install -Dm644 {} "${_builddir}/{}" \;

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "${_builddir}/tools/objtool" tools/objtool/objtool

  # required when DEBUG_INFO_BTF_MODULES is enabled
  install -Dt "${_builddir}/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids

  # remove unneeded architectures
  local _arch
  for _arch in "${_builddir}"/arch/*/; do
    [[ ${_arch} == */x86/ ]] && continue
    rm -r "${_arch}"
  done

  # remove documentation files
  rm -r "${_builddir}/Documentation"

  # strip scripts directory
  local file
  while read -rd '' file; do
    case "$(file -bi "$file")" in
      application/x-sharedlib\;*)      # Libraries (.so)
        strip $STRIP_SHARED "$file" ;;
      application/x-archive\;*)        # Libraries (.a)
        strip $STRIP_STATIC "$file" ;;
      application/x-executable\;*)     # Binaries
        strip $STRIP_BINARIES "$file" ;;
      application/x-pie-executable\;*) # Relocatable binaries
        strip $STRIP_SHARED "$file" ;;
    esac
  done < <(find "${_builddir}" -type f -perm -u+x ! -name vmlinux -print0 2>/dev/null)
  strip $STRIP_STATIC "${_builddir}/vmlinux"

  # remove unwanted files
  find ${_builddir} -name '*.orig' -delete
}
