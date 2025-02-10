# Maintainer: ZeroDegress <zerodegress@outlook.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgbase=linux-zen-flukejones
pkgver=6.13.2.zen1
pkgrel=3
pkgdesc='Linux ZEN with flukejones patch'
url='https://github.com/zen-kernel/zen-kernel'
arch=(x86_64)
license=(GPL-2.0-only)
makedepends=(
  bc
  cpio
  gettext
  libelf
  pahole
  perl
  python
  tar
  xz

  # htmldocs
  graphviz
  imagemagick
  python-sphinx
  python-yaml
  texlive-latexextra
)
options=(
  !debug
  !strip
)
_srcname=linux-${pkgver%.*}
_srctag=v${pkgver%.*}-${pkgver##*.}
source=(
  https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/${_srcname}.tar.{xz,sign}
  $url/releases/download/$_srctag/linux-$_srctag.patch.zst{,.sig}
  config  # the main kernel config file
  # Patches from https://github.com/flukejones/linux
  0001-HID-hid-asus-Disable-OOBE-mode-on-the-ProArt-P16.patch
  0002-hid-add-VID-PID-for-ASUS-ROG-RAIKIRI-PRO.patch
  0003-platform-x86-asus-wmi-Remove-all-ROG-Ally-CSEE-hacks.patch
  0004-platform-x86-asus-wmi-export-symbols-used-for-read-w.patch
  0005-hid-asus-check-ROG-Ally-MCU-version-and-warn.patch
  0006-asus-wmi-disable-mcu_powersave-if-MCU-version-too-lo.patch
  0007-hid-asus-ally-Add-joystick-LED-ring-support.patch
  0008-hid-asus-ally-initial-Ally-X-gamepad.patch
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
  0021-platform-x86-asus-armoury-move-existing-tunings-to-a.patch
  0022-platform-x86-asus-armoury-add-panel_hd_mode-attribut.patch
  0023-platform-x86-asus-armoury-add-apu-mem-control-suppor.patch
  0024-platform-x86-asus-armoury-add-core-count-control.patch
  0025-platform-x86-asus-wmi-deprecate-bios-features.patch
  0026-drm-amd-display-Avoid-divide-by-zero-by-initializing.patch
  0027-platform-x86-asus-armoury-add-the-ppt_-and-nv_-tunin.patch
  0028-asus-wmi-change-quiet-to-low-power.patch
  0029-backport-fix-fw_attr-use.patch
)
validpgpkeys=(
  ABAF11C65A2970B130ABE3C479BE3E4300411886  # Linus Torvalds
  647F28654894E3BD457199BE38DBBDC86092693E  # Greg Kroah-Hartman
  83BC8889351B5DEBBB68416EB8AC08600F108CDF  # Jan Alexander Steffens (heftig)
)
# https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
sha256sums=('cdf62981906bbbe9701aeb73c4f9fcc807a09846c288731663d62717ed1ae705'
            'SKIP'
            '193c1e5eb9529b74f6f921aeabeb81ac52fb9e3a17d230cd9395d998de713187'
            'SKIP'
            '385119ca218f8218fe63cd8dd5566dc0c0f8264cf8fe4268c18de2300f3899b9'
            'ba5800ecd037b6c97492cbfaa93e9bfc4a17739f862988426876dd618e005647'
            '9e1eb9f9567ce5d222124bcd930a39711485954c70106674bd5c4784e7e2aff4'
            '19bec1862cd844e132ab25b2fb89948185e223ef9c58adc7a35723c247c635c5'
            'c754772b09e479a845b5c5e71e813b9b2cc834088720fc8a053d55c1bc1ef2b0'
            '3ad468f49ca722ebfbee4259f4e30da04d1fb082329b8ebadd1fb6bf233c8f93'
            '7b39d2587e6e68c475a1a263b581044ebfdf6df6943c63405453032358b4ca5f'
            '5c2a9e7246e1763d4fbe96db7208462e79a7d5927cf0a16280a89e4221973aed'
            '4f348205dcb535803beb382375948964123a385f2daab612f406f96f53f88455'
            'f3296233cee3877eae2ffe33e4ae1a0f2b58ec0f7a29ac167848a45a939df61e'
            '1f45e081bea9ea2282c412ad404c0bdf5a4bd2352544100ea6810a24aaeb4683'
            'c25fac138c32e64e3f2db7e27a8334c1d98f11e050af96cc85934d1c3a959428'
            'dd7ec8570d2b424831c68be1fa34f95b0f7eba1328a6a8d0d28d1795d8362ac1'
            '7dc2b3c5b798fc5c357315ec87561b6035a302cd5696bf57672310fba3a24e0e'
            '2010dea773db1dc4caf395b40799fd85d09866fb321ca11a4f0491a2c08c169b'
            '8b43d2662691110f7608e348c7bcc8aa191bbe3e24f452173f1f2c61cdb01856'
            '91733754c84971038dd2808b4a047bb896e8cd81bcdca6281972b4d1bcd85879'
            'f17efff5d005b7376dac42e7e68678e143883f84b998e7a97ca8885e03c8ee01'
            '2dde878420d4995560766830765d62d2e5d8cd35f8ea987b9802b3c4edec13ad'
            '360aa24dabbf545035705d87f42d9a8368884fe3275fd3618749a7f2d964b646'
            '04e47d1865ef1ad88a76aaa3043b1f81ef39fa138ce3a6d67f0a80af26168833'
            '316615849b350b04cae1032681c320bba3e8adc97afa349b904b2e298f875c10'
            '36d5eac60bf6569ea4244a5dd874367f0dfd3883c1678122e27643953a9faf27'
            'fcb65e5b4d296eda7d7f7db422a6e3914772017e50f799793dd97477e4f0527e'
            '7da2edd7786220da5c9d3f5e82a254fd7f956804f4153f6bcaee75dca3454230'
            'd197ab4b9ea95f2bb814cb8db183ca13e6eec17ae6652cca8f24879132545b1b'
            '3b3b15cedfc27aee1d38ea20ab003bae7f5bc40e5f6fa589b8497cd785dad2eb'
            '14c8f0ee42628f75d6dfe6ee16a041121a9ff7126b92912c24e7bf209529e4f3'
            '5fc7cb031399a75cc1ee417456ced3bc99b3c3f7b0dc2caf58c86d86783e8dcc'
            '148721017b3a0f5f062e14f0a066c9f2e0b0a2d7d2e1491e40f2475baa381243')
b2sums=('9434dbcb828d49d0b7b68c3ff6651ed227327e8e9a760200fbea91aa37e7949438d253f1a4586da4f72ac1069484e9720b8c8ac3f995d597b33f272065763336'
        'SKIP'
        'b07170a838912e340d634754914899cb89a4a3e0216d757b0e7eeb05b9971b0c64b002118e43d9a455196f7e119ecf6210c15c1cf2b46134b1bdded168c03cc3'
        'SKIP'
        '58008d615ac59a4344e6710b10f122315268413872604e99496cea8edb7895983578810a5c6585a70cab19c8cee196d85b9d8c7d6ed265784a49658445a1301b'
        '5db715a9dcfa25f9227a8c1c776409372515120c151ed19d502faaa9438de4f9f0a43dd34c41634da0481f65b385fd4fe45345e5d288364bfb0f8fc67a7f1d12'
        'c3353fa989213cda0e493be4d152c782f72b5b4c11687c4b972b71f1a23e80a4cb6fef8b218f1d0be0ff6b66d3b34d9de6511f50a63f3c17cac00f0b30ae89b8'
        'e6c99a5242149908ded6e32add9086e0aa9e61c76224f03f34e1b7e8ea5b512230e7dbc6914bfaad5fd02705bfb95ea4ed397effac5c51cc63687c2415931a69'
        'f587dc0a472a0cb9951edf22a4f6f910cff105b4efd7b5290b49d9ebfa48ae31048c8e663e479341f48564f3f7829981f30fc163f60a520e3a25236754ea632e'
        '02145191baedcfbaa2198dccc11aa61b96eb769f8b3ea8dce980cbf98c4744b9abc5b8fee222cff381765009a0fdeb7e5e684f1aea326a180856fbb086699611'
        'fb898999987b4f2ac3dda5fc1f683ffdcb1fac68852e3ff038801a572f939ce8e8b989d422b6ecd33a613f4ebad82d9d1557a1aebdc0dbfcbcaf7cfa43de4e29'
        '107272e92523ae6d26f864b9c3151237a3c0d877f3c48982d999bf408c3b7d8fcbc2c719b3d3d0ab5c0d82dfbe5e5a2848606535801f674ac27e72412b0831bc'
        'a91b3675b0d8effa8a60c3334cd722e55f6f0be48faafc49057b117de4e56475277d740d6aace1b88203f766f937a7ea4eee033fc415fe5e53906973e02ab0d0'
        'b91fec125b03dc9221a06956cbdd2c0428d17fe9e4446c77a676307e2c4ef3a4e264065478f61c80deed86c5fb7d7bacb3d368f949a5d0c912e9a5054d3685aa'
        '4adc5bcaf11603bafa5fd4870cdc8055459b63d1241628b508101fd378fa0b7c0c82481dadb2d493c702e1e69cda8acf43907fa662ea371ee77dadebbfc8fd82'
        '3844644a2dc66c37e20f4fe08d0119d39473c15448bd3af29f26a29edb549a81b5d8e9aa654e741c70ca4d273e87bc78a4f99ad415b75ded459ed642deafb0d2'
        '55bebc144372854ebc72d9048b035bae11692cab1ff02b084dbe92168c25ded123f4c8479dd17df61f7e8228201e35b7a00d284b42edafb6dd89a6318839694f'
        'b2387f7db16ce9804e3a69c3c6b7dc02e5df6dd1ddbe06a9d1eaf995014b2e51aef31de3fe606230a2d2c5bbaaaf5b1eb0df0b68400d3773a51323cccd3b6abb'
        '2f888ece373b5660af6c2cdbfc70e38e8da29e207567aea7b655d8141785d617df2b05fb570990e0d29891151322dbde772fd4a5ccd7f44a341dcc5d7d4b5a97'
        '9378f1eb12747ed1a070dbc6156b25cdb9c9a8e6fd3a303b9c66c5f844c130629fc61588623f3ec24595d63afc17965896e60287493b10c420ecc486574b0a72'
        'f7f688970bbd916ce54017a3bec8ae263fed994fe3396309e7f64a98fd324feced03b70dcbccfef143d0e7c19d32d019a3742cea668faebd301fc56daf879af5'
        'c5cd33911519cdbe85fd8d7813c4317d7ec0df2f9bda20c7bcc8b2464c5f6df691b90233025192adef0568a6b7051ec9284fe69dc3794bdee54d060db539b472'
        '8762ac0ada619c633962acd7d4d2a8e39f22cd879ab0c6097e4992ae57cc6d00b459958916475b16ffca0e8ca3327963a637094e0b3987425605d4df4e117dcd'
        '9397a4d98da909bb2b220714afff5d9986605e767bba5a8e193918fb6311e59c4f1030cd5a1f994d770ed5166b147c6ea93580cc58a1465c121895166f61211f'
        'f81a7e7fa0d72e6ff4795e1d267f69d802079a47979321397b58b66e89195d277f2c105697af8dfc9942afb4c80b4e8577ee3657d26095deb443ebdeb64cb0ba'
        '9e17437593e4fb83b424bd62e052c08daa7c08e683921faad9d9fea7f197a60222145f2b723f1c04489423d19dca33b2278eb3b170d2350ff0752f64af5783a9'
        '2c01369b904e4038fc8e34329b0173176f669bb37bed0d2ca68321a0dffa4e65b11e83503791b62b4a1a73d679ead793798bb2afdb903a40e114595c22d67387'
        '79d16edfc849a993302eba51c9a026db5125823a5ea6a36d90ad8b3639bbc18460b4c20009bf0a4ba295b5e7b51121d517764ff519b0baa199a607b83665f00b'
        '6da2b9aa590cc4f3ad1bf02e349aeb6041e34dae869fe17fbfbadacb77094bb00463414138df04677de5a550adeb4ded4da2b48eb28aa51ee550bb743f3dbb0f'
        '41359902cca1f6e9a2e4d9ce0da8aefd9ccdfd616c1eeb4fe27aad6fcdfe956bf2ea602ea5f272251ad5b2a45a77e7d67f578821c75de27fb7e39f1081880c3a'
        '43ab08997f9444f4b116f1eab4aa17c9eb3e663400cd2deb8b6f0598ce67c94bafb435513ed4b8e5eafd6ccd9b9b8279eca9b352e331b5bdbb35bca21541b03c'
        'abb1eda0ac4cf2fa607f1efe30772ffc0c8f8befcb88051ea45c52e8717427fa6cee1447de57d4220f9c2fb221348f48dc09fee1813deccbc629d6bb27f1a985'
        '68f4ec404b3d35492753bc1fd1d1dc741e61288a6990da26f9b3fb4e577b754c247046a7bc89cc1f5a40e04e51a585a8c3abc8d77c1c5b2439395b45ce383212'
        '02e5de7519a730ba704b2225ce4e944336aa4432ff534e0ce0bc969ac23dd87487aa38816b4f475bbe8baf02d18717a9eb11b11f19f9c4985a135a70b1f514e1')

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

  echo "Setting config..."
  cp ../config .config
  make olddefconfig
  diff -u ../config .config || :

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd $_srcname
  make all
  make -C tools/bpf/bpftool vmlinux.h feature-clang-bpf-co-re=1
  # make htmldocs
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=(
    coreutils
    initramfs
    kmod
  )
  optdepends=(
    'linux-firmware: firmware images needed for some devices'
    'scx-scheds: to use sched-ext schedulers'
    'wireless-regdb: to set the correct wireless channels of your country'
  )
  provides=(
    KSMBD-MODULE
    UKSMD-BUILTIN
    VHBA-MODULE
    VIRTUALBOX-GUEST-MODULES
    WIREGUARD-MODULE
  )
  replaces=(
  )

  cd $_srcname
  local modulesdir="$pkgdir/usr/lib/modules/$(<version)"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  ZSTD_CLEVEL=19 make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
    DEPMOD=/doesnt/exist modules_install  # Suppress depmod

  # remove build link
  rm "$modulesdir"/build
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  depends=(pahole)

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux tools/bpf/bpftool/vmlinux.h
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts
  ln -srt "$builddir" "$builddir/scripts/gdb/vmlinux-gdb.py"

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

pkgname=(
  "$pkgbase"
  "$pkgbase-headers"
  # "$pkgbase-docs"
)
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
