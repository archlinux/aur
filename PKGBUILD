# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules-dkms
_srcname=openafs
pkgver=1.8.11
pkgrel=3
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
        0006-afs-Remove-afs_MemExtendEntry.patch
        0007-afs-Remove-afs_osi_UnmaskUserLoop.patch
        0008-afs-Remove-dummy_PSetAcl.patch
        0009-afs-Remove-DFlushDCache.patch
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
        0029-Linux-Remove-weak-attribute-for-key_type_keyring.patch
        0030-Linux-Define-afs_thread_wrapper-as-static.patch
        0031-Linux-6.9-file_lock-mbrs-moved-to-file_lock_core.patch
        0032-afs-Reintroduce-and-use-DFlushDCache.patch
        0033-Linux-6.10-Use-filemap_alloc_folio-when-avail.patch
        0034-Linux-6.10-define-a-wrapper-for-vmalloc.patch
        0035-Linux-6.10-remove-includes-for-asm-ia32_unistd.h.patch
        0036-afs-avoid-empty-body-warning.patch
        0037-Linux-6.10-Move-inline-before-func-return-type.patch
        dkms.conf)
sha256sums=('e2efb4710996b7d23198b53c56295a8f9e24e8a555317c5fc63b8125a3714ecd'
            'bc28c144905927fd306a70a8d46dc58e692a73416b3db90ad6bfbeea785ac0e5'
            '1dc202febf207b950301d7b112c7e5c31cfd2cfa05eac196d1697005f27c54ad'
            '2161b35ab4380e04198d0adb77c16a116c6fe5158384c6625b8331f1ac563f13'
            'a8734e000a0a3d74d82ab7478f14d7031f19488250941c4e86e1d741e1da00d2'
            '18de446d64f1b905bbbfe03e70ef0fb9eedc0ac143bf5327d5688d2f4b05e2ad'
            'e6f4168ff634afa6b5d8611c31ae4506081a65adaaabf856bd6105870129e8b9'
            '9932fddfaade09f1af540ff528fb6d8329b3cc700d090e72be845f646070e9de'
            'f428a0ed7651e325adf0f9eb877816b4cc263fdc23e5531d072ff83e6985736d'
            'ddd3cbcaafe10489b278ba5847d1ccf3f2dbfbe73d3019a24e536e42abe82f35'
            '911f587d7b63a1b61c662f3a31602f6d1031451fdd06289b3ebcd97da0659450'
            'ca0b9a57c58bf2d2857a150bfac6ccee3d1f59b21710a82e896001093105ceff'
            '7c5de18f2509b5395d055b860a50aa2c7010a14ba3f8d0ea307a552f65acfe8d'
            '5feefc8d5dba6b0c3840013535ddee08c3f0d7ad632ea41191a5e8745bcd929c'
            '94880dba0ff7bb71fb7fb6a14e7539397e2d582841d70701cb942097827492cd'
            '577f1d37e4595a20032140be55b0e3cbc01bc2d1fcca2150723c3f630fa7752e'
            '12395171f7f6b0e4e1903060d27388765cd225a5ad765bbec059508535136a26'
            '50c25dcae3e18fff5be726a57f2d19fc78f5ddc0df07be9b6046ec1a089083f5'
            'fdf39107969d950c1f993c6ff5bf23d8b99a18ca865719d35326024bf282cbc7'
            '41c99728c5415ac743b88aaf76584d7807f75028d74c4f91a35d3bd2e72bf77a'
            '20860fe94312a7799ca1b656c9a89d55ce83b785f1718b5d67209dd7b3cfa3d4'
            'aec0534ad18b824fb609e2a872bc36a3935e0035a99dca18b14a806e24a22999'
            'ff83e3b29d293cd4ca762372b054a532f8a21d8a00f23c2ebcc5aea1e37bea36'
            'd45895665acd6caa8eeb14bce8d7f092d28423ddf14e215f2331e951ba7af98d'
            'e2846c0d7d94d045463f536f9fa8e34306d9a6f27c0c6ad1f38306af19557909'
            'd812e46c5097de5c5b4e9c495bb5c5ecddcca9e81c49a0c26b5dab68966dcb1a'
            '8d2e5552fc1f47a19615fd5660d3f1bb5505992923c7c67d559aeff76f7b4664'
            '5a6c088dcf0a5510163321ffd6703869101d8a7d6a41eff7eba7b8323e406fcd'
            '8dfbd5d2d834320ffc175502a3d6bd95218835149ef516e8e41c2328b23ffdcf'
            'fe935ff6043345ea37bf2b0fd9d127dfa123561a7508fe144a6581f1c308b507'
            '28c5d17b103a0ec09434b3c5f9fa9fa78a7c011d14806cb6a517b13ceb4b1a59'
            'aeb344cbd9965b4e7e8ddc0f66b18f96df85929e52c0ce6c5b3aee36918d0d8e'
            'ae36f35ac1adabe86b3dfcb774c1a35663871f04b7244a2b69e0052f7aa2d49e'
            '6bd637f13cbab345412b3a863ab6fe5eb1c7f1d6445e12f8dd70adf3f9f2ac1e'
            '23427029b51a3131e14d3d5e1d5c9a74c4aaef7ae47985fb68fecd4d47414abc'
            'fbbd3cc8921369744f961c997009fdc2c5b6f44284696365ba37fed817090656'
            '5873cc01be0cb0e25b5ba5fdebd82abfd1fd560ef944e0d6c2c7ed152a73844a'
            'f14b3e7e7edc4fc434e05f0fd8588b4e2dc2f9fd662cb6a61d0326bdf30dd330'
            '5ea5e184f9b44f5ed45817d2b5a10149d15c8c54f49e0b5b4b773652673cb9b0')

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  # Compatibility with Linux 6.8 and newer + bug fixes
  patch -p1 < "$srcdir"/0001-afs-Make-afs_AllocDCache-static.patch
  patch -p1 < "$srcdir"/0002-LINUX-Minor-osi_vfsop.c-cleanup.patch
  patch -p1 < "$srcdir"/0003-afs-Remove-SRXAFSCB_GetDE.patch
  patch -p1 < "$srcdir"/0004-afs-remove-dead-ICL-fstrace-code.patch
  patch -p1 < "$srcdir"/0005-cf-Add-function-prototypes-for-linux-conftest.patch
  patch -p1 < "$srcdir"/0006-afs-Remove-afs_MemExtendEntry.patch
  patch -p1 < "$srcdir"/0007-afs-Remove-afs_osi_UnmaskUserLoop.patch
  patch -p1 < "$srcdir"/0008-afs-Remove-dummy_PSetAcl.patch
  patch -p1 < "$srcdir"/0009-afs-Remove-DFlushDCache.patch
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
  patch -p1 < "$srcdir"/0029-Linux-Remove-weak-attribute-for-key_type_keyring.patch
  patch -p1 < "$srcdir"/0030-Linux-Define-afs_thread_wrapper-as-static.patch
  patch -p1 < "$srcdir"/0031-Linux-6.9-file_lock-mbrs-moved-to-file_lock_core.patch
  patch -p1 < "$srcdir"/0032-afs-Reintroduce-and-use-DFlushDCache.patch
  patch -p1 < "$srcdir"/0033-Linux-6.10-Use-filemap_alloc_folio-when-avail.patch
  patch -p1 < "$srcdir"/0034-Linux-6.10-define-a-wrapper-for-vmalloc.patch
  patch -p1 < "$srcdir"/0035-Linux-6.10-remove-includes-for-asm-ia32_unistd.h.patch
  patch -p1 < "$srcdir"/0036-afs-avoid-empty-body-warning.patch
  patch -p1 < "$srcdir"/0037-Linux-6.10-Move-inline-before-func-return-type.patch

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
