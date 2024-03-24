# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules-dkms
_srcname=openafs
pkgver=1.8.11
pkgrel=1
pkgdesc="Kernel module for OpenAFS (dkms)"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=(IPL-1.0)
depends=('dkms' 'libelf' 'openafs')
provides=("openafs-modules=$pkgver")
conflicts=('openafs-features-libafs' 'openafs-modules' 'openafs<1.6.6-2')
options=(!emptydirs)
source=(http://openafs.org/dl/openafs/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2
        0001-afs-Make-afs_AllocDCache-static.patch
        0002-LINUX-Minor-osi_vfsop.c-cleanup.patch
        0003-afs-Remove-SRXAFSCB_GetDE.patch
        0004-afs-remove-dead-ICL-fstrace-code.patch
        0005-cf-Add-function-prototypes-for-linux-conftest.patch
        0006-afs-Remove-DFlushDCache.patch
        0007-afs-Remove-afs_MemExtendEntry.patch
        0008-afs-Remove-afs_osi_UnmaskUserLoop.patch
        0009-afs-Remove-dummy_PSetAcl.patch
        0010-afs-Remove-SRXAFSCB_FetchData-StoreData.patch
        0011-afs-Remove-afs_DbgDisconFiles.patch
        0012-afs-Add-declaration-for-RXAFS_ResidencyCmd.patch
        0013-roken-Declare-ct_memcmp-in-hcrypto-kernel-roken.h.patch
        0014-Linux-6.8-Add-function-prototypes-for-krb5.patch
        0015-afs-Declare-init_hckernel_mutex.patch
        0016-afs-Add-includes-to-pick-up-function-prototypes.patch
        0017-afs-Move-function-prototypes-into-headers.patch
        0018-afs-Add-afs_xioctl-prototyes-to-afs_prototypes.h.patch
        0019-afs-Remove-SRXAFSCB-protos-from-afs_prototypes.h.patch
        0020-rx-Add-function-prototypes-to-rx_prototypes.h.patch
        0021-afs-fix-ops-variable-may-be-used-uninitialized.patch
        0022-afs-Add-static-attribute-to-internal-functions.patch
        0023-rx-Add-static-attribute-to-internal-functions.patch
        0024-rxgen-Declare-generated-PKG_TranslateOpCode.patch
        0025-rxgen-Declare-generated-PKG_OpCodeStats.patch
        0026-Linux-6.8-use-hlist-iteration-for-dentry-children.patch
        0027-Linux-6.8-Remove-ctl_table-sentinels.patch
        0028-Linux-6.8-Use-roken-s-strlcpy-in-kernel-module.patch
        0029-afs-Drop-GLOCK-for-various-Rx-calls.patch
        dkms.conf)
sha256sums=('e2efb4710996b7d23198b53c56295a8f9e24e8a555317c5fc63b8125a3714ecd'
            'e85f5656f76700e4236b1033cf4b7f08c59ab757d52d2a67dcb2c65762388733'
            '8d48b727e77b1e952310ad9f94bd4ece9e64e1f03a35463bb23dffa1009738d8'
            'c44c91e31df1ec77f1a39eb7b172c4e348e41b293ae05606288bfe333ad7c29b'
            '48dd1065f8bcb90d0bdc7ae5b484da5a1a5d93461f6ac1d6ceef103d2b807f22'
            'ce054eadb9c84173b0bd1318ef88cb9500049431779252e501491d9389141bad'
            'ae525167f5f6f7e0301eee70b3424e51e45e56e9fe9588b95cf72d5fa96717b9'
            '974861c174969591351c5fb4a47946e02f979c2b5590f89d9d16dfbe4238451f'
            'e5d72b5e08c63df10299b56bfebf3c5c44e07d16c0436fb2c0eef3614ad505e3'
            '8143496d251dd1f13b8603b4e692fbd67f925caccd12035598e70542d24389f5'
            '216e684f8181adc4a4b3c4ba934997cada10831c5608e724e91d09e836ec626d'
            '2e573535da21f8be5b83c8e82166c0bdc5896293b28e793fa4c1bdb9ff942dbd'
            '0535fbdd3c8431b7b16842f1fa6592355f647ae456112e97d34d541e74204be5'
            '7aacef8bd6832f119472f7d52af36951a56f1e54d36d9bce59998fcf818517e5'
            '3db5177c80a7694c1be3b74f419570a5076edc519b40112cf17e68fecc7574a3'
            '9fe647d54c999e358597fe671dc7e88da609a69bb93624e15919d9b4cc4fdb5a'
            '7ced2ca2d4f54b2fa15c584869de122810ee0d1b024d1bf541f38d77172e311c'
            'c88c8b8e1c993da773eea3ae4f17e5171189ed7e1fc5769fdb49d82cae0cffd3'
            'c57c826c9f26568241bcb17eff04067a1b5e388f72523765aa80d480c3690325'
            'd508dd6136170fcb4794e283178f9c5f4ede12f415b882ba7c13470e8f09bdde'
            '894eb7e7889749cefa9cbf86e2eceda470d20510a5a7a5be2cd851f8570e076c'
            'fb36b0ef833811910cae42d8411a00dcf2aff08c8799f766e32cda3ad5a7f0e2'
            'd08d38ff53890632900de5d69dc105711d5bce2d02a55ffe70c87b38ca39aca7'
            'db700b5f62e979af60856278306e8fce6df21dfb24996dd0d690c82222f4d793'
            '46294f8323bf71ee96c8f765bb36fc5e0af6b2257deac7eaea4f4cb9568d9fe1'
            '5d4a2614065046a32ef805198349e70476d3ed9e079a4ef7577e71e0dac1d2fa'
            '4c8201265f558bac146bf8cee38f8c925b2c2262133ae88d9eb2f0623a0ada07'
            'ceb02a7a5e596434215693f065ad6221f568f85aab173df4752248d2c4d8f971'
            '2b05242c5516871191a251a617c6c02e80f34b92b6cfeb0c9c6a1f3e0ff915d9'
            '82b197ac5f2639d891c8a646963ef6b87ef4171c7a70ac6ca7a9a55511090952'
            '5ea5e184f9b44f5ed45817d2b5a10149d15c8c54f49e0b5b4b773652673cb9b0')

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  # Compatibility with Linux 6.8
  patch -p1 < "$srcdir"/0001-afs-Make-afs_AllocDCache-static.patch
  patch -p1 < "$srcdir"/0002-LINUX-Minor-osi_vfsop.c-cleanup.patch
  patch -p1 < "$srcdir"/0003-afs-Remove-SRXAFSCB_GetDE.patch
  patch -p1 < "$srcdir"/0004-afs-remove-dead-ICL-fstrace-code.patch
  patch -p1 < "$srcdir"/0005-cf-Add-function-prototypes-for-linux-conftest.patch
  patch -p1 < "$srcdir"/0006-afs-Remove-DFlushDCache.patch
  patch -p1 < "$srcdir"/0007-afs-Remove-afs_MemExtendEntry.patch
  patch -p1 < "$srcdir"/0008-afs-Remove-afs_osi_UnmaskUserLoop.patch
  patch -p1 < "$srcdir"/0009-afs-Remove-dummy_PSetAcl.patch
  patch -p1 < "$srcdir"/0010-afs-Remove-SRXAFSCB_FetchData-StoreData.patch
  patch -p1 < "$srcdir"/0011-afs-Remove-afs_DbgDisconFiles.patch
  patch -p1 < "$srcdir"/0012-afs-Add-declaration-for-RXAFS_ResidencyCmd.patch
  patch -p1 < "$srcdir"/0013-roken-Declare-ct_memcmp-in-hcrypto-kernel-roken.h.patch
  patch -p1 < "$srcdir"/0014-Linux-6.8-Add-function-prototypes-for-krb5.patch
  patch -p1 < "$srcdir"/0015-afs-Declare-init_hckernel_mutex.patch
  patch -p1 < "$srcdir"/0016-afs-Add-includes-to-pick-up-function-prototypes.patch
  patch -p1 < "$srcdir"/0017-afs-Move-function-prototypes-into-headers.patch
  patch -p1 < "$srcdir"/0018-afs-Add-afs_xioctl-prototyes-to-afs_prototypes.h.patch
  patch -p1 < "$srcdir"/0019-afs-Remove-SRXAFSCB-protos-from-afs_prototypes.h.patch
  patch -p1 < "$srcdir"/0020-rx-Add-function-prototypes-to-rx_prototypes.h.patch
  patch -p1 < "$srcdir"/0021-afs-fix-ops-variable-may-be-used-uninitialized.patch
  patch -p1 < "$srcdir"/0022-afs-Add-static-attribute-to-internal-functions.patch
  patch -p1 < "$srcdir"/0023-rx-Add-static-attribute-to-internal-functions.patch
  patch -p1 < "$srcdir"/0024-rxgen-Declare-generated-PKG_TranslateOpCode.patch
  patch -p1 < "$srcdir"/0025-rxgen-Declare-generated-PKG_OpCodeStats.patch
  patch -p1 < "$srcdir"/0026-Linux-6.8-use-hlist-iteration-for-dentry-children.patch
  patch -p1 < "$srcdir"/0027-Linux-6.8-Remove-ctl_table-sentinels.patch
  patch -p1 < "$srcdir"/0028-Linux-6.8-Use-roken-s-strlcpy-in-kernel-module.patch
  patch -p1 < "$srcdir"/0029-afs-Drop-GLOCK-for-various-Rx-calls.patch

  # Only needed when changes to configure were made
  ./regen.sh -q
}

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  case "$CARCH" in
    "i686")    sysname=i386_linux26 ;;
    "x86_64")  sysname=amd64_linux26 ;;
    "armv7h")  sysname=arm_linux26 ;;
    *)         error "Unknown architecture '$CARCH'" && false
  esac

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --sbindir=/usr/bin \
              --libexecdir=/usr/lib \
              --disable-fuse-client \
              --disable-kernel-module \
              --without-swig \
              --with-afs-sysname=$sysname

  make only_libafs_tree
}

package() {

  # install license
  install -Dm644 "${srcdir}/${_srcname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # install sources
  install -dm755 "${pkgdir}/usr/src/${_srcname}-${pkgver}"
  mv "${srcdir}/${_srcname}-${pkgver}/libafs_tree/"* "${pkgdir}/usr/src/${_srcname}-${pkgver}"
  sed "s/__VERSION__/$pkgver/" "${srcdir}/dkms.conf" > "${pkgdir}/usr/src/${_srcname}-${pkgver}/dkms.conf"

}
