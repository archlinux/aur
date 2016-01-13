# $Id: PKGBUILD 231243 2015-02-10 21:19:58Z lcarlier $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-sisimedia
pkgver=0.9.1
pkgrel=10
pkgdesc="X.org SiS 671 video driver"
arch=(i686 x86_64)
url="http://www.linuxconsulting.ro/xorg-drivers/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=19' 'xf86dgaproto')
conflicts=('xorg-server<1.16' 'X-ABI-VIDEODRV_VERSION<19' 'X-ABI-VIDEODRV_VERSION>=20')
source=(https://sources.archlinux.org/other/xf86-video-sisimedia/xf86-video-sisimedia-0.9.1_20091203.tar.bz2
        xf86-video-sis-0.9.1-20102701.patch
        0002-Remove-XFree86-Misc-PassMessage-support.patch
        0003-Fix-build-with-Werror-format-security.patch
        0005-Fix-backlight-off-on-SiS30x.-video-bridges.patch
        0006-Add-IgnoreHotkeyFlag-driver-option.patch
        xf86-video-sis-0.9.1-dump-regs-after-video-init.patch
        0007-Remove-useless-loader-symbol-lists.patch
        0008-update-to-xextproto-7-1-support.patch
        0009-update-for-rac-removal.patch
        0010-change-to-use-abi-version-check.patch
        0011-more-rac-removal.patch
        0001-Remove-xorgconfig-xorgcfg-from-See-Also-list-in-man-.patch
        0004-Make-sisRegs3D4-big-enough-to-hold-all-values-writte.patch
        0005-Correct-bounds-check-of-blitClip-array-access.patch
        xserver19.patch
        xserver112.patch
        pciTag-removal-workaround.patch
        Untangle-XF86DRI.patch
        swap-func-rename.patch
        xf86MapDomainMemory-pci_device_map_legacy.patch
        sync-with-freedesktop.patch
        fix-xv-crash.patch
        sisimedia-no-xaa.patch
        sisimedia-xorg-1.13.patch
        deprecated-sym2.patch
        disable-UploadToScreen-DownloadFromScreen.patch
        remove_mibstore.h.patch
        COPYING)
sha1sums=('22e6616df49ec82755daae08043a29aaf92fa430'
          '61715bb86180decde55a56fad9a12d841c89fbb2'
          '33fdea57187a2758802bcb9572d3a864aaab4d59'
          '6f05eae535b099b01c2819e63c68d4489b940267'
          'a6cb5da9312d32d729ad2619d8ae50cb26ba7d4d'
          'df728052a89c4152abbe89826756040dac23b624'
          '4bed1c2455ed447f7053cb0729e99cbe598b3274'
          'd7802db5c49540ab136e71450cc846cfccd8b8d1'
          'e2236d2d00338f1658c66d9b972919af39897071'
          '0c6b9322e6cb22c67e04d50a0b818a2dd4585cf2'
          '802829a8ebd2b7e35fcc86665d842b1594a8ba30'
          'c26afe7508183735b7568b435be9c270ceeb62f1'
          'd2fa2a21454f3a161bcd8ae4d349657561049edd'
          '5e288526bfa2c534f1feabdb571da16da8a1c7a6'
          'e86d702cb0b5e9bf43ff732696229965e176db7c'
          'b5f260bed7e705808ec05620316e503ed5d52ee5'
          'ca25df590590284161cd68440fc4f0cfeb8618b2'
          'ce60625b915e8bd82a6ab2c78e52eb589f27a083'
          '963ef59ecd0ca478434623efb68fce9ee832501d'
          '5f686c54383c6677b043c6ca0b565b023c1907f9'
          '4ea8d76b3e74172109e7013a2931e571d3a2f4e1'
          '1d29504466840d2fbe1fc355d78666c1a9cd9b76'
          '1fdd74a2aef9455ac5c37d1fe0146d81aa905d2d'
          '370af234867df98206a98c8cd0a6c89323593f6b'
          '4ea333d659abe2b78f07511467c5356f39bf8695'
          '9bef0b61c0505cc64464073d73684e6933d3f84c'
          'ff95fd41be43560245caa40adc6b481f2dafca7d'
          'e130b4b4cafa0d54426a9b9c4735ad4bf46686f5'
          'a64e244f274bcb155f892d0488a1a4b1b2f7d70d')

prepare() {
  cd "${srcdir}/xf86-video-sis-${pkgver}"
  patch -Np1 -i "${srcdir}/xf86-video-sis-0.9.1-20102701.patch"
  patch -Np1 -i "${srcdir}/0002-Remove-XFree86-Misc-PassMessage-support.patch"
  patch -Np1 -i "${srcdir}/0003-Fix-build-with-Werror-format-security.patch"
  patch -Np1 -i "${srcdir}/0005-Fix-backlight-off-on-SiS30x.-video-bridges.patch"
  patch -Np1 -i "${srcdir}/0006-Add-IgnoreHotkeyFlag-driver-option.patch"
  patch -Np1 -i "${srcdir}/xf86-video-sis-0.9.1-dump-regs-after-video-init.patch"
  patch -Np1 -i "${srcdir}/0007-Remove-useless-loader-symbol-lists.patch"
  patch -Np1 -i "${srcdir}/0008-update-to-xextproto-7-1-support.patch"
  patch -Np1 -i "${srcdir}/0009-update-for-rac-removal.patch"
  patch -Np1 -i "${srcdir}/0010-change-to-use-abi-version-check.patch"
  patch -Np1 -i "${srcdir}/0011-more-rac-removal.patch"
  patch -Np1 -i "${srcdir}/0001-Remove-xorgconfig-xorgcfg-from-See-Also-list-in-man-.patch"
  patch -Np1 -i "${srcdir}/0004-Make-sisRegs3D4-big-enough-to-hold-all-values-writte.patch"
  patch -Np1 -i "${srcdir}/0005-Correct-bounds-check-of-blitClip-array-access.patch"
  patch -Np1 -i "${srcdir}/xserver19.patch"
  patch -Np1 -i "${srcdir}/xserver112.patch"
  patch -Np1 -i "${srcdir}/pciTag-removal-workaround.patch"
  patch -Np1 -i "${srcdir}/Untangle-XF86DRI.patch"
  patch -Np1 -i "${srcdir}/swap-func-rename.patch"
  patch -Np1 -i "${srcdir}/xf86MapDomainMemory-pci_device_map_legacy.patch"
  patch -Np1 -i "${srcdir}/sync-with-freedesktop.patch"
  patch -Np0 -i "${srcdir}/fix-xv-crash.patch"
  patch -Np1 -i "${srcdir}/sisimedia-no-xaa.patch"
  patch -Np1 -i "${srcdir}/sisimedia-xorg-1.13.patch"
  patch -Np1 -i "${srcdir}/remove_mibstore.h.patch"

  patch -Np1 -i "${srcdir}/deprecated-sym2.patch"
  patch -Np1 -i "${srcdir}/disable-UploadToScreen-DownloadFromScreen.patch"

  sed -i -e 's,sis_drv,sisimedia_drv,g' src/Makefile.am
  sed -i -e 's,\"sis\",\"sisimedia\",g' src/sis.h
  sed -i -e 's,sisModuleData,sisimediaModuleData,g' src/sis_driver.c

  sed -i -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.ac

  autoreconf -fi
}

build() {
  cd "${srcdir}/xf86-video-sis-${pkgver}"

  ./configure --prefix=/usr --disable-dri
  make
}

package() {
  cd "${srcdir}/xf86-video-sis-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/share/man"

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
