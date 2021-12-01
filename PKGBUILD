# Maintainer:  Mubashshir <ahmubashshir@gmail.com>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>
# from: github
# what: libvirt/libvirt
# match! -rc[0-9]+$

pkgname=libvirt-xen
pkgver=7.10.0
pkgrel=1
pkgdesc="API for controlling virtualization engines (openvz,kvm,qemu,virtualbox,xen,etc)"
arch=('x86_64')
url="https://libvirt.org/"
license=('LGPL' 'GPL3') #libvirt_parthelper links to libparted which is GPL3 only
install="libvirt.install"
depends=('fuse2' 'gnutls' 'libpciaccess' 'libssh' 'libxml2' 'numactl' 'parted' 'polkit' 'yajl' 'xen')
makedepends=('bash-completion' 'ceph-libs' 'dnsmasq' 'glusterfs' 'iproute2' 'libiscsi' 'libxslt'
			 'lvm2' 'meson' 'open-iscsi' 'python-docutils' 'qemu-headless' 'rpcsvc-proto' )
optdepends=('libvirt-storage-gluster: Gluster storage backend'
			'libvirt-storage-iscsi-direct: iSCSI-direct storage backend'
			'libvirt-storage-rbd: RBD storage backend'
			'gettext: required for libvirt-guests.service'
			'openbsd-netcat: for remote management over ssh'
			'dmidecode: DMI system info support'
			'dnsmasq: required for default NAT/DHCP for guests'
			'radvd: IPv6 RAD support'
			'ebtables: required for default NAT networking'
			'qemu: QEMU/KVM support'
			'lvm2: Logical Volume Manager support'
			'open-iscsi: iSCSI support via iscsiadm')

conflicts=('libvirt')
provides=("libvirt=$pkgver" 'libvirt.so' 'libvirt-admin.so' 'libvirt-lxc.so' 'libvirt-qemu.so')
backup=(
	'etc/conf.d/libvirtd'
	'etc/conf.d/libvirt-guests'
	'etc/conf.d/virtchd'
	'etc/conf.d/virtinterfaced'
	'etc/conf.d/virtlockd'
	'etc/conf.d/virtlogd'
	'etc/conf.d/virtlxcd'
	'etc/conf.d/virtnetworkd'
	'etc/conf.d/virtnodedevd'
	'etc/conf.d/virtnwfilterd'
	'etc/conf.d/virtproxyd'
	'etc/conf.d/virtqemud'
	'etc/conf.d/virtsecretd'
	'etc/conf.d/virtstoraged'
	'etc/conf.d/virtvboxd'
	'etc/conf.d/virtxend'
	'etc/libvirt/libvirt-admin.conf'
	'etc/libvirt/libvirt.conf'
	'etc/libvirt/libvirtd.conf'
	'etc/libvirt/libxl.conf'
	'etc/libvirt/libxl-lockd.conf'
	'etc/libvirt/lxc.conf'
	'etc/libvirt/nwfilter/allow-arp.xml'
	'etc/libvirt/nwfilter/allow-dhcp-server.xml'
	'etc/libvirt/nwfilter/allow-dhcpv6-server.xml'
	'etc/libvirt/nwfilter/allow-dhcp.xml'
	'etc/libvirt/nwfilter/allow-dhcpv6.xml'
	'etc/libvirt/nwfilter/allow-incoming-ipv4.xml'
	'etc/libvirt/nwfilter/allow-incoming-ipv6.xml'
	'etc/libvirt/nwfilter/allow-ipv6.xml'
	'etc/libvirt/nwfilter/allow-ipv4.xml'
	'etc/libvirt/nwfilter/clean-traffic-gateway.xml'
	'etc/libvirt/nwfilter/clean-traffic.xml'
	'etc/libvirt/nwfilter/no-arp-ip-spoofing.xml'
	'etc/libvirt/nwfilter/no-arp-mac-spoofing.xml'
	'etc/libvirt/nwfilter/no-arp-spoofing.xml'
	'etc/libvirt/nwfilter/no-ip-multicast.xml'
	'etc/libvirt/nwfilter/no-ipv6-multicast.xml'
	'etc/libvirt/nwfilter/no-ip-spoofing.xml'
	'etc/libvirt/nwfilter/no-ipv6-spoofing.xml'
	'etc/libvirt/nwfilter/no-mac-spoofing.xml'
	'etc/libvirt/nwfilter/no-mac-broadcast.xml'
	'etc/libvirt/nwfilter/no-other-l2-traffic.xml'
	'etc/libvirt/nwfilter/no-other-rarp-traffic.xml'
	'etc/libvirt/nwfilter/qemu-announce-self-rarp.xml'
	'etc/libvirt/nwfilter/qemu-announce-self.xml'
	'etc/libvirt/qemu.conf'
	'etc/libvirt/qemu-lockd.conf'
	'etc/libvirt/qemu/networks/default.xml'
	'etc/libvirt/virtchd.conf'
	'etc/libvirt/virtinterfaced.conf'
	'etc/libvirt/virtlockd.conf'
	'etc/libvirt/virtlogd.conf'
	'etc/libvirt/virt-login-shell.conf'
	'etc/libvirt/virtlxcd.conf'
	'etc/libvirt/virtnetworkd.conf'
	'etc/libvirt/virtnodedevd.conf'
	'etc/libvirt/virtnwfilterd.conf'
	'etc/libvirt/virtproxyd.conf'
	'etc/libvirt/virtqemud.conf'
	'etc/libvirt/virtsecretd.conf'
	'etc/libvirt/virtstoraged.conf'
	'etc/libvirt/virtvboxd.conf'
	'etc/libvirt/virtxend.conf'
	'etc/logrotate.d/libvirtd'
	'etc/logrotate.d/libvirtd.lxc'
	'etc/logrotate.d/libvirtd.libxl'
	'etc/logrotate.d/libvirtd.qemu'
	'etc/sasl2/libvirt.conf'
)
source=("https://libvirt.org/sources/${pkgname%*-xen}-$pkgver.tar.xz"{,.asc}
		"find_programs.ini")
sha256sums=('cb318014af097327928c6e3d72922e3be02a3e6401247b2aa52d9ab8e0b480f9'
            'SKIP'
            '735ac805fbf06021418f82297845babf481d5681bd939a6994fbdf36fe1661e4')
validpgpkeys=('453B65310595562855471199CA68BE8010084C9C') # Jiří Denemark <jdenemar@redhat.com>

prepare() {
	cd "${pkgname%*-xen}-${pkgver}"

	sed -i 's|/sysconfig/|/conf.d/|g' \
		src/remote/libvirtd.service.in \
		tools/{libvirt-guests.service,libvirt-guests.sh,virt-pki-validate}.in \
		src/locking/virtlockd.service.in \
		src/logging/virtlogd.service.in
	sed -i 's|/usr/libexec/qemu-bridge-helper|/usr/lib/qemu/qemu-bridge-helper|g' \
		src/qemu/qemu.conf \
		src/qemu/test_libvirtd_qemu.aug.in

	sed -i 's/notify/simple/' src/remote/libvirtd.service.in
}

build() {
	cd "${pkgname%*-xen}-$pkgver"

	arch-meson build \
		--libexecdir=lib/libvirt \
		--native-file "$srcdir"/find_programs.ini \
		-Drunstatedir=/run \
		-Dqemu_user=nobody \
		-Dqemu_group=kvm \
		-Dnetcf=disabled \
		-Dopenwsman=disabled \
		-Dapparmor=disabled \
		-Dapparmor_profiles=disabled \
		-Dselinux=disabled \
		-Dwireshark_dissector=disabled \
		-Ddriver_bhyve=disabled \
		-Ddriver_hyperv=disabled \
		-Ddriver_libxl=enabled \
		-Ddriver_vz=disabled \
		-Dsanlock=disabled \
		-Dsecdriver_apparmor=disabled \
		-Dsecdriver_selinux=disabled \
		-Dstorage_sheepdog=disabled \
		-Dstorage_vstorage=disabled \
		-Ddtrace=disabled \
		-Dnumad=disabled \
		-Dstorage_zfs=enabled \
		-Dstorage_rbd=enabled

	ninja -C build
}

check() {
	cd "${pkgname%*-xen}-$pkgver"

	ninja -C build test
}

package() {
	cd "${pkgname%*-xen}-${pkgver}"

	DESTDIR="$pkgdir" ninja -C build install

	mv "$pkgdir"/etc/{sysconfig,conf.d}
	mkdir "$pkgdir"/usr/lib/{sysusers,tmpfiles}.d
	echo "g libvirt - -" > "$pkgdir/usr/lib/sysusers.d/libvirt.conf"
	echo "z /var/lib/libvirt/qemu 0751" > "$pkgdir/usr/lib/tmpfiles.d/libvirt.conf"

	chown 0:102 "$pkgdir/usr/share/polkit-1/rules.d"
	chmod 0750 "$pkgdir/usr/share/polkit-1/rules.d"
	chmod 600 "$pkgdir"/etc/libvirt/nwfilter/*.xml \
		"$pkgdir/etc/libvirt/qemu/networks/default.xml"

	# Strip auto-generated UUID, so it will be generated per-install. (reproducible builds)
	sed -i 's|<uuid>.*</uuid>|<uuid></uuid>|' "$pkgdir"/etc/libvirt/qemu/networks/default.xml

	rm -rf \
		"$pkgdir/run" \
		"$pkgdir/var/lib/libvirt/qemu" \
		"$pkgdir/var/cache/libvirt/qemu"
	rm -f "$pkgdir/etc/libvirt/qemu/networks/autostart/default.xml"
	rm "$pkgdir"/usr/lib/libvirt/storage-backend/libvirt_storage_backend_{rbd,gluster}.so
	rm "$pkgdir/usr/lib/libvirt/storage-backend/libvirt_storage_backend_iscsi-direct.so"
	rm "$pkgdir/usr/lib/libvirt/storage-file/libvirt_storage_file_gluster.so"
}

