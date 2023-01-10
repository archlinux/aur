# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=hyprland-autoname-workspaces-bin
_pkgname=${pkgname%-bin}
pkgver=1.1.0
pkgrel=1
pkgdesc='Hyprland autoname workspace.'
arch=('x86_64' 'aarch64')
url="https://github.com/cyrinux/${_pkgname}"
license=('ISC')
depends=('glibc' 'otf-font-awesome' 'hyprland')
conflicts=("hyprland-autoname-workspaces-git" "hyprland-autoname-workspaces")
provide=("hyprland-autoname-workspaces")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz"
    "${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz.sig")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_Linux_aarch64.tar.gz"
    "${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_Linux_aarch64.tar.gz.sig")
validpgpkeys=('4F7BC1FD97170A79267686A6FC9B1319726657D3', 'C5DFDE230E7B3DA1E6B5D5316A11D19BDD5F8B5E')
sha256sums_x86_64=('68e3965a4b2250579af2893a101ce062ccfe2b3c8f2884563ef4a90a3e9dfcf1'
                   'SKIP')
sha256sums_aarch64=('45ef7211fff9b0230bd2b7c8569597f44b30b976d68f5c30a201fe541d0a3ae7'
                    'SKIP')

package() {
    install -D -m0755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
    install -D -m0644 ${_pkgname}.service "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
}
