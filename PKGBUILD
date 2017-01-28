# $Id: PKGBUILD 231243 2015-02-10 21:19:58Z lcarlier $
# Maintainer: Sandor Nagy <sandor.nagy@kdemail.net>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-sisimedia
pkgver=0.9.1
pkgrel=13
pkgdesc="X.org SiS 671 video driver"
arch=('i686' 'x86_64')
url="http://www.linuxconsulting.ro/xorg-drivers/"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=23' 'xf86dgaproto')
conflicts=('xorg-server<1.19' 'X-ABI-VIDEODRV_VERSION<23' 'X-ABI-VIDEODRV_VERSION>=24')
install="${pkgname}.install"
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
        remove_mibstore.h.patch
        deprecated-sym2.patch
        disable-UploadToScreen-DownloadFromScreen.patch
        remove-ImplicitPointerConversions.patch
        xserver117.patch
        xserver119.patch
        COPYING
        "${pkgname}.conf")
md5sums=('daefc4cff89369c8d8cb19e2c0e10392'
         'cc73233a068f43d43d221ae9503d9439'
         'af9ed85941e55c2265e8d1d5ed87a9db'
         'dba2b699bc6de7372e943e1fc9e63cf3'
         '6d71a792a4095729fdc0228f5745b22e'
         '5b7e71398f3d2f97d0d6fac5d3ecef9f'
         '835dd274aab955a31b3f605cc7a1426c'
         'a107f743971a936860be8d58202e91da'
         'bd1a1e0568a3bde61c4eebb2f371506b'
         'be07ee3c3e29c300b9713ca33f52d57e'
         'e27ccc9e3079e11faa25fd8c8ba3e404'
         '58efde36feac99af42800153dbdeb164'
         '3e8a7bdf01ac655fb4b2c702bab102e1'
         'eaa8107f9a829f1effe5f531c9eeb2fa'
         '112c0f36fa12f1ab780a88ba6f821968'
         '928b9c60f4f202cb2f82c7fab378f4f4'
         '2065cef9831b0056487671847297e01b'
         '6d9158cb913c48e766db6e5ed7f69fc2'
         'ecee75ab73a8e0b44c42965b8edd7839'
         'e1aacbb42c06a9cfdba25e02bcdf96ea'
         'ce19f076ea76cfbd64f4f62e4e74649e'
         'b75e481d1ff20516b6cdf9e7e6e51df9'
         '77613b89bdcf7c8ff89e80a3bcafdd41'
         '619b382be2a7a04181d87cfb64c48bb2'
         'a07599fa75e043b9726d38ce5c8699cb'
         '4db75df6299dcdb5f7701637a3aee52f'
         'ed665d7314acd5b58e0b30406438cfc3'
         '724ebdc6548f6098e5be8394defacf9e'
         '03b5e15301df697d2e9775e6b741ff92'
         '3110f169b66bec5120d6875708924337'
         '92fdffbd9b5ff1e4ac30fd73587287a8'
         'cbbdd887d04deb501076c22917e2030d'
         'ea53ab81de92a5dfa155f0160b960ebb')

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

  patch -Np1 -i "${srcdir}/remove-ImplicitPointerConversions.patch"
  patch -Np1 -i "${srcdir}/xserver117.patch"

  patch -Np1 -i "${srcdir}/xserver119.patch"

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

  install -m755 -d "${pkgdir}/etc/X11/xorg.conf.d/"
  install -m644 "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/X11/xorg.conf.d/"
}
