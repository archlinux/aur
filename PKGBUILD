# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase=linux-g14
pkgver=5.14.9.arch1
pkgrel=3
pkgdesc='Linux'
_srctag=v${pkgver%.*}-${pkgver##*.}
url="https://lab.retarded.farm/zappel/asus-rog-zephyrus-g14/"
arch=(x86_64)
license=(GPL2)
makedepends=(
  bc kmod libelf pahole cpio tar xz
  xmlto
  git
  "gcc>=11.0"
)
options=('!strip')
_srcname=archlinux-linux
_fedora_kernel_commit_id=e087e6d70c49c685b4d7cc7364496ade3aed3609
source=(
  "$_srcname::git+https://github.com/archlinux/linux?signed#tag=$_srctag"
  config         # the main kernel config file
  "choose-gcc-optimization.sh"

  "sys-kernel_arch-sources-g14_files-0004-5.8+--more-uarches-for-kernel.patch"::"https://raw.githubusercontent.com/graysky2/kernel_compiler_patch/a8d200f422f4b2abeaa6cfcfa37136b308e6e33e/more-uarches-for-kernel-5.8%2B.patch"
  "sys-kernel_arch-sources-g14_files-0005-lru-multi-generational.patch"
  # mainlined
  #"sys-kernel_arch-sources-g14_files-0006-fix-tigerlake-pin-mapping.patch"
  
  "https://gitlab.com/asus-linux/fedora-kernel/-/archive/$_fedora_kernel_commit_id/fedora-kernel-$_fedora_kernel_commit_id.zip"

  # for now let's just pull the 5 asus-linux patches we need directly and skip all of the git filtering
  "sys-kernel_arch-sources-g14_files-0039-asus-wmi-Add-panel-overdrive-functionality.patch"
  # pull newer version from fedora repo
  #"sys-kernel_arch-sources-g14_files-0040-asus-wmi-Add-dgpu-disable-method.patch"
  #"sys-kernel_arch-sources-g14_files-0041-asus-wmi-Add-egpu-enable-method.patch"
  #"sys-kernel_arch-sources-g14_files-0042-HID-asus-Remove-check-for-same-LED-brightness-on-set.patch"
  "sys-kernel_arch-sources-g14_files-0043-ALSA-hda-realtek-Fix-speakers-not-working-on-Asus-Fl.patch"
  "sys-kernel_arch-sources-g14_files-0044-claymore.patch"
  "sys-kernel_arch-sources-g14_files-0045-v5-asus-wmi-Add-support-for-platform_profile.patch"
  "sys-kernel_arch-sources-g14_files-0046-fan-curvers.patch"
  "sys-kernel_arch-sources-g14_files-0047-asus-nb-wmi-Add-tablet_mode_sw-lid-flip.patch"
  "sys-kernel_arch-sources-g14_files-0048-asus-nb-wmi-fix-tablet_mode_sw_int.patch"

  # k10temp support for Zen3 APUs
  #"sys-kernel_arch-sources-g14_files-8001-x86-amd_nb-Add-AMD-family-19h-model-50h-PCI-ids.patch"
  "sys-kernel_arch-sources-g14_files-8002-hwmon-k10temp-support-Zen3-APUs.patch"


  # mediatek mt7921 bt/wifi patches
  
  "sys-kernel_arch-sources-g14_files-8011-Bluetooth-btusb-Enable-MSFT-extension-for-Mediatek-Chip-MT7921.patch"
  "sys-kernel_arch-sources-g14_files-8012-mt76-mt7915-send-EAPOL-frames-at-lowest-rate.patch"
  "sys-kernel_arch-sources-g14_files-8013-mt76-mt7921-robustify-hardware-initialization-flow.patch"
  "sys-kernel_arch-sources-g14_files-8014-mt76-mt7921-fix-retrying-release-semaphore-without-end.patch"
  "sys-kernel_arch-sources-g14_files-8015-mt76-mt7921-send-EAPOL-frames-at-lowest-rate.patch"
  "sys-kernel_arch-sources-g14_files-8016-mt76-mt7921-Add-mt7922-support.patch"
  "sys-kernel_arch-sources-g14_files-8017-mt76-mt7921-enable-VO-tx-aggregation.patch"
  "sys-kernel_arch-sources-g14_files-8018-mt76-mt7921-fix-dma-hang-in-rmmod.patch"
  "sys-kernel_arch-sources-g14_files-8019-mt76-mt7921-fix-firmware-usage-of-RA-info-using-legacy-rates.patch"
  "sys-kernel_arch-sources-g14_files-8020-mt76-mt7921-Fix-out-of-order-process-by-invalid-even.patch"
  "sys-kernel_arch-sources-g14_files-8021-mt76-mt7921-fix-the-inconsistent-state-between-bind-and-unbind.patch"
  "sys-kernel_arch-sources-g14_files-8022-mt76-mt7921-report-HE-MU-radiotap.patch"
  "sys-kernel_arch-sources-g14_files-8023-v2-mt76-mt7921-fix-kernel-warning-from-cfg80211_calculate_bitrate.patch"
  "sys-kernel_arch-sources-g14_files-8024-mediatek-more-bt-patches.patch"
  
  #"sys-kernel_arch-sources-g14_files-8024-mediatek-19-09-2021-squashed.patch"

  # squashed s0ix enablement through 2021-09-03
  "sys-kernel_arch-sources-g14_files-9001-v5.14.9-s0ix-patch-2021-10-01.patch"
  #"sys-kernel_arch-sources-g14_files-9002-amd-pmc-delay-test.patch"
  # a small amd_pmc SMU debugging patch per Mario Limonciello @AMD
  #"sys-kernel_arch-sources-g14_files-9002-amd-pmc-smu-register-dump-for-diagnostics.patch"
  
  "sys-kernel_arch-sources-g14_files-9004-HID-asus-Reduce-object-size-by-consolidating-calls.patch"
  "sys-kernel_arch-sources-g14_files-9005-acpi-battery-Always-read-fresh-battery-state-on-update.patch"
  
  "sys-kernel_arch-sources-g14_files-9006-amd-c3-entry.patch"
  
  "sys-kernel_arch-sources-g14_files-9007-squashed-net-tcp_bbr-bbr2-for-5.14.y.patch"

  "sys-kernel_arch-sources-g14_files-9008-fix-cpu-hotplug.patch"
  "sys-kernel_arch-sources-g14_files-9009-amd-pstate-sqashed.patch"
  "sys-kernel_arch-sources-g14_files-9010-ACPI-PM-s2idle-Don-t-report-missing-devices-as-faili.patch"
)

validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
  'A2FF3A36AAA56654109064AB19802F8B0D70FC30'  # Jan Alexander Steffens (heftig)
  'C7E7849466FE2358343588377258734B41C31549'  # David Runge
)

sha256sums=('SKIP'
            'aa50b2ec33ce304f9b99ce80555a17ea18b1005dae147a560587acbdae00546f'
            '1ac18cad2578df4a70f9346f7c6fccbb62f042a0ee0594817fdef9f2704904ee'
            'fa6cee9527d8e963d3398085d1862edc509a52e4540baec463edb8a9dd95bee0'
            '69ecf5456468935958f2cbf35691c2533a56344005537902b6051b6323ffff1f'
            '6806c034b7480245a0b9eec448bd79042ff5ff3f9f5efbf2af78227bc56004a8'
            '1ab75535772c63567384eb2ac74753e4d5db2f3317cb265aedf6151b9f18c6c2'
            '32bbcde83406810f41c9ed61206a7596eb43707a912ec9d870fd94f160d247c1'
            'e2d312ea95d18e91801d131a2b5d03cf2175d3088cac6f84a19410078a5b6b14'
            '4ef12029ea73ca924b6397e1de4911e84d9e77ddaccdab1ef579823d848524e8'
            '9d799be6d01a7438ca9999a10137be8fd95348610545c135c6dc9ce2b5afbe29'
            'de8c9747637768c4356c06aa65c3f157c526aa420f21fdd5edd0ed06f720a62e'
            '9f6b8c3ea6e1c285e0a7efda4d743dbae343bc6ee7ad599a4ab7d380c750bc83'
            '4bfbff4eba07fc9de2ce78097a4a269509468ba0e24c15a82905cd94e093ad55'
            'c368cc4eefff20b7ae904eec686b7e72b46ff02b32c8a4fbd6bd4039f087e7ba'
            '1a8639167a1ee1b66f580c0c6f8304e6ef359a68cfa3eb869d9200a9f0234098'
            '021f8539ab2fb722b46937b95fdab22a2308236a24ecc1a9ea8db4853721dd39'
            'a01cf700d79b983807e2285be1b30df6e02db6adfd9c9027fe2dfa8ca5a74bc9'
            '1ce9fd988201c4d2e48794c58acda5b768ec0fea1d29555e99d35cd2712281e4'
            'e7e37c7c433c58e2f5a79e2a7724823bef1dccaa01e857584397b4e3c837d991'
            'f075ac354acfd65dff4db49dc9798747cb9b7a3dd9839987bc46495bdbbd22dc'
            '2163cb2e394a013042a40cd3b00dae788603284b20d71e262995366c5534e480'
            '1770fec49335bc93194e9e55ced49e1cb67f2df4bf6948e80712a0b2ba50fa49'
            '6da4010f86a74125969fd3dbc953da7b45209d33ff3d216474c3399e82e893ff'
            'eb391b6d1ebf7ef99ece00b23609b94180a1f3c0149bcf05f6bbeb74d0b724c7'
            'e88c856444a306b06e82c90677ef797d09bef46957926d046c1cbb4218fb8f52'
            '9f65f64addd66df45d90184ac4ea25c735ceb2dfff1d6d22c73d9f01a3be262a'
            '544464bf0807b324120767d55867f03014a9fda4e1804768ca341be902d7ade4'
            'f7a4bf6293912bfc4a20743e58a5a266be8c4dbe3c1862d196d3a3b45f2f7c90'
            'ee8794a551e33226900654d5c806183bf3b9b2e06f64fdc322987215d233d399'
            '2d854fc70297bb52bbc27dbf35ca019800530e40565be9740704d7f81bc4c763'
            '1cec0be41732a23c709e66d4a67e71bc5a75c77a3e4b73faafb5d7bfd3fafc0f'
            '9025ca0788fbacea25200e6ac17036960000424843f544cdd781052231da7903'
            'e7bd53abc9fddc66790a2e63637b4e2b54ed541f41a2f0fb3aca91ea64ff90dc')

# notable microarch levels:
#
# 14, Zen2
# 15, Zen3
# 38, Skylake (Comet Lake laptops)
# 93, x86-64-v3 (package default)
# 98, Intel Native
# 99, AMD Native
if [ -z ${_microarchitecture+x} ]; then
  _microarchitecture=93
fi

_fedora_kernel_patch_skip_list=(
  # fedora kernel patches to skip
  # use plain file names or bash glob syntax, ** don't quote globs **

  # multi-select and ranges examples
  # 00{03,05,08}-drm-amdgpu*.patch
  # 00{01..12}-drm-amdgpu*.patch
  
  "linux-kernel-test.patch"           # test patch, please ignore
  patch-*-redhat.patch                # wildcard match any redhat patch version
  
  0001-asus-wmi-Add-support-for-platform_profile.patch
  0001-asus-wmi-Add-panel-overdrive-functionality.patch
  0004-HID-asus-Remove-check-for-same-LED-brightness-on-set.patch
  0001-HID-asus-Prevent-Claymore-sending-suspend-event.patch
  0015-PCI-quirks-Quirk-PCI-d3hot-delay-for-AMD-xhci.patch
)

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

_fedora_patch_in_skip_list() {
  for p in "${_fedora_kernel_patch_skip_list[@]}"; do [[ "$1" == $p ]] && return 0; done
  return 1
}

prepare() {
  cd $_srcname

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  #echo '' >.scmversion                        # HACK:  maybe needed
  echo "-$pkgrel" > localversion.99-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  msg2 "Applying asus-linux patches..."
  local p_err=()
  local p_meh=()

  # this will apply only enabled patches from the fedora-linux kernel.spec
  # this stops us from applying broken or in-progress patches that are in git but aren't actually in use

  local _fkernel_path="../fedora-kernel-${_fedora_kernel_commit_id}"
  for src in $(awk -F ' ' '/^ApplyOptionalPatch.*(patch|diff)$/{print $2}' "${_fkernel_path}/kernel.spec"); do
    src="${src##*/}"
    _fedora_patch_in_skip_list "$src" && continue
    echo "Applying patch $src..."
    if OUT="$(patch --forward -Np1 < "${_fkernel_path}/$src")"; then
      : #plain "Applied patch $src..."
    else
      # if you want to ignore a specific patch failure for some reason do it right here, then 'continue'
      if { echo "$OUT" | grep -qiE 'hunk(|s) FAILED'; }; then
        error "Patch failed $src" && echo "$OUT" && p_err+=("$src") && _throw=y
      else
        warning "Duplicate patch $src" && p_meh+=("$src")
      fi
    fi
  done
  (( ${#p_err[@]} > 0 )) && error "Failed patches:" && for p in ${p_err[@]}; do plain "$p"; done
  (( ${#p_meh[@]} > 0 )) && warning "Duplicate patches:" && for p in ${p_meh[@]}; do plain "$p"; done
  # if throw is defined we had a hard patch failure, propagate it and stop so we can address
  [[ -z "$_throw" ]]

  echo "Setting config..."
  cp ../config .config

  make olddefconfig

  # let user choose microarchitecture optimization in GCC
  # this needs to run *after* `make olddefconfig` so that our newly added configuration macros exist
  sh ${srcdir}/choose-gcc-optimization.sh $_microarchitecture

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"

  scripts/config --enable CONFIG_CMDLINE_BOOL \
               --set-str CONFIG_CMDLINE "pm_debug_messages amd_pmc.dyndbg=+p acpi.dyndbg=file drivers/acpi/x86/s2idle.c +p" \
               --disable CMDLINE_OVERRIDE

  scripts/config --enable CONFIG_PINCTRL_AMD
  scripts/config --module CONFIG_X86_AMD_PSTATE
  scripts/config --module CONFIG_AMD_PMC
}

build() {
  cd $_srcname
  make all
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE linux-rog)
  replaces=(virtualbox-guest-modules-arch wireguard-arch)

  cd $_srcname
  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  provides=(linux-rog linux-rog-headers)
  depends=(pahole)

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

  echo "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/x86" -a arch/x86/include
  install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
  install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # http://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # http://bugs.archlinux.org/task/20402
  install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

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
    case "$(file -bi "$file")" in
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
