# Maintainer: silvertuanzi <126318157+silvertuanzi@users.noreply.github.com>

pkgname="panabit-iwan"
pkgver=2.4.3
pkgrel=1
pkgdesc='iWAN desktop VPN client. Unprivileged Flutter desktop UI and system-managed VPN backend.'
arch=("x86_64" "aarch64")
license=("unknown")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://download.gsase.com/app/linux/iwan_2.4.3_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::https://download.gsase.com/app/linux/iwan_2.4.3_arm64.deb")
sha256sums_x86_64=('0c63f2da8c657d5ea3e6c1a761dc668a0d42921be2522fdf47022cdd5d5cf013')
sha256sums_aarch64=('dcbeb86c9a9289f12a5e88dbeed24ec41a534cb488adab76b2f26268764479fd')
options=(!strip !debug)

package() {
    depends=('at-spi2-core' 'libayatana-appindicator' 'libepoxy' 'glibc' 'fontconfig' 'gtk3' 'pango' 'libsecret' 'systemd' 'desktop-file-utils' 'util-linux' 'polkit' 'hicolor-icon-theme')
    backup=('etc/iwan/config.yaml')

	bsdtar -xf data.tar.xz -C "$pkgdir/"
    find "$pkgdir/lib" -mindepth 1 -maxdepth 1 -exec mv -t "$pkgdir/usr/lib" -- {} +
    rm -rf "$pkgdir/lib"
}
