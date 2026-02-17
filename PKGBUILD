# Maintainer: Alexander Jacocks <alexander@redhat.com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Alex Stelmachonak <mail@ava1ar.me>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Manolis Tzanidakis
# Contributor: Leonid Isaev

pkgname=autofs
pkgver=5.1.9
pkgrel=6
pkgdesc='A kernel-based automounter for Linux'
arch=('x86_64')
url='https://www.kernel.org/pub/linux/daemons/autofs/'
license=('GPL2')
depends=('libxml2')
makedepends=('libldap' 'krb5' 'kmod' 'sssd' 'libnsl' 'rpcsvc-proto' 'systemd')
optdepends=('krb5: for LDAP support'
            'sssd: for SSSD integration')
backup=('etc/autofs/auto.master'
        'etc/autofs/auto.misc'
        'etc/autofs/auto.net'
        'etc/autofs/auto.smb'
        'etc/autofs/autofs.conf'
        'etc/autofs/autofs_ldap_auth.conf'
        'etc/default/autofs')
_mirror='https://mirrors.edge.kernel.org'
_mirrorpath="${_mirror}/pub/linux/daemons/${pkgname}/v5"
source=("${_mirrorpath}/${pkgname}-${pkgver}.tar.xz"
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/autofs-5.1.9.tar.sign
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/patch_order_5.1.9{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-update-configure.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-ldap_parse_page_control-check.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-crash-in-make_options_string.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-Fix-incompatible-function-pointer-types-in-cyrus-sasl-module.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-always-recreate-credential-cache.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-changelog.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-amd-external-mount-error-handling.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-amd-external-mount-mount-handling.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-dont-free-ext-mount-if-mounted.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-refactor-amd-function-do_program_mount.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-refactor-amd-function-umount_amd_ext_mount.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-add-flags-argument-to-amd-do_program_mount.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-amd-cache-options-not-copied.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-seperate-amd-mount-and-entry-flags.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-make-ioctl-ops-timeout-handle-per-dentry-expire.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-refactor-amd-mount-options-handling.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-add-some-unimplemented-amd-map-options.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-get-parent-multi-mount-check-in-try_remount.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-deadlock-in-remount.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-Remove-mentioning-of-nonstrict-option-in-comment.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-Use-AUTOFS_-prefixed-environment-variables.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-man_autofs.conf-fix-manpage-formatting.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-memory-leak-in-cache_release.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-submount-shutdown-race.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-lookup-search-type-in-umount_subtree_mounts.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-remount_active_mount-not-remounting-symlinks.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-log-when-setting-amd-per-mount-timeout.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-update-per-mount-expire-timeout-on-readmap.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.7-clear-per-mount-timeout-if-not-set.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-handle-sss-special-case-getautomntbyname-error.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-deadlock-in-master_notify_submount.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-remove-mounts_mutex-macros.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-lock-not-released-on-error-in-mnts_add_amdmount.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-lock-ordering-deadlock-in-expire_cleanup.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-handling-of-ignored-offsets.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-invalidated-map-entry-handling-in-hosts-module.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-dont-call-mkdir-if-dir-exists.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-check-map-source-in-master_parse_entry.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-possible-memory-leak-in-mnts_get_expire_list.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-uninitialised-list-in-struct-master_mapent.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-tsv-memory-leak-in-set_tsd_user_vars.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-dont-delay-expire.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-make-mnts_has_mounted_mounts-check-submounts.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-string-length-check-in-merge_options.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-dont-initialize-hosts-list-in-add_host.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-initialise-process-variables-in-log_pidinfo.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-incorrect-error-handling-in-sasl_do_kinit_ext_cc.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-off-by-one-error-in-macro_init.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-incorrect-allocation-in-match_key.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-dont-use-alloca-for-nfsoptions.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-type-mismatch-in-mount_autofs_direct.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-multiply-defined-proximity.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-incorrect-call-in-dev_ioctl_requester.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-use-nobind-instead-of-nosymlink.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-make-rmdir_path-more-informative.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-remove-unused-master-map-field.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-error-return-in-do_mount_indirect.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-use-sizeof-for-buffer-length-in-set_log_priority.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-sublink-option-check-length-in-update_with_defaults.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-dont-assume-non-null-tree-node-in-tree_free.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-add-missing-cache_unlock-in-umount_subtree_mounts.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-move-open-close-on-exec-functions-to-autofs-library.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-locking-when-setting-master-map-reading.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-eliminate-master-map-parameter-where-possible.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-refactor-umount_subtree_mounts.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-indirect-expires-count-of-remaining-mounts.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-leak-with-non-strict-mount-fails.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-timed_read-error-return.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-state-queue-not-processing-state-changes.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-refactor-mnts_get_expire_list.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-add-an-extra-logging-entry-to-tree_mapent_mount_offsets.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-quiet-possibly-noisy-log-message.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-devid-update-on-reload.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-cache-writelock-must-be-taken-in-update_map_cache.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-skip-valid-map-entries-on-expire-cleanup.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-remove-unnecessary-call-to-set_direct_mount_tree_catatonic.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-remove-unnecessary-assignment-in-umount_multi.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-direct-mount-trigger-umount-failure-case.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-refactor-do_umount_autofs_direct.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-stale-direct-mount-trigger-not-umounted-on-expire.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-add-function-table_lookup_ino.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-improve-handling-of-missing-map-entry-for-mount-request.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-incorrect-flags-update-in-update_with_defaults.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-skip-expire-check-for-amd-nounmount-mounts.patch{,.sign}
        'libxml-parser.patch')
# gpg key for Ian Kent <raven@themaw.net>, the maintainer of autofs
sha256sums=('87e6af6a03794b9462ea519781e50e7d23b5f7c92cd59e1142c85d2493b3c24b'
            'SKIP'
            '5fd08721e11df5c394fbc7af099ed338f5daa47b6957798776d8abb25c21057b'
            'SKIP'
            'b42ca5d2fa681062c69e90e48860e1077fe9b9d82dc1c84ece0e0a0803419326'
            'SKIP'
            '89e8e0b398afa9df49e7d2f7d38464063eae9b87c4bf13a01dee07c3b251e9cf'
            'SKIP'
            'd437ba38d958a6bc383cf2ed4f397f8f6fcdb22f661bc0e42f140aae26ea2c0c'
            'SKIP'
            '0cf9d836765d3df70994c281278b2f068f15914b03a36c7b897f8fbcd82bd27e'
            'SKIP'
            '6a9a86ad1903843276e8bb6ae0cbe5c20ed25ef7c3147f980501c24b5ffbba01'
            'SKIP'
            'ea63ce377522ee5e1a9792c6deb6deb3f9cba50b6906a3f7517f12570d89125c'
            'SKIP'
            'ff99c00e61e1660533a614f81aa82fb7272a5ca9a188faa4618d9f3f28769714'
            'SKIP'
            '831947144e9a7bb0b8e07a5b275f0b2a5daeed0530649383535189f059d8088a'
            'SKIP'
            '1f9009ff797d7a5b9b7efca1c87378cd984a3958e5531f246069448a660c2a69'
            'SKIP'
            '9b8349c642da92f46ab049f0cd9b36ae137606a56c0f48734e0d7ca60da10d94'
            'SKIP'
            '2ae9900e999b0c169520c3debe0e523dc508b5f46e702702b6f15e9a783b1050'
            'SKIP'
            '24182d4ba5caa811af215a167a26c44e112b25e859d8a2cd78b6a12537e65756'
            'SKIP'
            '74aad250627178e72ce209eb84d49cca4c24d2716e32e0432604388e0812b336'
            'SKIP'
            'a3fabb89b3baf6992fca86e7bd3e454a837d5b1e7f559f1b92fed5e44197c7ed'
            'SKIP'
            '8eb1234737d56e395afad39b37641d24de2646f59dbe4dd80349c2be55227d3e'
            'SKIP'
            '1e73c735e68380fe7036bb4fc2c558f7215e83cb7f81fb8924b96bfd049dbb73'
            'SKIP'
            '502720dae86d9637b1f97a15f859b6e1bf354fd2db6fda008111de651dbec43c'
            'SKIP'
            '12186634015296c62481099f31bb5e926fae3d66d0ee85cdfedf047d43bff8d0'
            'SKIP'
            'cb254d6832e95e2f77b4bcb76e541a2c0a33b68c3dc1735ee7f3bf43df227f6f'
            'SKIP'
            '4d965b25f69b2842b12e0ac52caca1f45eda0c72276d1b5a54e7ce7d9220a02c'
            'SKIP'
            '808960a3271686583e1d92d3c55f06dc52ba8ac14cb95a1b9416b40456f17be2'
            'SKIP'
            '9d2b4e178e2ec38037f95c88dc020274c92091eb9f34cf3bb16092b59fdcdcef'
            'SKIP'
            '6c095d0a64a9e250bef35239ebc9aa65e12d97978762cb3fce5128da35ff1fe6'
            'SKIP'
            '76a32d18a5cd3721fd3a291e4aea55ee2316056adf89d9b95fcf85908b8d7139'
            'SKIP'
            '8b15099f270efe61bcce05b62c999ccb48aa4e7b19ddf92fce35c4c443a9e167'
            'SKIP'
            'f645fe54dc43406d34b551742d01d52738e54704db46ced978214bbd0cbe8144'
            'SKIP'
            'b341799f964cc2b2bf1fdd9f7cccc2d675fa12f03dd0950f05281686dc30c8b9'
            'SKIP'
            '96e705cdd7e742727b216853230a64c050212e272d8c187d68847252b9de6253'
            'SKIP'
            'e7bd732e97244780083f2bc0560d8adfe751747a98e893d407f6505bd7ba7057'
            'SKIP'
            'b71f201993f70550a914865d9d6266c4c5ce0876ab3b81671747a1a7c3fbed15'
            'SKIP'
            'b1aa8040e9a9f028c2c7aaefba6142faee9bbec5406f8a7afb1dd2fc794884ac'
            'SKIP'
            'b630eeae0e0403d82058ec5cb8d736e1774c362c494e2aaed6f61215d59e8309'
            'SKIP'
            '7723f4f8d932338d16caa7a4b1a1281ac7410cf0a7aa465f468ec116c681fa2a'
            'SKIP'
            '22509d4639bda33c4c4e968ff9839b75070572db8d7c47e8dbaea74af4675daa'
            'SKIP'
            'eb440686cadc447f585e66cd213f177dd55a4098370aea423da1e449295b4de5'
            'SKIP'
            '40aebe14090e592b4dc6786fd4bda64065c877848b886f2baed7ef72d061b72f'
            'SKIP'
            'd1ad3aff7ed0475c05a6e78d210c2074594ac174573e9f253ac077c43ae6d6e7'
            'SKIP'
            '7e033fd670ea626d8b5d6566895bebadb7efa272d78a706a5360feb43aa16857'
            'SKIP'
            'ffaa4a34888ebd6825d89cadaad37e98dd7d48ae4cdedd18d78d71ba7dc395ea'
            'SKIP'
            '15665e799bef57c660ffbbcdfef518c20868c2acb31378dc36887497146e4cb4'
            'SKIP'
            'b2c025811aa47252cf50e4daf739c3c936dd821861569e93445c707836ac2bf0'
            'SKIP'
            'b375c8820b00c596f7039b00a3b802fa7c7d9260838b44c14d48f5d64932088f'
            'SKIP'
            '1867305bc108e2f742ca7f945e64e53e753d3cd04fe0d4b75917768799ed3d6a'
            'SKIP'
            'f6b7efcd915bb8ccc6068026c2a23b6fc1b71a278b90ee5bf1944fe0997a22e3'
            'SKIP'
            '50517d665d4d0ae166e658531c29e537efd59f6065f1fb7e5ebcf9612d5ebf18'
            'SKIP'
            '3b935c4cf24d7385ff7906b48ddd141dac269db34968d1fc6b0a455a751c7f5a'
            'SKIP'
            '451b5889fba9f7af5e07f752adc9f08d2e4920bc9d2abc910ff4494bb028bb03'
            'SKIP'
            'c647ce9a982ed32ec748c46fd573901b8984f997aea5503a7ad73c32ad4bc0a9'
            'SKIP'
            'eac9a99b61641c8a6771492abc0188fd4dc107e0a7b43487e170f49f8b4a5604'
            'SKIP'
            'afc274a6d9f14a3630f39b4e46fc59d307d0c8c88ece907a1092f4cbbcdd249d'
            'SKIP'
            'c9a96474eee29bf4bc2a2d47f9ff3a071ab0d3a039411f6efbef03c2d3b4b568'
            'SKIP'
            '186a75017068b63bf23ad85fb83193a64385eb4a5a8b97ea7fb3e7485759abca'
            'SKIP'
            '1afe11a163452f6b9bdf173046148f00f213cca5c977f0695753edc1281ae68f'
            'SKIP'
            '3162d75ce8e41b71770503b8280a72598f49727ddc709467b63da07dfe39e81e'
            'SKIP'
            'ad47bc9f37be201b0edd16848a315adf4c5678c85466f640e82ff2d17b12ef76'
            'SKIP'
            'a7ea38b6829bb3243431a439b48dafaa7d8a1a681be6fd120a4812bdea95a266'
            'SKIP'
            'b9b877bb1dab81d957d14c601609c892e99cf062f56a2ae4ccecf8444fd3d97f'
            'SKIP'
            '8e989f98eb123c9f68b312f7b4402fb493069bd16c9523a62f0268fe8917c7ce'
            'SKIP'
            '91a75d59a0d1dea3f61ea09e2336b4e80a8a4aee5b276e5e73d2a17c8e5458aa'
            'SKIP'
            'a53c78f5cb604ac1f2e1dd98458c3b3dea3f1321bc5832516d4a095457f2fd44'
            'SKIP'
            '937ecfeccb4e4056a489f76eb45ab97a7d03eb73736bd0644d9664cd5b58f05d'
            'SKIP'
            '6b9301e34dda5956f3875ec4d2b156712415984d0e656f980b1028396e169b5b'
            'SKIP'
            '235075aa439e6d39f5f9e32a018219d1ae7d668eb54c3b7247d6a2310cdb4200'
            'SKIP'
            'eebd138da9f695591d3ffe0c0ff31dc5a3d5b3be4a4eb68c207e036a834f9c6b'
            'SKIP'
            '90df3d2683954a18af4e3cc08ddd732c76917d77344c4142a956fedc0f2fd592'
            'SKIP'
            '78a3ef05f05329dc72c095a196980456f9c5aa29ce70e17667962eb11eb84f69'
            'SKIP'
            '9356948220a5e94c48a1d5044931cf49fe54982991c7b64e619b0125d9df7d80'
            'SKIP'
            '8f4a2b8a103e8a54407908652e3486e0643d0926f884c8806d2139e80be49266'
            'SKIP'
            '984f680a1db007b9fb085139378d1ea128269aef06f89882d958d48e113a94c7'
            'SKIP'
            '6348b218a02f6f191d0fbab7582955794e52291d8d96435c46ed334a21ca783b'
            'SKIP'
            'b51955e6b9104a10ab4105a0818bad0f182c90392b6461ba1d5f8c65e1e33e08'
            'SKIP'
            '30c0f732f46c8920562b8659e9a0a25a96f3b7b77f2db08cce35b41a01e87279'
            'SKIP'
            'f70963d13311c2900e5891bef9bfa3243ca7fe3554fbd4a45b43a60a6be4afcf'
            'SKIP'
            '56e983ae899c4a748c64b980ee1c18f01c4c71d461a13683ef1106fe884203fd'
            'SKIP'
            '6031cf398906675ead9a51fa0de926c6fbd762e6fa1f07a60c310a92e0ac85e4'
            'SKIP'
            'd0ed948b00696c4d0bbe4c0a5e6489f2ee9c590000a90a4e44580692d03a700e'
            'SKIP'
            'df55de4e593a7418433cdbce7d44a659d14377fcfebb3dbf54974269eb06913e'
            'SKIP'
            '930988eb83c6857dbb3da662c9d4be6327acb5f9e59b0ad3175522725a009dbe'
            'SKIP'
            'b70e19411fb39d37e05a0e5dbd3acac84f82205c9fc9267ddc183f41e52299d9'
            'SKIP'
            '7340de41bc34e9fe29391150161118f6aacc4bc83e814b0b13dec7d506fc64bb'
            'SKIP'
            'c57957ed53de142f46048b50b1a8ad9b1ac54deb74bb82532fbaea1cf152e2c1'
            'SKIP'
            '4840a4b0b52e38b4e23c29acc877bdc8616cb441593a0c5812b32fdc6f8a257b'
            'SKIP'
            '9a7c1d094d314cbdc58d7f06d0cf8cec45fe9aef34cadcfc95aab3e72b7bb232'
            'SKIP'
            '7b0d504c3756e3fd5f8469087d6847d1e8094823d756b3fc0384e40d805767fa'
            'SKIP'
            '7df5e67262c9064d4b6e6ab68d7350f278ce8d09b3cb56a5030e7c1b0c70bb79')
validpgpkeys=('CD0A6E3CBB6768800B0736A8E7677380F54FD8A9')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  for line in $( cat ../patch_order_5.1.9 ); do
          patch --forward --strip=1 --input=../${line}
  done

  patch -p0 < ../libxml-parser.patch

  sed -i -e 's|/etc/auto.misc|/etc/autofs/auto.misc|' \
         -e 's|/etc/auto.master.d|/etc/autofs/auto.master.d|' samples/auto.master

  sed -i -e "/^#include <linux\/fs.h>$/d" modules/parse_amd.c
  sed -i -e "/^#include <linux\/fs.h>$/d" modules/parse_sun.c
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
        --sysconfdir=/etc/autofs \
        --sbindir=/usr/bin \
        --with-mapdir=/etc/autofs \
        --with-confdir=/etc/default \
        --without-hesiod \
        --enable-ignore-busy \
        --with-libtirpc \
        --with-systemd
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make INSTALLROOT="${pkgdir}" install install_samples

  install -dm755 "$pkgdir/etc/autofs/auto.master.d"
}