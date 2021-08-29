pkgname="execute-script-after-mount"
pkgver=1.0.r3.8093b6e
pkgdesc="This is a program to execute a command after a drive was mounted."
url="https://github.com/FernandAdam/execute-script-after-mount.git"
source=("git+$url")

sha512sums=("SKIP")
pkgrel=1
arch=("x86_64")
license=("custom")

package() {
	mkdir -p "${pkgdir}/usr/local/sbin"
	mkdir -p "${pkgdir}/etc/systemd/system"
	mkdir -p "${pkgdir}/var/log"
	mkdir -p "${pkgdir}/usr/local/lib"
	cp "${srcdir}/${pkgname}/execute-script-after-mount-init" "${pkgdir}/usr/local/sbin/execute-script-after-mount-init"
	chmod +x "${pkgdir}/usr/local/sbin/execute-script-after-mount-init"
	touch "${pkgdir}/etc/systemd/system/exec-script-after-mount.service"
	touch "${pkgdir}/usr/local/lib/script-after-mount.sh"
	touch "${pkgdir}/var/log/execute-script-after-mount-time.log"
}

pkgver() {
	cd "${_pkgname}"
	printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

