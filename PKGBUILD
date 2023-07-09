# Maintainer: Gunnar Bretthauer <taijian@posteo.de>
# Contributor: Dragonn <dragonn@op.pl>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase=linux-g14
pkgver=6.4.2.arch1
pkgrel=1
pkgdesc='Linux'
_srctag=v${pkgver%.*}-${pkgver##*.}
url="https://gitlab.com/dragonn/linux-g14.git"
arch=(x86_64)
license=(GPL2)
makedepends=(
  bc
  cpio
  gettext
  git
  libelf
  pahole
  perl
  tar
  xz
  python
#  modprobed-db
)
options=('!strip')
_srcname=archlinux-linux

source=(
  "$_srcname::git+https://github.com/archlinux/linux?signed#tag=$_srctag"
  config         # the main kernel config file
#  modprobed.db
  "choose-gcc-optimization.sh"

  "sys-kernel_arch-sources-g14_files-0004-5.17+--more-uarches-for-kernel.patch"::"https://raw.githubusercontent.com/graysky2/kernel_compiler_patch/master/more-uarches-for-kernel-5.17+.patch"

  0001-acpi-proc-idle-skip-dummy-wait.patch

  0001-platform-x86-asus-wmi-Add-safety-checks-to-dgpu-egpu.patch
  
  0027-mt76_-mt7921_-Disable-powersave-features-by-default.patch

  0001-Revert-PCI-Add-a-REBAR-size-quirk-for-Sapphire-RX-56.patch
  0001-constgran-v2.patch
  0001-linux6.1.y-bore2.2.1.patch
  
  0032-Bluetooth-btusb-Add-a-new-PID-VID-0489-e0f6-for-MT7922.patch
  0035-Add_quirk_for_polling_the_KBD_port.patch
  0036-Block_a_rogue_device_on_ASUS_TUF_A16.patch

  0001-ACPI-resource-Skip-IRQ-override-on-ASUS-TUF-Gaming-A.patch
  0001-HID-amd_sfh-Add-support-for-tablet-mode-switch-senso.patch
  0002-ACPI-resource-Skip-IRQ-override-on-ASUS-TUF-Gaming-A.patch
  0003-HID-asus-Add-support-for-ASUS-ROG-Z13-keyboard.patch
  0004-HID-asus-add-keycodes-for-0x6a-0x4b-and-0xc7.patch
  0005-HID-asus-reformat-the-hotkey-mapping-block.patch

  0001-ALSA-hda-realtek-Add-quirk-for-ASUS-ROG-GX650P.patch
  0002-ALSA-hda-realtek-Add-quirk-for-ASUS-ROG-GA402X.patch
  v2-0001-platform-x86-asus-wmi-add-support-for-showing-cha.patch
  v2-0002-platform-x86-asus-wmi-add-support-for-showing-mid.patch
  v2-0003-platform-x86-asus-wmi-support-middle-fan-custom-c.patch
  v2-0004-platform-x86-asus-wmi-add-WMI-method-to-show-if-e.patch
  v2-0005-platform-x86-asus-wmi-don-t-allow-eGPU-switching-.patch
  v2-0006-platform-x86-asus-wmi-add-safety-checks-to-gpu-sw.patch
  v2-0007-platform-x86-asus-wmi-support-setting-mini-LED-mo.patch
  v2-0008-platform-x86-asus-wmi-expose-dGPU-and-CPU-tunable.patch
  v4-0001-platform-x86-asus-wmi-add-support-for-ASUS-screen.patch

  0038-mediatek-pci-reset.patch
  0040-workaround_hardware_decoding_amdgpu.patch
  0041-flush_and_deleyed_gfxoff_on_suspend_amdgpu.patch


  "sys-kernel_arch-sources-g14_files-0047-asus-nb-wmi-Add-tablet_mode_sw-lid-flip.patch"
  "sys-kernel_arch-sources-g14_files-0048-asus-nb-wmi-fix-tablet_mode_sw_int.patch"
  "sys-kernel_arch-sources-g14_files-0049-ALSA-hda-realtek-Add-quirk-for-ASUS-M16-GU603H.patch"
)

validpgpkeys=(
  ABAF11C65A2970B130ABE3C479BE3E4300411886  # Linus Torvalds
  647F28654894E3BD457199BE38DBBDC86092693E  # Greg Kroah-Hartman
  A2FF3A36AAA56654109064AB19802F8B0D70FC30  # Jan Alexander Steffens (heftig)
  C7E7849466FE2358343588377258734B41C31549  # David Runge <dvzrv@archlinux.org>
)

sha256sums=('SKIP'
            'a12c9ba3eba02341a65cf61e3d500f848b7b29b2016803b423867f894f36b7de'
            'bc8b5f303e3507c01d8543fb4352ed7dcdb9ed4eb2854788d39510f88d67f454'
            '81ad663925a0aa5b5332a69bae7227393664bb81ee2e57a283e7f16e9ff75efe'
            '0a7ea482fe20c403788d290826cec42fe395e5a6eab07b88845f8b9a9829998d'
            '172dbc88d0a3cda78387f3c907fa4953c71cb1cb162f0b34f78b8b78924bc3d4'
            'a691e7b22633fe0c458d140167d6d381b66149e05de3cb926b30a19fd43e78ce'
            '7b16fce20b03babc9e149030f43e283534835bbd8835ba0a794fd0205fea1708'
            'efbf65b17fb48fd22f199b6fddd05f159f8ea31faad5543f2c07fddf45eb9f12'
            'd4f8e606eaad9a1fe302f04b9023a3980eb2305108c0d8c90654d23e53ff8bef'
            'a8e1e11a4ab1995cc4975c9b134a43ddfe7054ef0c965e52a7d8f9223e15c3e0'
            '315d1839630b37894a626bbc2aea012618b2e1ccb6f9d8aa27c0a3ce5e90e99c'
            '1740589bbf5eb2c292904e508270ed221e1382f78bcb7cf1c72f1dc12f767e69'
            'a00b952d53df9d3617d93e8fba4146a4d6169ebe79f029b3a55cca68f738d8ea'
            'b5167c85c3869c3e49ced86fe752968feef69a5427ee9d89db433908829fbb7c'
            '4912b1319e46ddd6670147f5e878b4aca8bcfbd7b5c852fe11e434e424666365'
            '655a7650a21ce4f725caf6fa248295edefa25a248aeaecf3d65a058503ae2530'
            '7ce4b001a81b15b5b5275620fc0cee3d251d753698ae3db4593619a2121e1f2e'
            'c7d44e1eb82b4711b4cc86016a1886a573f1abc893dbdd201d4a6d0326859b85'
            '58c46d5d5b3428bd3c9354cf66542ae91323b116dc52826ca5eed2e522b67b0a'
            '06fd2961548a7d3e31bcd388e67d07f9840c74a7811f70810a7ca1f946e59c9e'
            '454dc9b16fd2559843d78a93905a39b1668eaaecb0bf0a9dccf432199f9b96be'
            '5a82899580abaaab4cd818c96407b6be5b2d6b6d1004355eab12fedebdb968a0'
            'a75528877f5db652b4e0b5e68f2ec39557bcad9786c6f6419327d3e08d1fe9be'
            'cbf0738ba984d0fa9ad396ec1e5b2a6ed1e2411dc81b17423fdceef423a484b2'
            '9f98765b43f5f31b33ed05f3611508113b02518e680ee82b251de80dae2e141d'
            '5e58aa605c2ae00c0925e1fbb838a8041e7cf2eb78c0d6167e59dbe27b536565'
            '137f16f59a63568b3546649346ef1bc2211c03da28178a94bf8cd104051f67b8'
            '1983fbb75a4e8c76ffeca51b42dcb3cdcd4a6a5b4aafdb02b3dcbf3c5c9a94ad'
            '2e0274f6681d22f0350bb04cab4bbe796e97c9bb1bd297054eaf900046036d81'
            'd673d034fbcd80426fd8d9c6af56537c5fe5b55fe49d74e313474d7fc285ecc1'
            'e41198b29cee4de7a5132d8df606f48c2d0f9c9076fe4230b00a33c7e0b22c71'
            'e2c81fc2af08c175a7642d4f4f90e398702d9d903857cf0bba81db99f146a561'
            '15e912a66e4bbce1cf0450f1dc6610653df29df8dd6d5426f9c1b039490436c8'
            '444f2d86de8c2177655b01596f939f99c2e7abfa8efad8a509e0a334f42dfa85'
            '982a31e47d3d586789e1b3cdda25f75e3b71d810e7494202089b8f2cef7c0ef9')

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

_make() {
  test -s version
  make KERNELRELEASE="$(<version)" "$@"
}

prepare() {
  cd $_srcname

  echo "Setting version..."
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname
  make defconfig
  make -s kernelrelease > version
  make mrproper

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  # if throw is defined we had a hard patch failure, propagate it and stop so we can address
  [[ -z "$_throw" ]]

  echo "Setting config..."
  cp ../config .config
  _make olddefconfig
  diff -u ../config .config || :
  
  ## Make use of modprobed-db, if installed
  ## To do this, you need to enable copy the database into this directory and enable the relevant lines 
  ## at the top of this file!
  # _make LSMOD=../modprobed.db localmodconfig 

  ## let user choose microarchitecture optimization in GCC  
  ## this needs to run *after* `make olddefconfig` so that our newly added configuration macros exist
  sh ${srcdir}/choose-gcc-optimization.sh $_microarchitecture
 
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

  # HACK: forcibly fixup CONFIG_CMDLINE here as using scripts/config mangles escaped quotes
  sed -i 's#makepkgplaceholderyolo#ibt=off pm_debug_messages amd_pmc.dyndbg=\\"+p\\" acpi.dyndbg=\\"file drivers/acpi/x86/s2idle.c +p\\"#' .config

  # Note the double escaped quotes above, sed strips one; the final result in .config needs to contain single slash
  # escaped quotes (eg: `CONFIG_CMDLINE="foo.dyndbg=\"+p\""`) to avoid dyndbg parse errors at boot. This is impossible
  # with the current kernel config script.


}

build() {
  cd $_srcname
  _make all
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
    linux-rog
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
  install -Dm644 "$(_make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  ZSTD_CLEVEL=19 _make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
    DEPMOD=/doesnt/exist modules_install  # Suppress depmod

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  provides=(linux-rog-headers)
  depends=(pahole)

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # required when STACK_VALIDATION is enabled
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # required when DEBUG_INFO_BTF_MODULES is enabled
  install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

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
