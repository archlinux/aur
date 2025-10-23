# Maintainer: ioalexander <io.alexander.io@pm.me>
pkgname=imv-rs-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple Image Viewer built with Rust and egui"
arch=('x86_64')
url="https://github.com/ioalexander/imv-rs"
license=('MIT')
provides=('imv-rs')
conflicts=('imv-rs' 'imv-rs-git')
depends=('glibc' 'xdg-utils' 'shared-mime-info')

source=("${pkgname}-${pkgver}::https://github.com/ioalexander/imv-rs/releases/download/latest/imv-rs")
sha256sums=('SKIP')

package() {
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/imv-rs"

	install -d "${pkgdir}/usr/share/applications"
	cat <<EOF >"${pkgdir}/usr/share/applications/imv-rs.desktop"
[Desktop Entry]
Name=imv-rs
GenericName=Image Viewer
Comment=Simple Image Viewer built with Rust and egui
Exec=imv-rs %f
Terminal=false
Type=Application
MimeType=image/png;image/jpeg;image/webp;image/bmp;image/gif;image/tiff;image/x-xcf;image/x-icon;
Categories=Graphics;Viewer;
Icon=imv-rs
StartupNotify=true
EOF
}
