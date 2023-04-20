# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=easyrp-bin
pkgver=3.0
pkgrel=2
pkgdesc="Give yourself a Custom Rich Presence in Discord. "
arch=('x86_64')
url="https://github.com/Pizzabelly/EasyRP"
license=('MIT')
depends=()
makedepends=()
optdepends=()
provides=('easyrp')
conflicts=('easyrp' 'easyrp-git')
source=("https://github.com/Pizzabelly/EasyRP/releases/download/v${pkgver}/EasyRP-v${pkgver}-linux.tar.gz")
sha256sums=('5c8e9a0ced691afd881b258285e0b87b0a30ae136997c19d60b09a6600556ba9')


package() {
    cd "EasyRP-v${pkgver}-linux"
    _name="${pkgname%-bin}"
    _dest="${pkgdir}/opt/${_name}"
    # binary
    install -D -t "${_dest}" ${_name}
    # extra files
    install -Dm644 -t "${_dest}" config.ini readme.txt
    # binary symlink
    _bin="${pkgdir}/usr/bin"
    install -dm644 "${_bin}"
    ln -s "${_dest}/${_name}" "${_bin}/${_name}"
}
