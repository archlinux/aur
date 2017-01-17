# Maintainer (Arch): Dave Reisner <dreisner@archlinux.org>
# Maintainer (Arch): Tom Gundersen <teg@jklm.no>
# Maintainer: Márcio Silva <coadde@parabola.nu>
# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor: Luke Shumaker <lukeshu@sbcglobal.net>

_pkgbase=systemd
pkgbase=systemd-knock
pkgname=('systemd-knock' 'libsystemd-knock' 'systemd-knock-sysvcompat'
         'libsystemd-knock-standalone' 'libudev-knock' 'nss-knock-myhostname' 'nss-knock-mymachines' 'nss-knock-resolve')
pkgver=232
pkgrel=1
arch=('i686' 'x86_64' 'armv7h')
url="https://www.github.com/systemd/systemd"
makedepends=('acl' 'cryptsetup' 'docbook-xsl' 'gperf' 'lz4' 'xz' 'pam' 'libelf'
             'intltool' 'iptables' 'kmod' 'libcap' 'libidn' 'libgcrypt'
             'libmicrohttpd' 'libxslt' 'util-linux' 'linux-libre-api-headers'
             'python-lxml' 'quota-tools' 'shadow' 'git')
makedepends_i686=('gnu-efi-libs')
makedepends_x86_64=('gnu-efi-libs')
options=('strip')
source=("git://github.com/systemd/systemd.git#tag=v$pkgver"
        #'0001-adds-TCP-Stealth-support-to-systemd.patch::https://gnunet.org/sites/default/files/systemd-knock-patch.diff'
        "https://repo.parabola.nu/other/knock/patches/systemd/0001-adds-TCP-Stealth-support-to-systemd-231.patch"{,.sig}
        "https://repo.parabola.nu/other/systemd/splash-parabola.bmp"{,.sig}
        'initcpio-hook-udev'
        'initcpio-install-systemd'
        'initcpio-install-udev'
        'parabola.conf'
        'loader.conf'
        'systemd-user.pam'
        'systemd-sysusers.hook'
        'systemd-tmpfiles.hook'
        'udev-hwdb.hook'
        '0001-disable-RestrictAddressFamilies-on-i686.patch'
        '0001-Revert-nspawn-try-to-bind-mount-resolved-s-resolv.co.patch'
        '0001-nspawn-don-t-hide-bind-tmp-mounts.patch'
        '0001-FSDG-man-Refer-to-the-operating-system-as-GNU-Linux.patch'
        '0002-FSDG-os-release-Default-to-PRETTY_NAME-GNU-Linux-ins.patch'
        '0003-FSDG-os-release-Default-to-NAME-GNU-Linux-instead-of.patch'
        '0004-FSDG-os-release-Default-ID-to-gnu-linux-instead-of-l.patch'
        '0005-FSDG-systemd-resolved-Default-to-hostname-gnu-linux-.patch'
        '0006-FSDG-man-Use-FSDG-operating-systems-as-examples.patch'
        "https://repo.parabola.nu/other/systemd/splash-parabola.bmp"{,.sig})
sha512sums=('SKIP'
            '67a41a4aa49cc038b3e0d8a53d745de2713e19bd23ae273f6c9f665b6400a3b84ac08a3e38e0515b1b16f45c51367fe4510f0574356a3ecfe5234d464848dc58'
            'SKIP'
            'a50bc85061a9a16d776235099867bc1a17c17dddb74c1ecf5614c849735a9779c5e34e5ddca8ca6af4b59a40f57c08ecf219b98cab09476ddb0f110e6a35e45c'
            'SKIP'
            'f0d933e8c6064ed830dec54049b0a01e27be87203208f6ae982f10fb4eddc7258cb2919d594cbfb9a33e74c3510cfd682f3416ba8e804387ab87d1a217eb4b73'
            '52af734947a768758d5eb3f18e31a1cfec6699eca6fa10e40b90c7f11991509186c0a696e3490af3eaba80064ea4cb93e041579abf05addf072d294300aa4b28'
            'fec639de0d99967ed3e67289eff5ff78fff0c5829d350e73bed536a8391f1daa1d118d72dbdc1f480ffd33fc22b72f4817d0973bd09ec7f182fd26ad87b24355'
            '70b3f1d6aaa9cd4b6b34055a587554770c34194100b17b2ef3aaf4f16f68da0865f6b3ae443b3252d395e80efabd412b763259ffb76c902b60e23b6b522e3cc8'
            '6c6f579644ea2ebb6b46ee274ab15110718b0de40def8c30173ba8480b045d403f2aedd15b50ad9b96453f4ad56920d1350ff76563755bb9a80b10fa7f64f1d9'
            'b90c99d768dc2a4f020ba854edf45ccf1b86a09d2f66e475de21fe589ff7e32c33ef4aa0876d7f1864491488fd7edb2682fc0d68e83a6d4890a0778dc2d6fe19'
            '9d27d97f172a503f5b7044480a0b9ccc0c4ed5dbb2eb3b2b1aa929332c3bcfe38ef0c0310b6566f23b34f9c05b77035221164a7ab7677784c4a54664f12fca22'
            '0f4efddd25256e09c42b953caeee4b93eb49ecc6eaebf02e616b4dcbfdac9860c3d8a3d1a106325b2ebc4dbc6e08ac46702abcb67a06737227ccb052aaa2a067'
            '888ab01bc6e09beb08d7126472c34c9e1aa35ea34e62a09e900ae34c93b1de2fcc988586efd8d0dc962393974f45c77b206d59a86cf53e370f061bf9a1b1a862'
            '89f9b2d3918c679ce4f76c2b10dc7fcb7e04f1925a5f92542f06891de2a123a91df7eb67fd4ce71506a8132f5440b3560b7bb667e1c1813944b115c1dfe35e3f'
            'b993a42c5534582631f7b379d54f6abc37e3aaa56ecf869a6d86ff14ae5a52628f4e447b6a30751bc1c14c30cec63a5c6d0aa268362d235ed477b639cac3a219'
            '68478403433aafc91a03fda5d83813d2ed1dfc6ab7416b2927a803314ecf826edcb6c659587e74df65de3ccb1edf958522f56ff9ac461a1f696b6dede1d4dd35'
            '50888d94636427ca97bfa5355226163fb6458f2a60303967cf74a8fd085f3c450d276b7c556fea93da387c6bb6f5ecbdb6d9b2a571b6723f27a41c8fb612d27b'
            'fc8b874279db428a342387147ef6a849c0621eb0326ad5c4eb12c2ceb98b46477ed1e07c076a8b0abae6b323d4d7f4c70d45998c3338fb89903f51b3f653458b'
            'fd928f5d10a5f95bdbab7720b465cbea8b47cf1a376e1ba292c4759d3f1473c80bd4444729dc5b6f6d884e342db7d07a5dad093d345ccccf2c5fb22dfcdacbd8'
            '723db0e4980727594c88d2fc92ffde10cf7c5cd05fbd88a31dadb813a3c839c3a92b3e5789f936de356b9f5e2d43d67e95fd02627be53ffa46b3d86dfabc4e5b'
            '77161e2f57237ca589d576924ec0877f379047c6fd90ca47cb6686e4f22cc9e2171ae4306bd5a9fd8e707e297b826e0f7df52dcdcb04e99df7ebd0eb45ac89eb'
            'caa5eb7e52b83549bc7d00e343bbb204334b49f2d14005ac1fb592c6f17c6c860edafd88abe619fe54cb0086725385c1f48fd437670a31a08abdac8485ed2073'
            'a50bc85061a9a16d776235099867bc1a17c17dddb74c1ecf5614c849735a9779c5e34e5ddca8ca6af4b59a40f57c08ecf219b98cab09476ddb0f110e6a35e45c'
            'SKIP')
validpgpkeys=(
  '63CDA1E5D3FC22B998D20DD6327F26951A015CC4'  # Lennart Poettering
  '684D54A189305A9CC95446D36B888913DDB59515'  # Márcio Silva
  'C92BAA713B8D53D3CAE63FC9E6974752F9704456'  # André Silva
)

_backports=(
  '843d5baf6aad6c53fc00ea8d95d83209a4f92de1'  # core: don't use the unified hierarchy for the systemd cgroup yet (#4628)
  'abd67ce74858491565cde157c7b08fda43d3279c'  # basic/virt: fix userns check on CONFIG_USER_NS=n kernel (#4651)
  '4318abe8d26e969ebdb97744a63ab900233a0185'  # build-sys: do not install ctrl-alt-del.target symlink twice
  'd112eae7da77899be245ab52aa1747d4675549f1'  # device: Avoid calling unit_free(NULL) in device setup logic (#4748)
  'cfed63f60dd7412c199652825ed172c319b02b3c'  # nspawn: fix exit code for --help and --version (#4609)
  '3099caf2b5bb9498b1d0227c40926435ca81f26f'  # journal: make sure to initially populate the space info cache (#4807)
  '3d4cf7de48a74726694abbaa09f9804b845ff3ba'  # build-sys: check for lz4 in the old and new numbering scheme (#4717)
)

#_validate_tag() {
#  local success fingerprint trusted status tag=v$pkgver
#
#  parse_gpg_statusfile /dev/stdin < <(git verify-tag --raw "$tag" 2>&1)
#
#  if (( ! success )); then
#    error 'failed to validate tag %s\n' "$tag"
#    return 1
#  fi
#
#  if ! in_array "$fingerprint" "${validpgpkeys[@]}" && (( ! trusted )); then
#    error 'unknown or untrusted public key: %s\n' "$fingerprint"
#    return 1
#  fi
#
#  case $status in
#    'expired')
#      warning 'the signature has expired'
#      ;;
#    'expiredkey')
#      warning 'the key has expired'
#      ;;
#  esac
#
#  return 0
#}

prepare() {
  cd "$_pkgbase"

#  _validate_tag || return

  if (( ${#_backports[*]} > 0 )); then
    git cherry-pick -n "${_backports[@]}"
  fi

  # apply FSDG, Knock and another patches
  local patchfile
  for patchfile in "$srcdir"/*.patch; do
    patch -Np1 -i "$patchfile"
  done

  # Rename "Linux Boot Manager" -> "Systemd Boot Manager"
  sed -i 's|Linux Boot Manager|Systemd Boot Manager|' src/boot/bootctl.c

  ./autogen.sh
}

build() {
  cd "$_pkgbase"

  local timeservers=({0..3}.arch.pool.ntp.org)

  if [ "$CARCH" = "armv7h" ]; then
    LDFLAGS+=" -Wl,-fuse-ld=bfd"
    CFLAGS+=" -fno-lto"
    CXXFLAGS+=" -fno-lto"
  fi

  local enable_gnuefi=''
  if [ "$CARCH" != "armv7h" ]; then
    enable_gnuefi='--enable-gnuefi'
  fi

  local configure_options=(
    --libexecdir=/usr/lib
    --localstatedir=/var
    --sysconfdir=/etc

    --enable-lz4
    $enable_gnuefi
    --disable-audit
    --disable-ima
    --enable-tcp-stealth

    --with-sysvinit-path=
    --with-sysvrcnd-path=
    --with-ntp-servers="${timeservers[*]}"
    --with-default-dnssec=no
    --with-dbuspolicydir=/usr/share/dbus-1/system.d
    --without-kill-user-processes
  )

  ./configure "${configure_options[@]}"

  make

  # Go ahead and split the package now.  It's easier this way, because
  # we can use mv instead of awkward, error-prone rm/cp pairs.
  rm -rf "$srcdir/dest"

  # Put things in the main systemd package by default
  make DESTDIR="$srcdir/dest/systemd" install

  install -dm755 "$srcdir/dest/libsystemd"/usr/{lib/pkgconfig,share/man/man3,include}
  mv -T "$srcdir/dest"/{systemd,libsystemd}/usr/include/systemd
  mv -T "$srcdir/dest"/{systemd,libsystemd}/usr/lib/pkgconfig/libsystemd.pc
  mv "$srcdir/dest"/systemd/usr/lib/libsystemd.so*      -t "$srcdir/dest"/libsystemd/usr/lib/
  mv "$srcdir/dest"/systemd/usr/share/man/man3/{SD,sd}* -t "$srcdir/dest"/libsystemd/usr/share/man/man3/

  install -dm755 "$srcdir/dest/libudev"/usr/{lib/pkgconfig,share/man/man3,include}
  mv -T "$srcdir/dest"/{systemd,libudev}/usr/include/libudev.h
  mv -T "$srcdir/dest"/{systemd,libudev}/usr/lib/pkgconfig/libudev.pc
  mv "$srcdir/dest"/systemd/usr/lib/libudev.so*       -t "$srcdir/dest"/libudev/usr/lib/
  mv "$srcdir/dest"/systemd/usr/share/man/man3/*udev* -t "$srcdir/dest"/libudev/usr/share/man/man3/

  local nssmodule
  for nssmodule in myhostname mymachines resolve; do
    install -dm755 "$srcdir/dest/nss-$nssmodule"/usr/{lib,share/man/man8}
    mv -T "$srcdir/dest"/{systemd,nss-$nssmodule}/usr/share/man/man8/nss-$nssmodule.8
    mv "$srcdir/dest"/systemd/usr/lib/libnss_$nssmodule.so* -t "$srcdir/dest"/nss-$nssmodule/usr/lib/
  done

  install -dm755 "$srcdir/dest/systemd-sysvcompat"/usr/share/man/man8
  mv "$srcdir/dest/systemd"/usr/share/man/man8/{telinit,halt,reboot,poweroff,runlevel,shutdown}.8 \
     -t "$srcdir/dest/systemd-sysvcompat"/usr/share/man/man8

  rmdir "$srcdir/dest"/systemd/usr/{share/man/man3,lib/pkgconfig,include}
}

package_systemd-knock() {
  pkgdesc="system and service manager with support for stealth TCP sockets (Parabola rebranded)"
  license=('GPL2' 'LGPL2.1')
  depends=('acl' 'bash' 'dbus' 'iptables' 'kbd' 'kmod' 'hwids' 'libcap'
           'libgcrypt' 'libsystemd-knock' 'libidn' 'lz4' 'pam' 'libelf' 'libseccomp'
           'util-linux' 'xz')
  provides=("systemd-tools=$pkgver" "udev=$pkgver" "systemd=$pkgver")
  replaces=('systemd-tools' 'udev')
  conflicts=('systemd-tools' 'udev' 'systemd')
  optdepends=('cryptsetup: required for encrypted block devices'
              'libmicrohttpd: remote journald capabilities'
              'quota-tools: kernel-level quota management'
              'systemd-knock-sysvcompat: symlink package to provide sysvinit binaries'
              'polkit: allow administration as unprivileged user')
  backup=(etc/pam.d/systemd-user
          etc/systemd/coredump.conf
          etc/systemd/journald.conf
          etc/systemd/journal-remote.conf
          etc/systemd/journal-upload.conf
          etc/systemd/logind.conf
          etc/systemd/system.conf
          etc/systemd/timesyncd.conf
          etc/systemd/resolved.conf
          etc/systemd/user.conf
          etc/udev/udev.conf)
  install="systemd.install"

  cp -rT -d --no-preserve=ownership,timestamp "$srcdir/dest/$_pkgbase" "$pkgdir"

  # don't write units to /etc by default. some of these will be re-enabled on
  # post_install.
  rm -r "$pkgdir/etc/systemd/system/"*.wants

  # get rid of RPM macros
  rm -r "$pkgdir/usr/lib/rpm"

  # add back tmpfiles.d/legacy.conf
  install -m644 "$_pkgbase/tmpfiles.d/legacy.conf" "$pkgdir/usr/lib/tmpfiles.d"

  # Replace dialout/tape/cdrom group in rules with uucp/storage/optical group
  sed -i 's#GROUP="dialout"#GROUP="uucp"#g;
          s#GROUP="tape"#GROUP="storage"#g;
          s#GROUP="cdrom"#GROUP="optical"#g' "$pkgdir"/usr/lib/udev/rules.d/*.rules
  sed -i 's/dialout/uucp/g;
          s/tape/storage/g;
          s/cdrom/optical/g' "$pkgdir"/usr/lib/sysusers.d/basic.conf

  # add mkinitcpio hooks
  install -Dm644 "$srcdir/initcpio-install-systemd" "$pkgdir/usr/lib/initcpio/install/systemd"
  install -Dm644 "$srcdir/initcpio-install-udev" "$pkgdir/usr/lib/initcpio/install/udev"
  install -Dm644 "$srcdir/initcpio-hook-udev" "$pkgdir/usr/lib/initcpio/hooks/udev"

  # ensure proper permissions for /var/log/journal. This is only to placate
  chown root:systemd-journal "$pkgdir/var/log/journal"
  chmod 2755 "$pkgdir/var/log/journal"

  # we'll create this on installation
  rmdir "$pkgdir/var/log/journal/remote"

  # ship default policy to leave services disabled
  echo 'disable *' >"$pkgdir"/usr/lib/systemd/system-preset/99-default.preset

  # add example bootctl configuration
  install -Dm644 "$srcdir/parabola.conf" "$pkgdir"/usr/share/systemd/bootctl/parabola.conf
  install -Dm644 "$srcdir/loader.conf" "$pkgdir"/usr/share/systemd/bootctl/loader.conf
  install -Dm644 "$srcdir/splash-parabola.bmp" "$pkgdir"/usr/share/systemd/bootctl/splash-parabola.bmp

  install -Dm644 "$srcdir/systemd-sysusers.hook" "$pkgdir/usr/share/libalpm/hooks/systemd-sysusers.hook"
  install -Dm644 "$srcdir/systemd-tmpfiles.hook" "$pkgdir/usr/share/libalpm/hooks/systemd-tmpfiles.hook"
  install -Dm644 "$srcdir/udev-hwdb.hook" "$pkgdir/usr/share/libalpm/hooks/udev-hwdb.hook"

  # overwrite the systemd-user PAM configuration with our own
  install -Dm644 systemd-user.pam "$pkgdir/etc/pam.d/systemd-user"
}

package_libsystemd-knock() {
  pkgdesc="systemd client libraries metapackage"
  depends=(libsystemd-knock-standalone libudev-knock nss-knock-myhostname nss-knock-mymachines nss-knock-resolve)
  license=('GPL2')
  provides=("libsystemd=$pkgver")
  conflicts=('libsystemd')
}

package_libsystemd-knock-standalone() {
  pkgdesc="systemd client library"
  depends=('glibc' 'libcap' 'libgcrypt' 'lz4' 'xz')
  license=('GPL2')
  provides=('libsystemd.so' "libsystemd-standalone=$pkgver")
  conflicts=('libsystemd-standalone')

  cp -rT -d --no-preserve=ownership,timestamp "$srcdir/dest/libsystemd" "$pkgdir"
}

package_libudev-knock() {
  pkgdesc="systemd library for enumerating and introspecting local devices"
  depends=('glibc' 'libcap')
  license=('GPL2')
  provides=('libudev.so' "libudev=$pkgver")
  conflicts=('libudev')

  cp -rT -d --no-preserve=ownership,timestamp "$srcdir/dest/${pkgname/-knock/}" "$pkgdir"
}

package_nss-knock-myhostname() {
  pkgdesc="NSS module providing hostname resolution for the locally configured system hostname"
  depends=('glibc' 'libcap')
  license=('GPL2')
  provides=("nss-myhostname=$pkgver")
  conflicts=('nss-myhostname')

  cp -rT -d --no-preserve=ownership,timestamp "$srcdir/dest/${pkgname/-knock/}" "$pkgdir"
}

package_nss-knock-mymachines() {
  pkgdesc="NSS module providing hostname resolution for local systemd-machined container instances"
  depends=('glibc' 'libcap')
  license=('GPL2')
  provides=("nss-mymachines=$pkgver")
  conflicts=('nss-mymachines')

  cp -rT -d --no-preserve=ownership,timestamp "$srcdir/dest/${pkgname/-knock/}" "$pkgdir"
}

package_nss-knock-resolve() {
  pkgdesc="NSS module providing hostname resolution via systemd-resolved"
  depends=('glibc' 'libcap')
  license=('GPL2')
  provides=("nss-resolve=$pkgver")
  conflicts=('nss-resolve')

  cp -rT -d --no-preserve=ownership,timestamp "$srcdir/dest/${pkgname/-knock/}" "$pkgdir"
}

package_systemd-knock-sysvcompat() {
  pkgdesc="sysvinit compat for systemd-knock"
  license=('GPL2')
  provides=("systemd-sysvcompat=$pkgver")
  conflicts=('sysvinit' 'systemd-sysvcompat')
  depends=('systemd-knock')

  cp -rT -d --no-preserve=ownership,timestamp "$srcdir/dest/${pkgname/-knock/}" "$pkgdir"

  install -dm755 "$pkgdir/usr/bin"
  for tool in runlevel reboot shutdown poweroff halt telinit; do
    ln -s 'systemctl' "$pkgdir/usr/bin/$tool"
  done

  ln -s '../lib/systemd/systemd' "$pkgdir/usr/bin/init"
}

# vim: ft=sh syn=sh et
