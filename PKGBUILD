# Maintainer: Luca Stefani <luca.stefani.ge1@gmail.com>

pkgbase=linux-llvm
pkgver=5.8.arch1
pkgrel=1
pkgdesc='Linux'
_srctag=v${pkgver%.*}-${pkgver##*.}
url="https://git.archlinux.org/linux.git/log/?h=$_srctag"
arch=(x86_64)
license=(GPL2)
makedepends=(
  bc kmod libelf pahole
  xmlto python-sphinx python-sphinx_rtd_theme graphviz imagemagick
  git
  clang llvm lld
)
options=('!strip')
_srcname=archlinux-linux
source=(
  "$_srcname::git+https://git.archlinux.org/linux.git#tag=$_srctag"
  config         # the main kernel config file
  sphinx-workaround.patch
  # ZSTD
  0001-lib-prepare-zstd-for-preboot-environment.patch
  0002-lib-add-zstd-support-to-decompress.patch
  0003-init-add-support-for-zstd-compressed-kernel.patch
  0004-usr-add-support-for-zstd-compressed-initramfs.patch
  0005-x86-bump-ZO_z_extra_bytes-margin-for-zstd.patch
  0006-x86-Add-support-for-ZSTD-compressed-kernel.patch
  0007-.gitignore-add-ZSTD-compressed-files.patch
  # LTO
  0001-bitfield.h-don-t-compile-time-validate-_val-in-FIELD.patch
  0002-objtool-use-sh_info-to-find-the-base-for-.rela-secti.patch
  0003-objtool-don-t-autodetect-vmlinux.o.patch
  0004-kbuild-add-support-for-Clang-LTO.patch
  0005-kbuild-lto-fix-module-versioning.patch
  0006-kbuild-lto-fix-recordmcount.patch
  0007-kbuild-lto-postpone-objtool.patch
  0008-kbuild-lto-limit-inlining.patch
  0009-kbuild-lto-merge-module-sections.patch
  0010-kbuild-lto-remove-duplicate-dependencies-from-.mod-f.patch
  0011-init-lto-ensure-initcall-ordering.patch
  0012-init-lto-fix-PREL32-relocations.patch
  0013-PCI-Fix-PREL32-relocations-for-LTO.patch
  0014-modpost-lto-strip-.lto-from-module-names.patch
  0015-scripts-mod-disable-LTO-for-empty.c.patch
  0016-efi-libstub-disable-LTO.patch
  0017-drivers-misc-lkdtm-disable-LTO-for-rodata.o.patch
  0018-arm64-export-CC_USING_PATCHABLE_FUNCTION_ENTRY.patch
  0019-arm64-vdso-disable-LTO.patch
  0020-arm64-allow-LTO_CLANG-and-THINLTO-to-be-selected.patch
  0021-g86-vdso-disable-LTO-only-for-vDSO.patch
  0022-x86-ftrace-disable-recordmcount-for-ftrace_make_nop.patch
  0023-x86-relocs-Ignore-L4_PAGE_OFFSET-relocations.patch
  0024-x86-build-allow-LTO_CLANG-and-THINLTO-to-be-selected.patch
  # CPU
  enable_additional_cpu_optimizations_for_gcc_v10.1+_kernel_v5.8+.patch
)
sha256sums=('SKIP'
            '526c3f2d88be415c16015ce4b36518a60540ed4aedaf2d93b98785733eb822f7'
            '8cb21e0b3411327b627a9dd15b8eb773295a0d2782b1a41b2a8839d1b2f5778c'
            '2f0090ec0c9a72e6241bbea05faaef979405119ce8ef669d84dead36c8e2246e'
            '5f21c12f002e71ec5b5db96832b415ce291a7e230fa07b328c21760274e72e9d'
            '3db0e145f2dc29f2d39779bf053a6999bfaff74929e00ab575f2b6e5a327465c'
            'c95ae6fed77db3e212754a6cb98f02642be1d8d319fe9219ddd7c02b0643b3d1'
            '2b558cc58e95343bb2e3cfd96c668b671251c543124176b8687baf12cdf999d5'
            '84c275eb98fb908b742ffe51faa7feb0312550712b0cd729bf72941a2f633a65'
            'f88df9ee297e229792e516ac9fb6f35ddc1aa13c3fdeb9ba15fb4de8b1dcd7c7'
            '524b329a965f1b983fd4b78e1827854727d4ebb9c21cc9f245bf2ce91c2bed1d'
            '053582c4fa855a9219f45f864d7a03b3a28cfd04ec798b0cc47080c836669184'
            '7e155527495f8a009efc6edc43d44c1775de64c750c9c112f6964d599eada3ef'
            '2ef22d6b576ebf452238ae48658515d5d484b3ab7448b9d62fc1295570bb8f14'
            '9bbda700ef98d75ce24c43f5bf191f77f51d5587ea06ad5c763d9ac10d39c96e'
            '5684845b4c0a516fc907a1f24d420760f2cd2a53ab977fb409a6378f9b1f473e'
            '438c34b332cb3d67e31856f11ed71052974a869f8fd71da637343da7de0c1bf2'
            'efaa62f8d18463141958fdeb495b58c03e49f62ef7bca30e5cd261821bff4ca6'
            'c44e6e4de658ba682cba3b24f766af5bb70572869c8419c0091767726439bfa1'
            '75939f2da39a5644e407aaee060ea00fa6b8e06bf5cc361af793affe5a660243'
            '407e9262ed5cf234172f3048ae79513030589022acba42039ad709f490c6d139'
            'e89ceb6f4cda3fa9ae59c3482b27118df18c98d0a74665d0fe07f05017c1144e'
            'eacb3b5cd7380a48ae50f38c57153a3f90a6dd890b573bf172c0d0585e4f1ab9'
            '7854b55ff44f5ec0a94d295075679aaaf1ff3baf9039bd8a7ea73e4e9ae4f8dd'
            '4668748669f31e3535e02c11f2f4554412d5bd29279ebdbe241f515d7f34aafc'
            '729f41453d3607c6c055ae1f52e476d09a4b49169897fe136ad37a451c7872bb'
            'e3d865689bc4c3ab52b9d0a897278bde415a7cd4892c0e7006ce7998c6e97fe7'
            '4c2bc4f796ef21d1f5cbc7e4a7600a250c66de329819795f77cad3e52106b2fe'
            '85bf687909b628e36ea8a2c973cdd3ef2819f57422d5405cf338abce9037ef9a'
            '0c269cb936eec02fc767f1d4f2ca4436582f5c4f046a3b4c53608d4232a09809'
            '0feb6c229e75c5a4ed532840bbe3ab1426ae255c0897f7852a93537e7661b461'
            'bd3f17cbb1da5293bb54a5bdeaa613098d41fe676ee327ba35867c18732ee80c'
            '539794c1dc9b8e35a73e2e165040f363d0c7f32bc5da415ae6b27a9ffe57dde2'
            '3b956c3768e59f2d5fb0546a855138319eff60e077822667befed734c7ac84af'
            '5ab29eb64e57df83b395a29a6a4f89030d142feffbfbf73b3afc6d97a2a7fd12')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd $_srcname

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  echo "Setting config..."
  cp ../config .config
  make LLVM=1 -j$(nproc) olddefconfig

  make LLVM=1 -j$(nproc) -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd $_srcname
  make LLVM=1 -j$(nproc) all
  make LLVM=1 -j$(nproc) htmldocs
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE)
  replaces=(virtualbox-guest-modules-arch wireguard-arch)

  cd $_srcname
  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make LLVM=1 -j$(nproc) -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  make LLVM=1 -j$(nproc) INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"

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

_package-docs() {
  pkgdesc="Documentation for the $pkgdesc kernel"

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing documentation..."
  local src dst
  while read -rd '' src; do
    dst="${src#Documentation/}"
    dst="$builddir/Documentation/${dst#output/}"
    install -Dm644 "$src" "$dst"
  done < <(find Documentation -name '.*' -prune -o ! -type d -print0)

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/share/doc"
  ln -sr "$builddir/Documentation" "$pkgdir/usr/share/doc/$pkgbase"
}

pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-docs")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
