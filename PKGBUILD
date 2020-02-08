# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: exprez135 <exprezdev at pm dot me>

pkgname=protonvpn-cli-ng-git
_src_name=protonvpn-cli-ng
pkgver=2.2.1
pkgrel=1
pkgdesc="ProtonVPN CLI tool for protonvpn.com"
arch=("any")
url="https://github.com/ProtonVPN/protonvpn-cli-ng"
license=("GPLv3")
depends=("openvpn" "python" "dialog" "python-pythondialog" "python-setuptools" "python-docopt" "python-requests")
replaces=("protonvpn-cli")
conflicts=("${_src_name}")
provides=("${_src_name}")
source=("git+https://github.com/ProtonVPN/protonvpn-cli-ng")
md5sums=("SKIP")

package() {
    # Install protonvpn-cli-ng package
    cd "${_src_name}"
    python setup.py install --optimize=1 --root="$pkgdir"

    install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
