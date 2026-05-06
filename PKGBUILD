# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_netflow='ipt-netflow'
pkgname='ipt_netflow'
pkgver='2.6'
pkgrel='10'
pkgdesc='Netflow as netfilter extension'
arch=('x86_64' 'aarch64')
url="https://github.com/aabc/${_netflow}"
_gitlab_version='d40c76fb1ad8be0168944cae47f62776314c123d'
_gitlab_uri="https://salsa.debian.org/debian/iptables-netflow/-/raw"
_gitlab_url="${_gitlab_uri}/${_gitlab_version}/debian/patches"
license=('GPL')
depends=('linux' 'iptables')
makedepends=('gcc' 'gzip' 'gawk' 'sed')
source=("${url}/archive/v${pkgver}.tar.gz"
	"01.patch::${_gitlab_url}/0001-Fix-compile-for-stable-kernels-by-not-using-ref_modu.patch"
	"02.patch::${_gitlab_url}/0002-Namespace-sk_error_report.patch"
	"03.patch::${_gitlab_url}/0003-Fix-compilation-on-CentOS-8.patch"
	"04.patch::${_gitlab_url}/0004-Better-detection-of-CONFIG_BRIDGE_NETFILTER.patch"
	"05.patch::${_gitlab_url}/0005-Avoid-using-incomplete-compat_def.h.patch"
	"06.patch::${_gitlab_url}/0006-Use-explicit-fallthrough-macro.patch"
	"07.patch::${_gitlab_url}/0007-Fix-build-on-v5.15-ct_event.patch"
	"08.patch::${_gitlab_url}/0008-gen_compat_def-Catch-dereferencing-pointer-to-incomp.patch"
	"09.patch::${_gitlab_url}/0009-Fix-preemptive-enabled-warning.patch"
	"10.patch::${_gitlab_url}/0010-fix-building-on-old-kernels.patch"
	"11.patch::${_gitlab_url}/0011-nat_events-add-expect-callback.patch"
	"12.patch::${_gitlab_url}/0012-compat-Fix-__has_attribute-usage.patch"
	"13.patch::${_gitlab_url}/0013-tcp-options-fix-possible-shift-out-of-bounds.patch"
	"14.patch::${_gitlab_url}/0014-TCP-Option-0-should-participate-in-bitmask-too.patch"
	"15.patch::${_gitlab_url}/0015-Fix-possible-out-of-bounds-read-in-tcp_options-fix.patch"
	"16.patch::${_gitlab_url}/0016-Fix-ipv4-options-parsing-and-bit-numbering.patch"
	"17.patch::${_gitlab_url}/0017-Build-compatibility-with-v6.4-register_sysctl_paths.patch"
	"18.patch::${_gitlab_url}/1001-compat-Really-fix-__has_attribute-usage.patch"
	"19.patch::${_gitlab_url}/1002-fix-detect-modularized-CONFIG_BRIDGE_NETFILTER.patch"
	"20.patch::${_gitlab_url}/1003-fix-backward-compatible-building-with-kernel-5.3.patch"
	"21.patch::${_gitlab_url}/1004-Fix-dkms-status-invocation.patch"
	"22.patch::${_gitlab_url}/1005-Do-not-check-for-dkms-if-called-from-dkms.patch"
	"23.patch::${_gitlab_url}/1006-Set-KDIR-early-if-called-from-dkms-and-get-version-f.patch"
	"24.patch::${_gitlab_url}/1007-dkms.conf-Declare-BUILD_EXCLUSIVE_KERNEL_MIN-3.patch"
	"25.patch::${_gitlab_url}/1008-Fix-module-build-for-Linux-v4.3.patch"
	"26.patch::${_gitlab_url}/1009-Unexporting-find_module-has-been-backported-to-Linux.patch"
	"27.patch::${_gitlab_url}/1010-compat-Linux-6.11-support.patch"
	"28.patch::${_gitlab_url}/1011-Restore-ctl_table-backwards-compatibility.patch"
	"29.patch::${_gitlab_url}/1012-Fix-module-build-for-Linux-v6.12.patch"
	"30.patch::${_gitlab_url}/2001-physindev-has-been-replaced-by-physinif-in-Linux-v6..patch"
	"31.patch::${_gitlab_url}/ignore-unknown-configure-options.patch"
	"32.patch::${_gitlab_url}/properly-pass-CPPFLAGS-and-LDFLAGS.patch"
	"33.patch::${_gitlab_url}/disable-kernel-check.patch"
	"34.patch::${_gitlab_url}/dont-hardcode-current-gcc.patch"
	"35.patch::${_gitlab_url}/cross.patch"
	"36.patch::${_gitlab_url}/use-get_random_u32_below-instead-of-deprecated-prand.patch"
	"37.patch::${_gitlab_url}/replace-strlcpy-by-strscpy.patch"
	"38.patch::${_gitlab_url}/verbose.patch"
	"39.patch::${_gitlab_url}/rename-to-timer_delete_sync-in-Linux-6.15.patch"
# https://salsa.debian.org/debian/iptables-netflow/-/merge_requests/5
	"40.patch::${_gitlab_uri}/ce663ca4d5d73e61fb03b779793bc8cf1b4efbc2/debian/patches/3001-Support_Linux_6.19.patch"
# Fix table when no VLAN
	"41.patch::${url}/pull/247.patch")

sha256sums=('1ae270ddd0e60449159607c2f413604e31cb446beae516777dfeeee5f9b4931d'
            'c6e12dd025aac4d8d21a430ef8c2e3ed1582c27998cbf36cd08427c53b56e5e5'
            '3a883f332b46b96bdd4ada0b4b7c1e3bf57de1341727419f21c176ce0c50f3e6'
            '3f2c09f4dfadf34ae853f2e1b895d8cea65212a997fdda2a463e3ea3a43e5504'
            '6027d5b8c5aceedc6aedb9364864dc0d03c1aa155fc9927d67d7a30e20cb6191'
            '5af18a717637bf02851a74acf9fdcab8f8bbce875fad83be12d6ce2f8ac8cbd4'
            '6842034ba44c0a2b3d2809740a62d5947645c47b27014a68068d5a9b0dde1533'
            '9b832b6f79046743443553cc9e542925c0e1ed806f8b8dd5164ff63aa175639b'
            'eaf2905b019503dc54ddc5b5787ab9e3c865e2fa5cf0457b60176b31276ec438'
            '2a60aa06658656a9605e043f21b56c3b20ee446d8c46c7d1fd5e477b6b8bd9cd'
            'cf23c6a25de0080ecd1ab32471a6b4c2e498497a46d1c26a44f77a2eb4177083'
            '501d857197c1382de7ecd49d8286b4f770ad0809347b8901e46cd47e8f2f87f3'
            '551d7ecbb23c8b9f62f27b071c2cb95c3fcf3b40d0400582dfb849676e897f7e'
            '58bc8b0cb20d206c391fe2e2189767d59c86dae5e6bdda66fc1088754949a18f'
            '81ba158ab14f848779d525b652224546d2b9262ff1a81cf3261a0eb7509b8f99'
            'ca132a0b8df9ca02a435b25ed845bbaa45f7cc8e2686f429b4690945c5e849ca'
            '0700d61ae057229ec4dc734f99caef79fe1604252571ce1abd05866a4ee02530'
            '61991467d953973b3f75eda35a5ab94aa651a4a8bbe47aa2f07b5d4158431e73'
            '25c93acd266eb3171c7734df49fc075b501e34fa902768bba5752533281dcdbd'
            'a73af58d6291d4793aacd2492a5366cd344d041440374d419bebf3f532f9e2b6'
            'fe3d44226bfe4172aee81a58938e949e5ffb49d4f10d56266ae35592cb15b67b'
            '74757d3605c5f1a19636b398d962d4fc2f48ce4014a212602c7dd190c7d5326b'
            'c05666e3f95a575b3c6e0472582eb5446ca11a938587655f8a4c5b07fe081abf'
            'd6f16948361f10adcb464752a8b27594eb3b54c7f84882144e564dbf88c4c3ad'
            '608caa92f13c6863c5b0012d57e93c22ee3482bc54db69fc96a5c4d238377913'
            '7065a5051afe2973d15e5cb3c37adb03016e484ecd480d928f1d5b98d7d2092d'
            '9d23614fb7fd54161c07bec848897585bfdd483bf0e135a653f24bb52bc3df6d'
            '7067ec7a942a28fdb53c87dfd50d1df1134d3b27fdbeb06b6ef22a2ab6690d90'
            '44b7057c0d941af38fa526add8bc946c44347cc3af6440bd1819b4c85ced4339'
            '5c170391989d3eb6b7e1ccab6c41164f4d1de9ccf8457737f188c4eb421de0d6'
            '743649abe183fdc2453754ea673a54be4ec83d771d5432e9015f377041ec5816'
            'c166b210ceeec7a756cffc0e3cac0577848dbfd3a51d950cf63e9b6e85c9b542'
            '72c8ba75d2a4f949c3f537259951f5173b34a8d39db75f55f460128aab96ae39'
            'c6484c8b40af1f32141aab331ad2fbd45b9783e9f0dbe922e5a64a8c789e57b1'
            '2eecaaaccba1ada4f4d39ee688a95b25d3703989c773402f171c38caa00ed5ea'
            '56db356d8a8c05d1aa16e0b3c6191e2c621ac5442e24093c472df87239de620b'
            'f7b6ed18e6b65e0db9b1c5ad7bfcc6eb96c9aafb7a9e852074b8dfe7b39c75e9'
            'a0b546164d44d3d98e5e92d7b088a7e5175108870a5541f34755c93ce411eead'
            '2722fbbf082f6d4ff4e3827ba1c062d57bf5e996d22c7f28d5ac2ba97db143a0'
            '9ece098aee6e3b268dcefed77b20d92bd7bb2c57dcaf7f438e35b21841caa184'
            '59ef3eb171fa4f4fb17ce7434b41aac4830eceb863f04b116510b9d6d3e9653b'
            '10ed391d4df46d55211bf0324b39123fa3f27a347d00e037f35b073935d5047f')
# define '-lts' for linux-lts package
_linux_custom=""
_kdir="`pacman -Ql linux${_linux_custom} | awk '/(\/modules\/)([0-9.-])+-(.*)'${_linux_custom}'\/$/ {print $2}' | head -n1`"
_kver="`pacman -Ql linux${_linux_custom} | gawk 'match($0, /(\/usr\/lib\/modules\/)([0-9\.\-a-z]+)\/$/, a) {print a[2]}'`"

prepare() {
  cd "${_netflow}-${pkgver}"

  for e in "../"*".patch"
    do
    echo "Apply patch: ${e}"
    patch -p1 -i "../${e}"
  done

  ./configure \
    --disable-snmp-agent \
    --disable-dkms \
    --disable-dkms-install \
    --kver=${_kver} \
    --kdir=${_kdir}\build
}

build() {
  cd "${_netflow}-${pkgver}"
  make
}

check() {
  cd "${_netflow}-${pkgver}"
  gzip --best -c "ipt_NETFLOW.ko" > "ipt_NETFLOW.ko.gz"
}

package() {
  cd "${_netflow}-${pkgver}"
  install -Dm0755 "libipt_NETFLOW.so" -t "${pkgdir}/usr/lib/xtables"
  install -Dm0755 "libip6t_NETFLOW.so" -t "${pkgdir}/usr/lib/xtables"
  install -Dm0644 "ipt_NETFLOW.ko.gz" -t "${pkgdir}${_kdir}/extra"
  install -Dm0644 "CREDITS" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 "README" "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm0644 "README.promisc" "${pkgdir}/usr/share/doc/${pkgname}"
}
