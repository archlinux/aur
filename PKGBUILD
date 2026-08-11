# Maintainer: psi4j <116757358+psi4j@users.noreply.github.com>

pkgname=sunsetr-bin
_realname=sunsetr
pkgver=0.12.5
pkgrel=1
pkgdesc="Automatic blue light filter for Hyprland, Niri, and everything Wayland (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/psi4j/sunsetr"
license=('MIT')
depends=('wayland')
provides=('sunsetr')
conflicts=('sunsetr' 'sunsetr-git')
replaces=('sunsetr-git-debug')
options=('!debug')

_github_asset_filename="${_realname}-v${pkgver}-x86_64-linux.tar.gz"
_extracted_dir_name="${_realname}-v${pkgver}"

_local_tarball_name="${_realname}-${pkgver}-x86_64-linux.tar.gz"

source=("${_local_tarball_name}::${url}/releases/download/v${pkgver}/${_github_asset_filename}")
sha256sums=('a353ad1c59e737f66326c28da2f67d473243f51ab6a8426f17c779eb8b8461d7')

package() {

    install -Dm755 "${srcdir}/${_extracted_dir_name}/${_realname}" \
                    "${pkgdir}/usr/bin/${_realname}"

    install -Dm644 "${srcdir}/${_extracted_dir_name}/LICENSE" \
                    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "${srcdir}/${_extracted_dir_name}/${_realname}.service" \
                    "${pkgdir}/usr/lib/systemd/user/${_realname}.service"

    install -Dm644 "${srcdir}/${_extracted_dir_name}/README.md" \
                    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=4 sw=4 et:
