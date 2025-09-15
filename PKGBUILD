# Maintainer: nicknb <nicknb at posteo dot com>
_projectname=podman-tui
pkgname=$_projectname-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="Podman Terminal UI"
arch=("x86_64")
url="https://github.com/containers/$_projectname"
license=("Apache-2.0")
provides=("$_projectname")
conflicts=("$_projectname")
source=("$_projectname-$pkgver.zip::$url/releases/download/v$pkgver/${_projectname}-release-linux_amd64.zip"
        "$_projectname-LICENSE::https://raw.githubusercontent.com/containers/podman-tui/refs/tags/v$pkgver/LICENSE"
        "$_projectname-README::https://raw.githubusercontent.com/containers/podman-tui/refs/tags/v$pkgver/docs/README.md"
        "$_projectname-install::https://raw.githubusercontent.com/containers/podman-tui/refs/tags/v$pkgver/docs/install.md")
b2sums=('b32e24c301b0b3e5134942fb41309efdeeaadce3861f659a75cc48ed10d34c0eaabd141981c76862473346257cb605dae93f6baf02181479cee09dd4314abb64'
        '43452dd4216bba835bff542c02fcd0a80b77fef97a6f1042adcbbbcf312bb856b0707c35b2f1af356e0b4262e501a159f06bf1f947f182d0023cdd4aefbd8a85'
        'cef3fb0a613eadcabead86a00c809426f16400fda46ba19dde5d1d295606ea5b38a1fe834ded2e166c55bf2bcf170da4c2b707170a089d2176fcbda5230442b2'
        '0b4405543941caad7e29dee704f4345409500dd0b008b54ea3d40c07320f60d1f18fb9d0522c1ef4b11c2e60b68764baec741e4105e7fea947bc87aa8849dc96')

package() {
    install -Dm 644 "$_projectname-LICENSE" "$pkgdir/usr/share/licenses/$_projectname/LICENSE.md"
    install -Dm 644 "$_projectname-README" "$pkgdir/usr/share/doc/$_projectname/README.md"
    install -Dm 644 "$_projectname-install" "$pkgdir/usr/share/doc/$_projectname/install.md"
    cd "$_projectname-release-linux_amd64/${_projectname}-${pkgver}"
    install -Dm 755 "$_projectname" "$pkgdir/usr/bin/$_projectname"
}
