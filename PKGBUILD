# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgname=skywire-bin
_pkgname=${pkgname/-bin/}
_githuborg=skycoin
pkgdesc="Skywire: Building a new Internet. Skycoin.com"
pkgver='1.3.88'
pkgrel='1'
_rc=''
#_rc='-pr1'
_pkgver="${pkgver}${_rc}"
_tag_ver="v${_pkgver}"
_pkggopath="github.com/${_githuborg}/${_pkgname}"
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' ) # 'riscv64' )
url="https://${_pkggopath}"
provides=( 'skywire' )
conflicts=( 'skywire' )
optdepends=('redis: required by address-resolver transport-discovery dmsg-discovery service-discovery'
'postgresql: required by transport-discovery route-finder service-discovery'
'jq: config generation for setup-node.service')
license=('license-free')
install=skywire.install
backup=("opt/${_pkgname}/users.db" "opt/${_pkgname}/skywire.json" "opt/${_pkgname}/local")
#_script=("skywire-autoconfig")
_desktop=("skywire.desktop" "skywirevpn.desktop")
_icon=("skywirevpn.png" "skywire.png")
_service=("skywire.service" "skywire-autoconfig.service" "skywire-sn.service" "skywire-ar.service" "skywire-rf.service" "skywire-tpd.service" "skywire-dmsgd.service" "skywire-dmsg.service" "skywire-sd.service" "dmsgpty-tcp.socket" "dmsgpty-tcp@.service")
_userservice=("skywire-user.service")
# sysusers.d / tmpfiles.d declare the _skywire service user and the
# directories it owns. Pacman's systemd hooks run systemd-sysusers
# and systemd-tmpfiles --create when the package lands these files
# under /usr/lib/sysusers.d/ and /usr/lib/tmpfiles.d/. The .install
# postinstall stays minimal as a result — only setcap, conf
# template, and `skywire autoconfig`.
_sysusers=("skywire.sysusers")
_tmpfiles=("skywire.tmpfiles")
# /etc/skywire.conf is intentionally NOT shipped by the package.
# The .install hook generates it on first install only, via
# `skywire cli config gen -pqQ`, and never touches it on upgrade
# so operator edits persist. The 28-line hand-maintained stub
# that used to live here as _etcconf+source has been removed —
# the dynamic template is 276 lines and covers every knob.
_source=("${_desktop[@]}"
"${_icon[@]}"
"${_service[@]}"
"${_userservice[@]}"
"${_sysusers[@]}"
"${_tmpfiles[@]}"
"${_key[@]}")
#"https://raw.githubusercontent.com/skycoin/skywire/develop/dmsghttp-config.json"
#"https://raw.githubusercontent.com/skycoin/skywire/develop/services-config.json")
#"all_servers.json"::"https://dmsgd.skywire.skycoin.com/dmsg-discovery/all_servers")

source=("${_source[@]}")
sha256sums=('40c80ccce9e89ae559050b943be1f09d905476c614a72d74fac2a58c821ac058'
            '00da5a9afdf5a8c7033978d2074039ba1ff7bc7a7221fbd278eb1270bdeb8eae'
            'ec24750a99f5cda8d8a8dc94743943218e1b2088c2b2c7dc1644ee78d954fe7e'
            'a6941680b5858ca3e0c85d9bf5824455a0c95524b61e42352462f2abbb750495'
            '459c78b3a9a6751a0eb9186bf2d509b5485d4ff46f938bbd03ec344ebd0ca6a2'
            '74bf6258bc2453a12c8c778869f4f042368596babaa594dcb3096013a5dc8f32'
            'b2be9ad04aece39759299c2333c51e81bf543fb7a6ee8f52046d499003cadf83'
            '2e0daf72fffbf81e9aa65ba0818195f9d3d43c6eb3f4656f40a4cf2f204aba4a'
            '78e80a8272d3d3fb952e249b88a55514bb419f8f9b0dc3335a9ca1d6ae01c5c5'
            '57740e8fecb39e4e4af2714214cadff6325868cf6846d9a2de4e998d8a0463e2'
            'ea6001f9dea428a6bd877676b42a2c7d6acdd36124eab2ec9d980645a55a115c'
            '0a24b82c6ac7775b541af426912091fecb34ad5cd9e741a8c6de3ac1c0ee3218'
            '03ee60eecd19c5d5260f3ae40f535c20488f045fea2f8d72d76f2778b6470809'
            'a7b8ae8fdd1c0410402cb732a2c5adc5c8dc948f5f8721efa08a77bf1b9216cb'
            '5181895a720e1db40026d970be311b4410f3bc45752f833652844d84c73cb54e'
            '483353f172cb12c8d726dce8e0cd284ff6bf6a69b2912274559bc199b1c7f3e3'
            '60cd97d7ff821f793de68f38aad4468fc83fcddf31449397227d16a746cc8a92'
            '2f1511abbd2b42f4bfebf2a872295de5992fe98d81163ac9ab7744d61608af5e')
sha256sums_i686=('4b5513c6e374bbdc18ab5c4e9d50f331c860d8f62e9415d04c565de2a1ac3f3e')
sha256sums_x86_64=('0f1adb3a80354a70ea2f00455244d197e6fb4a1839e3215f66c28669f5b0d950')
sha256sums_aarch64=('30c966055cb227e576bac290fe4423c28e1f8493037287f6a1cf23b43bd7f7c4')
sha256sums_armv8=('30c966055cb227e576bac290fe4423c28e1f8493037287f6a1cf23b43bd7f7c4')
sha256sums_armv7=('5a4c882fa744c8733c0eb090a9cd2e7735eec1f2b5f77150a37bd0ec938e1a27')
sha256sums_armv7l=('5a4c882fa744c8733c0eb090a9cd2e7735eec1f2b5f77150a37bd0ec938e1a27')
sha256sums_armv7h=('5a4c882fa744c8733c0eb090a9cd2e7735eec1f2b5f77150a37bd0ec938e1a27')
sha256sums_arm=('5f0ce6e6e6e3297c17621dde3dfe90728bbd80bba4d5a5449548aacfdd5d4a3b')
#https://github.com/skycoin/skywire/releases/download/v1.3.32/skywire-v1.3.32-linux-amd64.tar.gz
#https://github.com/skycoin/skywire/releases/download/v1.3.32/skywire-v1.3.32-linux-arm64.tar.gz
#https://github.com/skycoin/skywire/releases/download/v1.3.32/skywire-v1.3.32-linux-armhf.tar.gz
#https://github.com/skycoin/skywire/releases/download/v1.3.32/skywire-v1.3.32-linux-arm.tar.gz
#https://github.com/skycoin/skywire/releases/download/v1.3.32/skywire-v1.3.32-linux-riscv64.tar.gz
#https://github.com/skycoin/skywire/releases/download/v1.3.32/skywire-v1.3.32-linux-386.tar.gz
_binarchive=("${_pkgname}-${_tag_ver}-linux")
_release_url=("${url}/releases/download/${_tag_ver}/${_binarchive}")
source_x86_64=("${_release_url}-amd64.tar.gz")
source_i686=("${_release_url}-386.tar.gz")
source_aarch64=("${_release_url}-arm64.tar.gz")
source_armv8=( "${source_aarch64[@]}" )
source_arm=("${_release_url}-arm.tar.gz")
source_armv7=("${_release_url}-armhf.tar.gz")
source_armv7l=( "${source_armv7[@]}" )
source_armv7h=( "${source_armv7[@]}" )
source_riscv64=( "${_release_url}-riscv64.tar.gz" )

_binaryscript=("skywire-cli" "skywire-visor")
_appscript=("skychat" "skysocks" "skysocks-client" "vpn-client" "vpn-server")

build() {
  _build
}
_build() {
  GOBIN="${srcdir}"
  _GOAPPS="${GOBIN}/apps"
  mkdir -p ${_GOAPPS}
  _msg2 'creating launcher scripts'
  echo -e '#!/bin/bash\nexec /opt/skywire/bin/skywire "$@"' > "${_GOAPPS}/skywire"
  chmod +x ${_GOAPPS}/*
  echo -e '#!/bin/bash\nexec /opt/skywire/bin/skywire cli "$@"' > "${GOBIN}/skywire-cli"
  echo -e '#!/bin/bash\nexec /opt/skywire/bin/skywire visor "$@"' > "${GOBIN}/skywire-visor"
  chmod +x ${GOBIN}/*

}

package() {
GOBIN="${srcdir}"
_GOAPPS="${GOBIN}/apps"
#declare the _pkgdir and systemd directory
_pkgdir="${pkgdir}"
_systemddir="usr/lib/systemd/system"
_skywirebin=""
_package
}
#_package function - used in build variants
_package() {
_dir="opt/skywire"
_apps="${_dir}/apps"
_bin="${_dir}/bin"
_msg2 'creating dirs'
mkdir -p "${_pkgdir}/usr/bin"
#mkdir -p "${_pkgdir}/etc/logrotate.d"
mkdir -p "${_pkgdir}/${_dir}/bin"
mkdir -p "${_pkgdir}/${_dir}/apps"
mkdir -p "${_pkgdir}/${_systemddir}"
_msg2 'installing scripts and binaries'
install -Dm755 "${GOBIN}/skywire" "${_pkgdir}/${_bin}/"
ln -rTsf "${_pkgdir}/${_bin}/skywire" "${_pkgdir}/usr/bin/skywire"
install -Dm755 "${GOBIN}/skywire-cli" "${_pkgdir}/${_bin}/"
ln -rTsf "${_pkgdir}/${_bin}/skywire-cli" "${_pkgdir}/usr/bin/skywire-cli"
install -Dm755 "${GOBIN}/skywire-visor" "${_pkgdir}/${_bin}/"
ln -rTsf "${_pkgdir}/${_bin}/skywire-visor" "${_pkgdir}/usr/bin/skywire-visor"
install -Dm755 "${_GOAPPS}/skywire" "${_pkgdir}/${_apps}/skywire"

#_msg2 'installing dmsghttp-config.json'
#install -Dm644 "${srcdir}/dmsghttp-config.json" "${_pkgdir}/${_dir}/dmsghttp-config.json" || install -Dm644 "${srcdir}/skywire/dmsghttp-config.json" "${_pkgdir}/${_dir}/dmsghttp-config.json"
#_msg2 'installing services-config.json'
#install -Dm644 "${srcdir}/services-config.json" "${_pkgdir}/${_dir}/services-config.json" || install -Dm644 "${srcdir}/skywire/services-config.json" "${_pkgdir}/${_dir}/services-config.json"

_msg2 'Installing systemd services'
for _i in "${_service[@]}" ; do
  _msg3 ${_i}
  install -Dm644 "${srcdir}/${_skywirebin}${_i}" "${_pkgdir}/${_systemddir}/${_i}"
  install -Dm644 "${srcdir}/${_skywirebin}${_i}" "${_pkgdir}/etc/skel/.config/systemd/user/${_i}"
done

# User-mode systemd unit. Renamed on install (drop the -user
# suffix) so the operator runs `systemctl --user start skywire`,
# matching the system-mode `systemctl start skywire` UX. The same
# file overrides the system-unit copy under /etc/skel so newly
# created users get the user-mode unit (multi-user.target doesn't
# exist for user-systemd; the system unit copy installed by the
# loop above wouldn't actually work for them).
_msg3 'skywire-user.service → /usr/lib/systemd/user/skywire.service'
install -Dm644 "${srcdir}/${_skywirebin}skywire-user.service" "${_pkgdir}/usr/lib/systemd/user/skywire.service"
install -Dm644 "${srcdir}/${_skywirebin}skywire-user.service" "${_pkgdir}/etc/skel/.config/systemd/user/skywire.service"

_msg2 'Installing sysusers.d / tmpfiles.d (declarative user + dirs)'
install -Dm644 "${srcdir}/${_skywirebin}skywire.sysusers" "${_pkgdir}/usr/lib/sysusers.d/skywire.conf"
install -Dm644 "${srcdir}/${_skywirebin}skywire.tmpfiles" "${_pkgdir}/usr/lib/tmpfiles.d/skywire.conf"

# /etc/skywire.conf is INTENTIONALLY not shipped by the package.
# The postinst (deb) and post_install (arch) hooks generate it on
# first install via `skywire cli config gen -pqQ /etc/skywire.conf`,
# but only if it's missing — so operator edits survive upgrades
# without a conffile / .pacnew dance. Avoids the cross-arch
# packaging headache too (cc.deb.PKGBUILD used to pre-generate the
# template host-natively and stash it as
# ${srcdir}/skywire.conf.generated to work around the inability to
# exec a foreign-arch binary on the build host).

_msg2 'installing desktop files and icons'
mkdir -p "${_pkgdir}/usr/share/applications/" "${_pkgdir}/usr/share/icons/hicolor/48x48/apps/"
for _i in "${_desktop[@]}" ; do
  _msg3 ${_i}
  install -Dm644 "${srcdir}/${_skywirebin}${_i}" "${_pkgdir}/usr/share/applications/${_i}"
done
for _i in "${_icon[@]}" ; do
  _msg3 ${_i}
  install -Dm644 "${srcdir}/${_skywirebin}${_i}" "${_pkgdir}/usr/share/icons/hicolor/48x48/apps/${_i}"
done
if command -v tree &> /dev/null ; then
_msg2 'package tree'
  tree -a ${_pkgdir}
fi
}

_msg2() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}

_msg3() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  -->${ALL_OFF} ${mesg}${ALL_OFF}\n" "$@"
}

# _gen_deb_scripts writes the canonical postinst.sh / prerm.sh /
# postrm.sh under ${srcdir}/ for deb-package consumption. Shared
# between skywire/deb.PKGBUILD and skywire-bin/cc.deb.PKGBUILD so
# the two deb consumers stay in sync.
#
# Idempotent: safe to call multiple times. Writes the same files
# every time.
#
# Semantics (matches skywire.install on the arch side):
# - postinst: systemd-sysusers + tmpfiles, setcap on the unified
#   binary, then idempotent `skywire autoconfig` (SK-preserving).
# - prerm: case-aware. remove|deconfigure stops+disables;
#   upgrade|failed-upgrade only stops. Never touches /opt/skywire.
# - postrm: case-aware. Only `purge` nukes /opt/skywire + drop-ins.
#   remove keeps state for possible reinstall.
_gen_deb_scripts() {
  cat > "${srcdir}/postinst.sh" <<'POSTINST_EOF'
#!/bin/bash
set -e

# Process the sysusers.d / tmpfiles.d files we shipped, so the
# _skywire user exists and /opt/skywire is owned by them BEFORE
# autoconfig runs and tries to write into the dir. systemd-sysusers
# creates the user; systemd-tmpfiles --create applies the d/Z lines.
if command -v systemd-sysusers >/dev/null 2>&1 ; then
  systemd-sysusers /usr/lib/sysusers.d/skywire.conf 2>/dev/null || true
fi
if command -v systemd-tmpfiles >/dev/null 2>&1 ; then
  systemd-tmpfiles --create /usr/lib/tmpfiles.d/skywire.conf 2>/dev/null || true
fi

# File caps for VPN apps + low-port hypervisor binds. Survives
# User= changes; required for the user-mode unit (which can't be
# granted ambient caps).
if command -v setcap >/dev/null 2>&1 ; then
  setcap 'cap_net_admin,cap_net_bind_service+eip' /opt/skywire/bin/skywire 2>/dev/null || true
fi

# Generate the canonical /etc/skywire.conf template ONLY if it's
# missing. Operator edits (SK, HYPERVISORPKS, SKYWIRE_USER, etc.)
# are preserved by default across upgrades because the package no
# longer ships the file — there's nothing for dpkg to overwrite.
[[ ! -f /etc/skywire.conf ]] && skywire cli config gen -pqQ /etc/skywire.conf

skywire autoconfig

# On upgrade, restart every package-shipped service that's
# currently active. try-restart is a noop on inactive units, so
# operators who haven't enabled every shipped unit don't see
# spurious starts. autoconfig already touched skywire.service via
# its restart-if-active path; try-restart on a just-restarted
# service is harmless.
for _unit in skywire.service skywire-autoconfig.service \
             skywire-sn.service skywire-ar.service \
             skywire-rf.service skywire-tpd.service \
             skywire-dmsgd.service skywire-dmsg.service \
             skywire-sd.service dmsgpty-tcp.socket ; do
    systemctl try-restart "$_unit" 2>/dev/null || true
done
POSTINST_EOF

  cat > "${srcdir}/prerm.sh" <<'PRERM_EOF'
#!/bin/bash
set -e
case "$1" in
    remove|deconfigure)
        # Genuine uninstall. Stop and disable the units but leave
        # /opt/skywire alone: an operator running `apt remove`
        # (not `apt purge`) may reinstall later and expect their
        # identity / hypervisor accounts intact. postrm with
        # $1=purge is where the actual nuke happens.
        for _unit in skywire.service skywire-autoconfig.service \
                     skywire-sn.service skywire-ar.service \
                     skywire-rf.service skywire-tpd.service \
                     skywire-dmsgd.service skywire-dmsg.service \
                     skywire-sd.service dmsgpty-tcp.socket ; do
            systemctl stop "$_unit" 2>/dev/null || true
            systemctl disable "$_unit" 2>/dev/null || true
        done
        ;;
    upgrade|failed-upgrade)
        # No-op on upgrade. dpkg replaces files via unlink+rename,
        # so running processes keep the old binary inode mapped
        # until postinst's try-restart loop picks them up on the
        # new binary.
        ;;
esac
PRERM_EOF

  cat > "${srcdir}/postrm.sh" <<'POSTRM_EOF'
#!/bin/bash
set -e
case "$1" in
    purge)
        rm -rf /opt/skywire
        rm -f /etc/systemd/system/skywire.service.d/skywire-user.conf
        rmdir --ignore-fail-on-non-empty /etc/systemd/system/skywire.service.d 2>/dev/null || true
        ;;
    remove|upgrade|failed-upgrade|abort-install|abort-upgrade|disappear)
        # nothing: keep state for possible reinstall, and let the
        # in-progress upgrade complete normally.
        ;;
esac
systemctl daemon-reload 2>/dev/null || true
POSTRM_EOF
}
