# Maintainer: Alex Indigo <ai@aegis.one>

pkgname=otk-bin
epoch=1
pkgver=0.1.0beta1
_version=0.1.0-beta.1
pkgrel=1
pkgdesc='Open Terminal Kit, a browser UI for coding-agent backends (release binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/alexindigo/otk'
license=('LGPL-3.0-only')
depends=('glibc' 'libgcc')
optdepends=('opencode: coding-agent backend; connect OTK to your running server')
provides=('otk')
conflicts=('otk' 'otk-git')
options=('!strip' '!debug')
source_x86_64=("${url}/releases/download/v${_version}/otk-${_version}-x86_64-linux.tar.zst")
source_aarch64=("${url}/releases/download/v${_version}/otk-${_version}-aarch64-linux.tar.zst")
sha256sums_x86_64=('2e4677919e3111cf8a77ffcdf55c0f9ca75eae4c53c36e4ed529800bfd68c14c')
sha256sums_aarch64=('e89ec46e153e7f218bb0f588a538afad2fe51254e1ea1ccef4a64cde1cae61a0')

package() {
    cd "$srcdir"
    install -Dm755 otk "${pkgdir}/usr/bin/otk"
    install -Dm644 otk.service "${pkgdir}/usr/lib/systemd/user/otk.service"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/otk/README.md"
    install -Dm644 otk.toml.example "${pkgdir}/usr/share/doc/otk/otk.toml.example"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
