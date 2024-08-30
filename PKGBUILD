# Maintainer: Gunnar Bretthauer <taijian@posteo.de>
# Contributor: Dragonn <dragonn@op.pl>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase=linux-g14
pkgver=6.10.7.arch1
pkgrel=1
pkgdesc='Linux-g14'
url="https://gitlab.com/dragonn/linux-g14.git"
_url='https://github.com/archlinux/linux'
arch=(x86_64)
license=(GPL-2.0-only)
makedepends=(
  bc
  cpio
  gettext
  git
  libelf
  pahole
  perl
  python
  tar
  xz
#  modprobed-db
)
options=('!strip' '!debug')
_srcname=linux-${pkgver%.*}
_srctag=v${pkgver%.*}-${pkgver##*.}
source=(
  https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/$_srcname.tar.{xz,sign}
  $_url/releases/download/$_srctag/linux-$_srctag.patch.zst{,.sig}
  config         # the main kernel config file
#  modprobed.db

  "choose-gcc-optimization.sh"

  "sys-kernel_arch-sources-g14-6.8+--more-uarches-for-kernel.patch"::"https://raw.githubusercontent.com/graysky2/kernel_compiler_patch/master/more-uarches-for-kernel-6.8-rc4%2B.patch"
  
  0001-acpi-proc-idle-skip-dummy-wait.patch

  0001-platform-x86-asus-wmi-add-debug-print-in-more-key-pl.patch
  0002-platform-x86-asus-wmi-don-t-fail-if-platform_profile.patch
  0003-asus-bios-refactor-existing-tunings-in-to-asus-bios-.patch
  0004-asus-bios-add-panel-hd-control.patch
  0005-asus-bios-add-dgpu-tgp-control.patch
  0006-asus-bios-add-apu-mem.patch
  0007-asus-bios-add-core-count-control.patch
  v2-0001-hid-asus-use-hid-for-brightness-control-on-keyboa.patch
  0003-platform-x86-asus-wmi-add-macros-and-expose-min-max-.patch 
  
  0027-mt76_-mt7921_-Disable-powersave-features-by-default.patch
  
  0032-Bluetooth-btusb-Add-a-new-PID-VID-0489-e0f6-for-MT7922.patch
#  0035-Add_quirk_for_polling_the_KBD_port.patch
  
  0001-ACPI-resource-Skip-IRQ-override-on-ASUS-TUF-Gaming-A.patch
  0002-ACPI-resource-Skip-IRQ-override-on-ASUS-TUF-Gaming-A.patch

  0038-mediatek-pci-reset.patch
  0040-workaround_hardware_decoding_amdgpu.patch

  amd-tablet-sfh.patch

#  "0001-sched-ext.patch"::"https://raw.githubusercontent.com/cachyos/kernel-patches/master/6.10/sched/0001-sched-ext.patch"
  "0001-amd-pstate.patch"::"https://raw.githubusercontent.com/CachyOS/kernel-patches/master/6.10/0001-amd-pstate.patch"

  "sys-kernel_arch-sources-g14_files-0047-asus-nb-wmi-Add-tablet_mode_sw-lid-flip.patch"
  "sys-kernel_arch-sources-g14_files-0048-asus-nb-wmi-fix-tablet_mode_sw_int.patch"
)
validpgpkeys=(
  ABAF11C65A2970B130ABE3C479BE3E4300411886  # Linus Torvalds
  647F28654894E3BD457199BE38DBBDC86092693E  # Greg Kroah-Hartman
  83BC8889351B5DEBBB68416EB8AC08600F108CDF  # Jan Alexander Steffens (heftig)
)

sha256sums=('900d567ff01824708ce24c3b37faaef03e6f6145411dd447a6ff2edc8c5db3a9'
            'SKIP'
            '7d5dd316ef5b87b9159872452c76dfa0ca31486f96a722133beec9e22dd7e65c'
            'SKIP'
            'b9561e722d44c9f2a53865a02afacd861a7e646c2c8b927e0ee0139eec8e8db6'
            '278118011d7a2eeca9971ac97b31bf0c55ab55e99c662ab9ae4717b55819c9a2'
            'f4e7fcd011f2691840d2c8c2361dca850a78ea33cc5c24d2e27c3e0294fd1dc5'
            '0a7ea482fe20c403788d290826cec42fe395e5a6eab07b88845f8b9a9829998d'
            '0ac28bb000cf2eb56f36d028588fd898dd8afa63ba247fcf326496570c2fe87e'
            'f45f61b9e023bf0224d70f76c73c0f667193a9915ba6ae9586046a9c4d73b8a0'
            '9de67962522d07b9babe7c97e4240bb267939c2c6c97bb91d64ed14123f81e3f'
            '9884ce2c34d9520e343dbaf33ef1d053deeb752c12bd595ec5c96a17859131d4'
            'cc7d6594d152b95d3edc82f4a01317881f94dd365b28264805840e33a523b4c6'
            '5b6a2f1ac22c55f43cd7e7b8b79b7ee8a76d58acd74abecc3102b2c32ed15576'
            '6f5325bf096668d25a9bcf7fdd9fc574fc1c16640f2d163c54b87527ed961d83'
            'b7422349428f0476477167f81d9cd9e3692f7ca7345eb6e1f861a0994f9a366e'
            'bf4a555719354bdcc8b0f3665f58b6915494924488b48736cc04d0a11b0fa96c'
            'ed242f4be3f8eaade2a1d42157c5c6c86281917a08ae43221b088fafdc775ee7'
            'a8e1e11a4ab1995cc4975c9b134a43ddfe7054ef0c965e52a7d8f9223e15c3e0'
            'a00b952d53df9d3617d93e8fba4146a4d6169ebe79f029b3a55cca68f738d8ea'
            '4912b1319e46ddd6670147f5e878b4aca8bcfbd7b5c852fe11e434e424666365'
            'd673d034fbcd80426fd8d9c6af56537c5fe5b55fe49d74e313474d7fc285ecc1'
            'e41198b29cee4de7a5132d8df606f48c2d0f9c9076fe4230b00a33c7e0b22c71'
            '508f90cbe81a9a145cc540703470f1e6b5d21c7a7b9166d2ce6e56b401262b04'
            '40b2a00c2f6e0f99c7709198efe67eb92600bdee7768eb70eca96692b747a6fa'
            '15e912a66e4bbce1cf0450f1dc6610653df29df8dd6d5426f9c1b039490436c8'
            '444f2d86de8c2177655b01596f939f99c2e7abfa8efad8a509e0a334f42dfa85')

# notable microarch levels:
#
# 14, Zen2 = CONFIG_MZEN2
# 15, Zen3 = CONFIG_MZEN3
# 38, Skylake (Comet Lake laptops) = CONFIG_MSKYLAKE
# 93, x86-64-v3 (package default) = CONFIG_GENERIC_CPU3
# 98, Intel Native = CONFIG_MNATIVE_INTEL
# 99, AMD Native = CONFIG_MNATIVE_AMD
if [ -z ${_microarchitecture+x} ]; then
  _microarchitecture=93
fi
if [ -z ${Microarchitecture+x} ]; then
  Microarchitecture='CONFIG_GENERIC_CPU3'
fi

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd $_srcname

  echo "Setting version..."
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  # if throw is defined we had a hard patch failure, propagate it and stop so we can address
  [[ -z "$_throw" ]]

  echo "Setting config..."
  cp ../config .config
  make olddefconfig
  diff -u ../config .config || :
  
  ## Make use of modprobed-db, if installed
  ## To do this, you need to copy the database into this directory and enable the relevant lines 
  ## at the top of this file!
  # make LSMOD=../modprobed.db localmodconfig 

  ## let user choose microarchitecture optimization in GCC  
  ## this needs to run *after* `make olddefconfig` so that our newly added configuration macros exist
  sh ${srcdir}/choose-gcc-optimization.sh $_microarchitecture
 
  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
  
  ## Here comes a section where you can uncomment additional modules that you do not need on your machine
  ## in order to speed up building the kernel
  
  ## Enable this, if your systems is ALL AMD
  # scripts/config --disable CONFIG_DRM_I915 \
  #                --disable CONFIG_DRM_GMA500 \
  #                --disable CONFIG_PINCTRL_INTEL \
  #                --disable CONFIG_AGP_INTEL \
  #                --disable CONFIG_INTEL_GTT \
  #                --disable CONFIG_SND_INTEL_NHLT \
  #                --disable CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL \
  #                --disable CONFIG_SND_SOC_INTEL_SST_TOPLEVEL \
  #                --disable CONFIG_SND_SOC_INTEL_MACH \
  #                --disable CONFIG_INTEL_WMI \
  #                --disable CONFIG_INTEL_IOMMU

  scripts/config --enable CONFIG_PINCTRL_AMD
  scripts/config --enable CONFIG_X86_AMD_PSTATE
  scripts/config --module CONFIG_AMD_PMC

  scripts/config --disable CONFIG_MODULE_COMPRESS_NONE \
                 --enable CONFIG_MODULE_COMPRESS_ZSTD

  ## SET default LRU parameters
  scripts/config --enable CONFIG_LRU_GEN
  scripts/config --enable CONFIG_LRU_GEN_ENABLED
  scripts/config --disable CONFIG_LRU_GEN_STATS
  scripts/config --set-val CONFIG_NR_LRU_GENS 7
  scripts/config --set-val CONFIG_TIERS_PER_GEN 4

  # DISABLE not need modules on ROG laptops
  # XXX: I'm going to make an opinionated decision here and save everyone some compilation time
  # XXX: on drivers almost no-one is going to use; if you need any of theese turn them on in myconfig
  scripts/config  --disable CONFIG_INFINIBAND \
                  --disable CONFIG_DRM_NOUVEAU \
                  --disable CONFIG_DRM_RADEON \
                  --disable CONFIG_IIO \
                  --disable CONFIG_CAN_DEV \
                  --disable CONFIG_PCMCIA_WL3501 \
                  --disable CONFIG_PCMCIA_RAYCS \
                  --disable CONFIG_IWL3945 \
                  --disable CONFIG_IWL4965 \
                  --disable CONFIG_IPW2200 \
                  --disable CONFIG_IPW2100 \
                  --disable CONFIG_FB_NVIDIA \
                  --disable CONFIG_SENSORS_ASUS_EC \
                  --disable CONFIG_SENSORS_ASUS_WMI_EC

  # select slightly more sane block device driver options; NVMe really should be built in 
  scripts/config  --disable CONFIG_RAPIDIO \
                  --module CONFIG_CDROM \
                  --disable CONFIG_PARIDE \

  # bake in s0ix debugging parameters so we get useful problem reports re: suspend
  scripts/config  --enable CONFIG_CMDLINE_BOOL \
                  --set-str CONFIG_CMDLINE "makepkgplaceholderyolo" \
                  --disable CMDLINE_OVERRIDE

  # enable back EFI_HANDOVER_PROTOCOL and EFI_STUB
  scripts/config  --enable CONFIG_EFI_HANDOVER_PROTOCOL \
                  --enable CONFIG_EFI_STUB

  # try to fix stuttering on some ROG laptops
  scripts/config --disable CONFIG_HW_RANDOM_TPM

  # enable SCHED_CLASS_EXT
  scripts/config --enable CONFIG_SCHED_CLASS_EXT

  # HACK: forcibly fixup CONFIG_CMDLINE here as using scripts/config mangles escaped quotes
  sed -i 's#makepkgplaceholderyolo#ibt=off pm_debug_messages amd_pmc.dyndbg=\\"+p\\" acpi.dyndbg=\\"file drivers/acpi/x86/s2idle.c +p\\"#' .config

  # Note the double escaped quotes above, sed strips one; the final result in .config needs to contain single slash
  # escaped quotes (eg: `CONFIG_CMDLINE="foo.dyndbg=\"+p\""`) to avoid dyndbg parse errors at boot. This is impossible
  # with the current kernel config script.
}

build() {
  cd $_srcname
  make all
  make -C tools/bpf/bpftool vmlinux.h feature-clang-bpf-co-re=1
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=(
    coreutils
    initramfs
    kmod
  )
  optdepends=(
    'wireless-regdb: to set the correct wireless channels of your country'
    'linux-firmware: firmware images needed for some devices'
  )
  provides=(
    KSMBD-MODULE
    VIRTUALBOX-GUEST-MODULES
    WIREGUARD-MODULE
  )
  replaces=(
    virtualbox-guest-modules-arch
    wireguard-arch
  )

  cd $_srcname
  local modulesdir="$pkgdir/usr/lib/modules/$(<version)"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"
  echo "#!/bin/bash" > ignore_depmod
  chmod +x ignore_depmod
  echo "Installing modules..."
  ZSTD_CLEVEL=19 make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
    DEPMOD=./ignore_depmod modules_install  # Suppress depmod

  # remove build link
  rm "$modulesdir"/build || true
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  provides=(linux-rog-headers)
  depends=(pahole)

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux tools/bpf/bpftool/vmlinux.h
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # required when STACK_VALIDATION is enabled
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # required when DEBUG_INFO_BTF_MODULES is enabled
  install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids

  echo "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/x86" -a arch/x86/include
  install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
  install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # https://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # https://bugs.archlinux.org/task/20402
  install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # https://bugs.archlinux.org/task/71392
  install -Dt "$builddir/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

  echo "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  echo "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    echo "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  echo "Removing documentation..."
  rm -r "$builddir/Documentation"

  echo "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  echo "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  echo "Stripping build tools..."
  local file
  while read -rd '' file; do
    case "$(file -Sib "$file")" in
      application/x-sharedlib\;*)      # Libraries (.so)
        strip -v $STRIP_SHARED "$file" ;;
      application/x-archive\;*)        # Libraries (.a)
        strip -v $STRIP_STATIC "$file" ;;
      application/x-executable\;*)     # Binaries
        strip -v $STRIP_BINARIES "$file" ;;
      application/x-pie-executable\;*) # Relocatable binaries
        strip -v $STRIP_SHARED "$file" ;;
    esac
  done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)

  echo "Stripping vmlinux..."
  strip -v $STRIP_STATIC "$builddir/vmlinux"

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}


pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
