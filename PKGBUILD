# Maintainer: Evgeny Myandin <evgeny.myandin[at]gmail[dot]com>
# Manjaro credits:
# Bernhard Landauer <bernhard@manjaro.org>
# Philip Müller <philm[at]manjaro[dot]org>
# Arch credits:
# Tobias Powalowski <tpowa@archlinux.org>
# Thomas Baechler <thomas@archlinux.org>
#
# This is original kernel of Manjaro Linux + ACS patch

pkgbase=linux-acs-manjaro
pkgname=('linux-acs-manjaro' 'linux-acs-manjaro-headers')
_kernelname=-ACS-MANJARO
_basekernel=6.0
pkgver=6.0.3
pkgrel=2
arch=('x86_64')
url="https://www.kernel.org/"
license=('GPL2')
makedepends=(bc docbook-xsl libelf pahole git inetutils kmod xmlto cpio perl tar xz)
options=('!strip')
source=("https://www.kernel.org/pub/linux/kernel/v6.x/linux-${_basekernel}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v6.x/patch-${pkgver}.xz"
        'config'
        # ARCH Patches
        '0101-ZEN_Add_sysctl_and_CONFIG_to_disallow_unprivileged_CLONE_NEWUSER.patch'
        '0102-mm_vmscan_fix_extreme_overreclaim_and_swap_floods.patch'
        '0103-Bluetooth_fix_deadlock_for_RFCOMM_sk_state_change.patch'
        'https://github.com/archlinux/linux/commit/fb23dad87a0bfb6fdfde3dc1d18104da631d050a.patch'
        'https://github.com/archlinux/linux/commit/64ebb671ffc4cbfd548e4f1b4aeb98155fd386dc.patch'
        'https://github.com/archlinux/linux/commit/a24b69f369c6c55be8ce40427feb4e127afae129.patch'
        'https://github.com/archlinux/linux/commit/785699dbc7041b99e0027bff27ffe17eba202e96.patch'
        'https://github.com/archlinux/linux/commit/6df3912f64cea68409b08d282ffbccf0af7f8d8e.patch'
        # MANJARO Patches
        'https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/plain/queue-6.0/revert-alsa-hda-fix-page-fault-in-snd_hda_codec_shutdown.patch'
        'https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/plain/queue-6.0/drm-i915-bios-use-hardcoded-fp_timing-size-for-generating-lfp-data-pointers.patch'
        'https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/plain/queue-6.0/drm-i915-bios-validate-fp_timing-terminator-presence.patch'
        'https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/plain/queue-6.0/efi-efivars-fix-variable-writes-without-query_variable_store.patch'
        'https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/plain/queue-6.0/efi-ssdt-don-t-free-memory-if-acpi-table-was-loaded-successfully.patch'
        'https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/plain/queue-6.0/thermal-intel_powerclamp-use-first-online-cpu-as-control_cpu.patch'
        # Bootsplash
        '0301-revert-fbcon-remove-now-unusued-softback_lines-cursor-argument.patch'
        '0302-revert-fbcon-remove-no-op-fbcon_set_origin.patch'
        '0303-revert-fbcon-remove-soft-scrollback-code.patch'
        '0401-bootsplash.patch'
        '0402-bootsplash.patch'
        '0403-bootsplash.patch'
        '0404-bootsplash.patch'
        '0405-bootsplash.patch'
        '0406-bootsplash.patch'
        '0407-bootsplash.patch'
        '0408-bootsplash.patch'
        '0409-bootsplash.patch'
        '0410-bootsplash.patch'
        '0411-bootsplash.patch'
        '0412-bootsplash.patch'
        '0413-bootsplash.gitpatch'
        # ACS override patch
        '0999-acs.gitpatch')
sha256sums=('5c2443a5538de52688efb55c27ab0539c1f5eb58c0cfd16a2b9fbb08fd81788e'
            'c2735c685dda548811190ecb1379f52cbdb866b198914a67030072a7d2191ca3'
            '6ae19cf65e5b6926452846bfef3b119a6f402909e4ea03ff2894b95e42e577da'
            '05f04019d4a2ee072238c32860fa80d673687d84d78ef436ae9332b6fb788467'
            'a75d2a2322c8cd99a6dc9945424fd9006e7a8f9d2793c0ae97ef931f2d54b9a5'
            'a8a2d8b402b2877df1a949a106c634b6c366dd33b954c4b735ce1d3778214169'
            '5004facad5df507f81a2de86de12c97eb87c4dee9b3b9b44e8ff2e7c5302db14'
            '86ab8a9821ea7300ff7f7c9d64cf54f6662ae4609097fff3795e548f3181d603'
            '7bc0a5aa10af57d3f68157afdb1d1ba252c59582180dbb5d02acb5c334e74d0b'
            'ad6fb3d449ded539840cc2dc5e12ecbc9563a68b3054bc93dd302f4ab58d7ca2'
            'c6a65c8bd5e51d59af060be03534690c658e7eb4a2bcbad21d407afb88f6d3ab'
            '0e24e6d985ae8c92caf7805bc2020c09423b84eee298442c36b179a4b6aede0f'
            '17c5175ec3961697fb16458cca03e3a97f6f981f043d76e8da8e5b3535cf9cb5'
            'ef3f8b6b4f61fdd2b93ae33473bea7593997d53f0b66127a16f3d71e9bdf3eae'
            '2a53e5b295d717b97948716d3c79cca929612961e9cd8335712dd6e6498fe550'
            'a30c79973fdf33eae175e810e3d859fa4f9c0b0e9b4f430c822ec50f5be5c889'
            '684e9dde13ffeaa7296eb9f352fbb6820456b220965dbf18c033ca18e96404da'
            '2b11905b63b05b25807dd64757c779da74dd4c37e36d3f7a46485b1ee5a9d326'
            '94a8538251ad148f1025cc3de446ce64f73dc32b01815426fb159c722e8fa5bc'
            '8e5c147591d14300a59ed8354a9d0746cf78650256558b45f964ca76eaed9a9f'
            '57ce3e0ba6bf400d36358a9d30589905f6e51bc037d7165f5a2658b6bdc86793'
            'a26b3abaec1cd5731bc8431fecb8b3eb0ba47c1992e614643320df14ff859556'
            '8c1c880f2caa9c7ae43281a35410203887ea8eae750fe8d360d0c8bf80fcc6e0'
            '1144d51e5eb980fceeec16004f3645ed04a60fac9e0c7cf88a15c5c1e7a4b89e'
            'dd4b69def2efacf4a6c442202ad5cb93d492c03886d7c61de87696e5a83e2846'
            '028b07f0c954f70ca37237b62e04103e81f7c658bb8bd65d7d3c2ace301297dc'
            'a0c548c5703d25ae34b57931f1162de8b18937e676e5791a0f039922090881e7'
            '8dbb5ab3cb99e48d97d4e2f2e3df5d0de66f3721b4f7fd94a708089f53245c77'
            'a7aefeacf22c600fafd9e040a985a913643095db7272c296b77a0a651c6a140a'
            'cf06d959a53eff6d3c287327f1cb2a68346d725cfd1370bc7482a0edc75692fc'
            '27471eee564ca3149dd271b0817719b5565a9594dc4d884fe3dc51a5f03832bc'
            'b6e695edbe349505a89c98054a54443acd90830a312cd035393c5c0a624e45c0'
            '035ea4b2a7621054f4560471f45336b981538a40172d8f17285910d4e0e0b3ef'
            '2542b5cea79ab5817ce3d30c54acd045966b9c14587bfb0b2f50d473da48a1d5')

prepare() {
  cd "linux-${_basekernel}"

  # add upstream patch
  msg "add upstream patch"
  patch -p1 -i "../patch-${pkgver}"

  local src
  for src in "${source[@]}"; do
      src="${src%%::*}"
      src="${src##*/}"
      [[ $src = *.patch ]] || continue
      msg2 "Applying patch: $src..."
      patch -Np1 < "../$src"
  done

  msg2 "0513-bootsplash"
  git apply -p1 < "../0413-bootsplash.gitpatch"

  msg2 "0999-acs"
  patch --ignore-whitespace --fuzz 3 -p1 < "../0999-acs.gitpatch"

  msg2 "add config"
  cat "../config" > ./.config

  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
    sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config
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
  cd "linux-${_basekernel}"

  msg "build"
  make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

package_linux-acs-manjaro() {
  pkgdesc="The Linux Manjaro standart kernel and modules with ACS patch"
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=27')
  optdepends=('wireless-regdb: to set the correct wireless channels of your country')
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE KSMBD-MODULE)

  cd "linux-${_basekernel}"

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
  rm "${pkgdir}"/usr/lib/modules/${_kernver}/{source,build}

  # now we call depmod...
  depmod -b "${pkgdir}/usr" -F System.map "${_kernver}"
}

package_linux-acs-manjaro-headers() {
  pkgdesc="Headers and scripts for building modules for the Linux Manjaro standart kernel with ACS patch"
  depends=('gawk' 'python' 'libelf' 'pahole')

  cd "linux-${_basekernel}"
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
